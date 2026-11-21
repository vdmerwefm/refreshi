# Solution

## Architecture

```
UI (pages/widgets)
   │  events / state   (flutter_bloc)
   ▼
RefreshiBloc, AuthBloc            presentation
   │
RefreshiUseCases                  domain    (returns Either<RefreshiFailure, T>)
   │
IRefreshiRepo ◄─ RefreshiRepo     typed GraphQL operations → domain DTOs (mappers)
   │
GraphQLClient (graphql)           cache + typed codegen helpers (query$GetOrder …)
   │
RefreshiGqlLink                   resolves operations in-app instead of over HTTP
   │
RefreshiLocalStorage              source of truth, persisted in SharedPreferences
```

- **UI vs. application state.** Widgets only dispatch events and render state.
  Selection rules, idempotency keys, polling and validation all live in the bloc
  or below it.
- **Dependencies.** I used get_it with injectable, as in my existing
  `pokemon_base` app. Everything is constructor-injected. The repository is
  registered against `IRefreshiRepo`, so a real HTTP-backed implementation, or a
  fake in tests, can replace it without touching the bloc or the UI. App-wide
  blocs are provided once in `AppProviders`, with the same pattern as Pokémon.
- **Typed GraphQL.** `schema.graphql` and `operations.graphql` live in the repo.
  `graphql_codegen` generates the request, response and variable classes and the
  typed client extensions (`query$GetOrder`, `mutate$CreateOrder`). The repo
  maps generated types into domain DTOs, so the app code never touches
  `Map<String, dynamic>`.
- **No backend.** `RefreshiGqlLink` is a `Link` (the same extension point a
  real `HttpLink` uses). It switches on the operation name and answers from
  `RefreshiLocalStorage`. To move to a real server, swap the link: everything
  above it stays the same.

## Navigation (go_router)

Routes: `/` (checkout), `/sign-in`, and `/orders/:orderId`.

- **The URL is the source of truth.** The order details page receives only
  `orderId` from the path and fetches the order itself. A deep link, a refresh
  or a new tab therefore renders the same screen. Nothing depends on in-memory
  navigation arguments.
- **What needs sign-in.** Browsing the catalog and building a checkout is
  public. Order routes (`/orders/...`) are protected, as the brief asks. Placing
  the hold also requires sign-in: pressing Confirm while signed out goes to
  `/sign-in?from=/`, and the user returns to checkout with their selection kept.
- **Auth redirect.** A single top-level `redirect` checks `AuthBloc` and sends a
  signed-out user who opens an order route to
  `/sign-in?from=<original location>`. Once they sign in, the
  same redirect sends them to `from`. Because `from` is stored in the URL rather
  than in memory, the return trip still works if the sign-in page itself is
  refreshed. `from` must be an in-app path, which prevents open redirects. The
  router listens to the auth bloc's stream (`refreshListenable`), so signing in
  or out re-evaluates the current route straight away.
- **Path URLs** (`usePathUrlStrategy`) give `/orders/123` instead of
  `/#/orders/123`.
- **Why not auto_route, which my Pokémon app uses?** I tried it first. With
  Flutter 3.35 and this project's codegen stack (freezed 3, injectable 3,
  json_serializable 6.9+) there was no auto_route version that resolved.
  auto_route 11 needs a newer Flutter, and the older auto_route_generator needs
  an older analyzer and source_gen. go_router needs no code generation, so it
  avoids the conflict. Its URL-based redirect also suits the deep-link
  requirement well.

## Repeated actions and refresh (no duplicate holds)

Defence in depth: each layer would be enough for most cases on its own, and
together they cover the edge cases.

1. **The UI disables Confirm** while a submission is in flight and shows a
   spinner.
2. **The bloc drops repeats.** `CreateRefreshiOrder` uses bloc_concurrency's
   `droppable()` transformer, and the handler also returns early if `isLoading`.
   Repeated clicks, Enter-key repeats, or any other caller dispatching twice
   produce one request.
3. **Idempotency key per purchase intent.** The key is generated when the draft
   is created and replaced only when the cart or the time slot changes. A
   different cart is a different purchase. It is not generated per click: the
   old code made a fresh UUID per click, which defeats the purpose.
4. **The draft survives a refresh.** `RefreshiBloc` is a `HydratedBloc` that
   persists only the draft: selected services, slot and idempotency key.
   Services and orders are never cached there; they are always re-fetched. If
   the page is refreshed mid-submit and the user confirms again, the same key is
   sent.
5. **The data source dedupes.** `createOrder` looks up the idempotency key
   (persisted alongside the orders) and returns the existing order instead of
   creating a new one. No `await` happens between that check and the insert, so
   two concurrent requests with the same key can't both pass.
