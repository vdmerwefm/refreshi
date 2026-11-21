# Refreshi – web-first checkout slice

A Flutter (web + iOS/Android) checkout slice. Pick one or two services, choose a
time slot and confirm with a saved card. The app places a temporary hold and
opens an order details page. That page shows the hold as pending and updates
when the (simulated) payment provider confirms it.

Everything runs in-app. The GraphQL schema and operations live in the repo, and
a custom `Link` resolves them against a local data source, so there is no
backend to start.

See [SOLUTION.md](SOLUTION.md) for design decisions and trade-offs.

## Requirements

- Flutter 3.35+ (Dart 3.9+)
- Chrome for web. An iOS simulator or Android emulator is optional.

## Run

```bash
flutter pub get
dart run build_runner build      # GraphQL types, freezed, json, injectable
flutter run -d chrome            # web (primary target)

# iOS / Android: the native folders aren't committed, so generate them once
flutter create --platforms=ios,android .
flutter run
```

Generated files (`*.graphql.dart`, `*.freezed.dart`, `*.g.dart`,
`injection.config.dart`) are not committed, so run `build_runner` once after
cloning. Run it again after you change a `.graphql` file, a bloc event or
state, or an `@injectable` class.

**Demo sign-in:** `admin` / `admin` (pre-filled).

## Things to try

| Scenario | What happens |
| --- | --- |
| Press **Confirm** while signed out | Goes to sign-in, then back to checkout with the selection kept |
| Open `/orders/<id>` while signed out | Redirects to `/sign-in?from=/orders/<id>`, then returns to that order after sign-in |
| Refresh on `/orders/<id>` | The page is rebuilt from the URL and the order is re-fetched |
| Refresh within 3s of confirming | The hold still confirms. Confirmation is derived from `createdAt`, so it doesn't rely on a timer |
| Double-click **Confirm** | One order. The button disables, the bloc drops repeats, and the data source dedupes on the idempotency key |
| Refresh while the order is submitting, then confirm again | Same order. The draft and its idempotency key are persisted |
| Browser Back from the order page | Goes back to checkout and doesn't re-submit |

## Test

```bash
flutter test
```

- `test/presentation/refreshi_bloc_test.dart` tests double-click and refresh
  mid-submit. The result must be exactly one order.
- `test/widget_test.dart` tests a signed-out deep link: it goes to sign-in and
  then back to the original link.
- `test/domain/refreshi_repo_test.dart` runs create and fetch through the typed
  GraphQL client.

## Deploying the web build

```bash
flutter build web --release
```

The app uses path URLs (`/orders/123`, not `/#/orders/123`). A static host must
therefore send every unknown path to `index.html` (an SPA fallback), or
refreshing a deep link will 404. `flutter run -d chrome` already does this.

## Project layout

```
lib/
  app/                     # app shell (mirrors pokemon_base): router, providers, MaterialApp
  core/error/              # typed failures
  data/
    graphql/refreshi_gql/  # schema.graphql + operations.graphql (+ generated *.graphql.dart)
    graphql/refreshi_gql_link/  # Link that resolves operations in-app
    graphql/refreshi_storage/   # local source of truth (SharedPreferences)
    i_refreshi_repo/       # repository interface
  domain/                  # repository impl, mappers, DTOs, use cases
  di/                      # get_it + injectable
  presentation/
    bloc/                  # RefreshiBloc (checkout draft + order details)
    cubit/                 # AuthBloc (simulated sign-in)
    pages/ widgets/        # UI
```
