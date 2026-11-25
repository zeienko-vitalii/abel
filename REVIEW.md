# Review

Applies to every PR into `main`. Bugbot-specific rules live in [.cursor/BUGBOT.md](.cursor/BUGBOT.md); don't restate them here.

## Inputs
Read the change's `docs/intents/<kebab-name>/spec.md` and `plan.md` first, then the diff.

## Passes
1. **Bugs** — logic errors, unhandled states, silent catches, Cubit/Bloc misuse, races.
2. **Security** — secrets, keys or tokens in code, tests, logs or fixtures; unsafe storage (store credentials stay in Keychain).
3. **Compliance** — the diff matches `plan.md` (files, order, proof) and `spec.md` requirements; layer rules in [docs/architecture.md](docs/architecture.md). Plan drift without a `plan.md` update in the same commit is Important.
4. **Tests** — `lib/` changes come with tests that prove the plan's Proof section; no weakened or skipped tests.

## Severity
- **Important** — must fix before merge: bug, security issue, spec/plan mismatch, missing proof.
- **Nit** — optional style or naming. At most 5 per review.

## Skip
Generated files (`*.g.dart`, `*.freezed.dart`, l10n output), and anything `just check` already enforces.

## Rules
- Findings inform; they don't approve or block on their own.
- The agent that wrote the code never approves it. I merge (squash only).
- A review mistake made twice → [CLAUDE.md](CLAUDE.md) **When stuck**.