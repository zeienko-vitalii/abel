Use FVM for all Flutter/Dart commands (`fvm flutter` / `fvm dart`). Prefer `just` recipes — they already wrap fvm.

After a change:

- `just check`
- `just test test/widget_test.dart` (swap path for the tests that changed)

When models or generated classes change: `just gen`

Before opening review: full test suite (`just test`)
