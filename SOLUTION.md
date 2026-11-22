# Solution

## Architecture

```
UI (pages/widgets)
   │  events / state   (flutter_bloc)
   ▼
RefreshiBloc (checkout)           presentation
RefreshiOrderBloc (order page)
AuthBloc
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

- **UI and state.** Widgets dispatch events and render state, that's it.
  Anything that needs to be calculated sits in the bloc: selection rules, the
  order total, bookable time slots, idempotency keys and polling. The total and
  the schedule slots started out in the widgets and I moved them into
  `RefreshiBloc`, so the widgets now just read `state.orderTotal` and
  `state.scheduleSlots`.
- **Dependencies.** get_it with injectable. Everything
  is constructor injected and the repo is registered against `IRefreshiRepo`, so
  swapping in a real backend, or a fake for tests, doesn't touch the bloc or the
  UI. App wide blocs get provided once in `AppProviders`.
- **Typed GraphQL.** Schema and operations live in the repo and
  `graphql_codegen` generates everything from them, including the typed client
  calls (`query$GetOrder`, `mutate$CreateOrder`). The repo maps the generated
  types into domain DTOs, so app code never deals with `Map<String, dynamic>`.
  Generated files aren't committed (see
  README).
- **No backend.** `RefreshiGqlLink` is just a `Link`, the same spot a real
  `HttpLink` would sit. It switches on the operation name and answers from
  `RefreshiLocalStorage`. Moving to a real server means swapping the link,
  having an actual end point would allow us to facilitate modeling a raw model and likely using dio-linking. 
- **UI structure.** Pages are kept thin. Their widgets sit in `part` files
  under `widgets/<feature>/`. Shared bits are
  `RefreshiButton`, `RefreshiFormatters` for money and dates, and
  `RefreshiScheduleHelper` for the slot logic.

## Navigation (go_router)

Routes: `/` (checkout), `/sign-in` and `/orders/:orderId`.

- **URL is the source of truth.** The order page only gets `orderId` from the
  path and fetches the order itself, so a deep link, a refresh or a new tab all
  land on the same screen. Nothing relies on in-memory navigation args.
- **What needs sign in.** Browsing and building a checkout is public. Order
  routes are protected like the brief asks, and placing the hold needs sign in
  too: hitting Confirm while signed out goes to `/sign-in?from=/` and brings you
  back to checkout with your selection still there. Signing out resets the
  checkout.
- **Auth redirect.** One top level `redirect` checks `AuthBloc`. Signed out on
  an order route sends you to `/sign-in?from=<where you were going>`, and once
  you sign in the same redirect sends you back to `from`. Keeping `from` in the
  URL instead of memory means it still works if the sign in page gets
  refreshed. `from` has to be an in-app path, so it can't be used as an open
  redirect. The router listens to the auth bloc's stream (`refreshListenable`),
  so signing in or out re-evaluates the route straight away.
- **Path URLs.** `usePathUrlStrategy` gives `/orders/123` instead of
  `/#/orders/123`.
- **Why not auto_route.** I tried it first since it's what I normally use. On
  Flutter 3.35 with this codegen stack (freezed 3, injectable 3,
  json_serializable 6.9+) no version resolved: auto_route 11 needs a newer
  Flutter and the older generator needs an older analyzer. go_router has no
  codegen so the conflict goes away, and its URL based redirect fits the deep
  link requirement anyway.

## Repeated actions and refresh (no duplicate holds)

A few layers that each stop most of it on their own, together they cover the
edge cases.

1. **Confirm disables itself.** It greys out and shows a spinner while an order
   is being placed.
2. **The bloc drops repeats.** `CreateRefreshiOrder` uses `droppable()` from
   bloc_concurrency and the handler also bails out if `isLoading`, so no matter
   how many times it gets dispatched only one request goes out.
3. **Idempotency key per cart, not per click.** The key gets created with the
   draft and only changes when the services or the time slot change, since a
   different cart is a different purchase. My first version made a new UUID on
   every click, which made the whole thing pointless.
4. **The draft survives a refresh.** `RefreshiBloc` is a `HydratedBloc` but only
   persists the draft: selected services, time slot and the key. Services and
   orders always come from GraphQL. Refresh mid-submit, hit Confirm again and the
   same key gets sent.
5. **The data source dedupes.** `createOrder` looks up the key (persisted with
   the orders) and hands back the existing order instead of making a new one.
   There's no `await` between that check and the insert, so two requests with
   the same key can't both get through.
6. **Navigation replaces history.** After success it's `context.go` to
   `/orders/<id>`, which replaces checkout instead of pushing on top of it, and
   the draft resets. Back or refresh on the order page is only ever a read, and
   the next booking starts with a fresh key.

`test/presentation/refreshi_bloc_test.dart` covers it: three quick confirms,
then a second bloc hydrated from the same storage (a simulated refresh)
confirming again. It checks there's one order ID and one stored order.

**Trade-offs.**
- The key lives in the browser. Clear storage or switch device mid-submit and a
  retry gets a new key. A real backend would also dedupe on something like
  customer + cart + slot inside a short window.
- Reusing a key with a different payload just returns the original order.
  Stripe style APIs reject that with an error, I left it out to keep scope small.
- Two tabs share storage but each has its own bloc, so the drafts can drift.
  The dedupe at the data source still stops a double hold for the same key.

## Asynchronous hold confirmation

