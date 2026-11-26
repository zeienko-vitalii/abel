- Run: `just test test/<path>/<name>_test.dart`. Full suite before review:
  `just test`.
- Path mirror (`test/…` ↔ `lib/…`) is a goal; enforce later via script or
  analyzer — do not rely on this doc alone.
- `mocktail` for doubles, `bloc_test` for Cubits/Blocs. Assert public
  behavior only — no private/`_` access.
- Shared helpers/fixtures/fakes/mocks → `test/{helpers,fixtures,fakes,mocks}/`.
- **Exempt:** generated `*.*.dart`; declaration-only files (enums, consts,
  freezed declarations, abstract interfaces).
- One `*_test.dart` per public unit. Fake datasources in repository tests; widget tests only for important UI branches.
