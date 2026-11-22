# Refreshi – web-first checkout slice

Flutter checkout slice for web, iOS and Android. Pick one or two services and a
time, confirm with a saved card, and watch the temporary hold go from pending
to placed. No backend: the GraphQL schema and data live in the repo.

Design and trade-offs are in [SOLUTION.md](SOLUTION.md).

## Requirements

- Flutter 3.35+ (Dart 3.9+)
- Chrome
- iOS Simulator
- Android Emulator

## Installation

**1. Clone the repo**

```bash
git clone https://github.com/vdmerwefm/refreshi.git
cd refreshi
```

**2. Activate melos**

```bash
dart pub global activate melos
```

If `melos` isn't found afterwards, add `~/.pub-cache/bin` to your `PATH`.

**3. Run setup** (installs deps, generates code, creates the ios/android folders)

```bash
melos setup
```

**4. Run on web**

```bash
melos web
```

To run on a phone use `flutter run`. On a physical iPhone use
`flutter run --release`, debug builds only work while attached to the debugger.

**Demo sign in:** `admin` / `admin` (pre-filled).

## Tests

```bash
melos test
```