An order gets created as `CAPTURED` (shown as "Hold pending") and moves to
`HOLD_PLACED` after a fake 3 second delay from the payment provider. On the
order page the "Hold placed" tile shows a spinner and goes green once it's
confirmed. `CAPTURED` really means hold pending here and should be renamed in
the schema, I left it to avoid churning the generated types.

- **Data source.** A timer works in memory, but it dies if the browser
  refreshes inside those 3 seconds and the order would sit on pending forever.
  So `getOrderById` also settles the hold from `createdAt + 3s` whenever it
  reads an order. No timer needed, it's safe to run more than once, and it
  saves the settled state.
- **Client.** The order page has its own `RefreshiOrderBloc`, created with the
  page and keyed on the order ID. It polls `GetOrder` (`networkOnly`) once a
  second while the hold is pending and stops once it's placed. Leaving the page
  closes the bloc, which stops the polling, so there's nothing to clean up by
  hand. With a real backend this would be a GraphQL subscription or a push
  channel. Polling is contained in the bloc, so swapping it out wouldn't touch
  the UI.

## UI and web UX

- **Look.** Went with a brutalist style: square boxes, a solid black border and
  a hard black shadow with no blur. Selection is shown by colour, the box goes
  teal, rather than checkboxes or ticks, and taps have no ink splash. Every
  button is the same `RefreshiButton`, so the borders line up everywhere.
- **Theme.** Colours are set directly in the theme instead of generated per
  device. Text and dividers are black so they pop.
- **Layout.** Checkout goes two columns at 900px and wider, catalog and
  schedule on the left and the summary beside it, single column below that.
  Content is width capped so it doesn't stretch on big monitors.
- **Sign out.** On web it sits in the app bar. On mobile it's a button under
  the order summary, and tapping it scrolls back to the top and resets the
  checkout so the page doesn't just jump.
- **Sign in** supports autofill and submits on Enter. Wrong details show an
  error under the password box.
- **Not found.** An unknown route or order ID shows a not found page with a way
  back to checkout.

## Optional item: tests

Went with tests over a web performance tweak. The riskiest part of the brief is
not charging someone twice, and you can't really prove that by clicking around
the app.

- `refreshi_bloc_test.dart` hits Confirm three times quickly, then simulates a
  refresh mid-submit and confirms again, and checks there's still only one
  order. It also checks that changing the cart gives a new key and that you
  can't pick more than two services.
- `refreshi_order_bloc_test.dart` places an order, checks it starts as pending,
  then waits for it to flip to placed once the hold confirms. It also checks an
  unknown order ID comes back as `OrderNotFoundException`.
- `refreshi_repo_test.dart` creates an order and fetches it back through the
  typed GraphQL client, so the whole data layer gets exercised end to end.

## AI usage

**Tool:** Claude Code (Anthropic), in VS Code.

**Where it was used**
- **Days 1 to 3, me.** I built the data side myself: the GraphQL schema and
  operations, the codegen setup, the custom `Link` that resolves operations
  in-app, the local store with the idempotency dedupe, the repo, use cases,
  mappers and DI, and the first versions of both blocs.
- **Last session, Claude Code.** I used it to finish the slice: the routing and
  auth redirect, a first pass of the pages, fixes in the bloc and the data
  source, the tests, and first drafts of the README and this doc.

**Accepted**
- It spotted that my confirm handler made a new UUID on every click, so the
  dedupe in the data source never kicked in on a double click. I kept the fix:
  one key per cart, persisted with the draft.
- Settling the hold from `createdAt` when an order is read, instead of only on
  a timer, so a refresh during the 3 seconds doesn't leave it pending forever.

**Rejected**
- Its first move was to restructure my project: moving the repo interface and
  implementation between `data/` and `domain/`, deleting `RefreshiBloc` for two
  new blocs and changing the schema enums. I stopped it and reverted all of it.
  I wanted the slice finished on top of my architecture, not redesigned.

**Changed**
- **Persistence.** I pulled persistence back to just the login, then put the
  checkout draft back once it was clear the brief's refresh mid-checkout case
  needs it.
- **Router.** I wanted auto_route since it's what I normally use. It wouldn't
  resolve with this codegen stack on Flutter 3.35, so I went with go_router.
- **UI.** Its pages were generic Material. I redid them in my own brutalist
  style: square boxes with hard shadows, selection by colour instead of ticks,
  one shared `RefreshiButton`, fixed theme colours. Sign in only kicks in when
  you place the hold, and sign out sits under the summary on mobile.
- **Where logic lives.** The order total and the schedule slots were being
  worked out in widgets. I moved both into the bloc and pulled the slot logic
  into `RefreshiScheduleHelper`.
- **Splitting the bloc.** I'd started with one bloc for checkout and order
  details to move fast. I split order details out into `RefreshiOrderBloc`,
  scoped to the order page, so checkout and the order page each own their own
  state and polling dies with the page.
- **Errors.** Swapped the empty order the repo used to return for a typed
  `OrderNotFoundException`, and cleared out state fields nothing was using.
- **Structure and comments.** I split the pages into `part` widget files,
  untracked generated code and the native folders, and rewrote the comments the
  way I write them.

**How I checked it**
- `flutter analyze` is clean and the bloc and repo tests pass.
- Ran it in Chrome and went through: double clicking Confirm, refreshing while
  the hold is pending, opening an order link signed out and signing in, going
  back after an order, and an unknown order ID.
- Went through its changes to my code before keeping them, and reverted what I
  didn't want.
