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

**5. Run on a simulator or emulator (optional)**

Start a device first:

```bash
open -a Simulator             # iOS Simulator
flutter emulators --launch <id>   # Android emulator, `flutter emulators` lists the ids
```

Then in VS Code pick the device in the status bar (bottom right), open the
**Run and Debug** tab and launch:

- **refreshi (simulator / emulator)** for the iOS Simulator or Android emulator
- **refreshi (physical device)** for a real phone. It runs in release mode, an
  iPhone won't open a debug build once the debugger disconnects.

From the terminal it's `flutter run` (simulator / emulator) or
`flutter run --release` (physical device).

**Demo sign in:** `admin` / `admin` (pre-filled).

## Tests

```bash
melos test
```
