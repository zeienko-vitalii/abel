# Review

Applies to every PR into `main`. Bugbot rules: [.cursor/BUGBOT.md](.cursor/BUGBOT.md). **Rank** is defined here; BUGBOT links here. **Types** vocab is shared — edit both files when Types change.

## Inputs
Read the change's `docs/intents/<kebab-name>/spec.md` and `plan.md` first, then the diff.

## Workflow
[CLAUDE.md](CLAUDE.md) **Workflow** (session split, reviewer duties).

## Passes
1. **Correctness** — logic errors, unhandled states, silent catches, Cubit/Bloc misuse, races, unhandled Futures. `just check` failure → one **High** finding; do not itemize lint/format.
2. **Security** — secrets, keys or tokens in code, tests, logs or fixtures; unsafe storage (store credentials stay in Keychain).
3. **Compliance** — diff vs `plan.md` / `spec.md`; layer rules in [docs/architecture.md](docs/architecture.md). Plan drift without in-commit `plan.md` update → **High**. Unjustified `pubspec.yaml` / lockfile changes → **Compliance · High**.
4. **Tests** — `lib/` changes need tests for the plan's Proof section; no weakened or skipped tests.

## Rank
- **Critical** — exploitable security, data loss, crash, or store-release blocker.
- **High** — any other must-fix.
- **Medium** — should fix; merge judgment call (does not block on its own).
- **Low** — any Type, minor or optional; not style-only (style is `just check`). Cap at 5 Low findings per review.
- **Refactor** (type) — rank **Medium** at most unless tied to a real Critical or High defect.

Only **Critical** and **High** block merge until fixed or the owner waives. Medium and Low inform only.

## Types
Correctness · Security · Tests · Compliance · **Performance** (Bugbot only) · **Refactor** (Bugbot only)

## Output
Findings as **one table**, sorted Critical → Low. If none: `No findings.`

| Type | Rank | File:line | Description |
| --- | --- | --- | --- |

## Skip
Generated files (`*.g.dart`, `*.freezed.dart`, l10n output), style/format/lint covered by `just check`, and Low findings only reachable under contrived conditions (any Type), unless trivial to fix in the hunk.

## Rules
- The agent that wrote the code never approves it. Owner merges (squash only).
- A review mistake made twice → [CLAUDE.md](CLAUDE.md) **When stuck**.
