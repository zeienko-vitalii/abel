Use FVM for all Flutter/Dart commands (`fvm flutter` / `fvm dart`). Prefer `just` recipes — they already wrap fvm.

After a change:

- `just check`
- `just test test/widget_test.dart` (swap path for the tests that changed)

When models or generated classes change: `just gen`

Before opening review: full test suite (`just test`)

## Analysis

- Lints: `very_good_analysis` + `dart_code_linter` (metrics, unused code) via `just check`; analyzer infos are fatal (`--fatal-infos`).
- `// ignore:` / `ignore_for_file` only with a WHY comment; never to silence a failing check to pass. No project-wide rule disabling without owner OK.
- Generated files (`*.g.dart`, `*.freezed.dart`, `*.config.dart`, `lib/i18n/**`) excluded from analyze/metrics; never hand-edit them.
- DCL rule ids use kebab-case in ignore comments.