6. **Navigation replaces the history entry.** After success the app calls
   `context.go('/orders/<id>')`, which replaces the history entry rather than
   pushing one, and resets the draft. Back or refresh on the details page is
   only ever a read. A new booking starts with a new key.

Covered by `test/presentation/refreshi_bloc_test.dart`: three rapid confirms,
then a second bloc instance hydrated from the same storage (a simulated refresh)
confirming again. The test asserts one order ID and one persisted order.

**Trade-offs and limits.**
- The key lives in the browser. If storage is cleared, or the user switches
  device mid-submit, a retry gets a new key. A real backend would also dedupe on
  something like `(customer, cart hash, slot)` within a short time window.
- Reusing a key with a *different* payload silently returns the original order.
  Stripe-style APIs reject that with an error instead. I left this out to keep
  the scope small.
- Two browser tabs share storage. Each tab's bloc has its own in-memory copy of
  the draft, so a conflict is theoretically possible. The dedupe at the data
  source still prevents a double hold for the same key.

## Asynchronous hold confirmation

An order is created with status `CAPTURED` (shown as "Hold pending") and moves
to `HOLD_PLACED` after a simulated 3s provider delay.

- **Data source.** A timer was enough in memory, but it is lost if the browser
  refreshes within those 3 seconds, and the order would then stay pending
  forever. So `getOrderById` also derives the confirmation from
  `createdAt + 3s` when it reads an order. This is idempotent, persists the
  settled state, and needs no timer.
- **Client.** `GetRefreshiOrder` polls `GetOrder` (with `networkOnly`) once a
  second while the hold is pending and stops once it is placed. The bloc
  remembers which order it is polling, so opening another order stops the
  previous loop, and polling also stops when the bloc closes. In production I'd use a GraphQL
  subscription or a push channel. Polling stays inside the bloc, so switching
  would not affect the UI.

## Web UX notes

- The checkout uses a responsive two-column layout at 900px and wider: the
  catalog and schedule on the left and a summary card beside it. Below 900px
  everything is in a single column.
- Content is width-capped for large monitors. The sign-in form supports
  autofill hints and submits on Enter.
- An unknown route or order ID shows a "not found" page with a way back.

## Optional item: tests

I chose **tests** over a web performance tweak, because the brief's riskiest
requirement (no duplicate financial outcomes) is behaviour that can't be checked
by looking at the app.

- `refreshi_bloc_test.dart` covers double-clicks and a refresh mid-submit. It
  also checks that changing the cart rotates the key and that there is a
  maximum of two services.
- `widget_test.dart` covers a signed-out deep link: it goes to sign-in and then
  back to the exact link.
- `refreshi_repo_test.dart` runs create and fetch through the typed client.

## What I'd do next

- Move the checkout draft into the URL query (`?services=001,002&slot=…`) so a
  checkout can be shared.
- Reject idempotency-key reuse with a different payload.
- Use a GraphQL subscription for hold status.
- Split `RefreshiBloc` into checkout and order-details blocs as the app grows.
- Defer-load the order page and run a `--wasm` build for web start-up time.

## AI usage

> ✏️ **Malan: review this section and make it your own before submitting.
> It has to be accurate about how *you* worked.**

**Tools:** Claude Code (Anthropic), used in VS Code.

**Where it was used**
- *Implementation and planning, days 1–3 (me):* [describe your own use here, if
  any: e.g. schema design, the custom Link, repo/mappers, blocs].
- *Finishing, final session (Claude Code):* the go_router setup and auth
  redirect, the checkout and order-details UI, the bloc fixes (selection,
  idempotency key handling, polling), the timer-free hold settlement, the tests,
  and drafts of the README and SOLUTION.

**Accepted:**
- The diagnosis that the idempotency key was regenerated on every confirm click
  (`Uuid().v4()` inside the event handler), so the dedupe at the data source
  never triggered on a double-click. I accepted moving the key into the
  persisted checkout draft.
- Deriving hold confirmation from `createdAt` on read, so a refresh during the
  3-second delay doesn't leave the order pending forever.

**Rejected:**
- The AI's first pass started restructuring the project: moving the repo
  interface and implementation between `data/` and `domain/`, deleting
  `RefreshiBloc` to replace it with two new blocs, and changing the schema
  enums. I rejected all of it and reverted. I wanted the slice finished on top
  of my existing architecture rather than redesigned. Splitting the bloc is now
  listed under "What I'd do next".

**Changed:**
- [add one of your own, e.g. a widget or naming change you made to its output].

**How I verified it**
- `flutter analyze` and `flutter test` pass (the tests above).
- Manual run in Chrome:
  - a double-click on Confirm;
  - a refresh during the pending state;
  - a deep link to `/orders/<id>` while signed out, then signing in;
  - Back after an order;
  - an unknown order ID.
- I read every diff to my own files before accepting it.
