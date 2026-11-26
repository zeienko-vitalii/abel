<!-- .cursor/BUGBOT.md — high-signal PR review rules -->

High-signal only. Prefer concrete, diff-verifiable defects.
Before commenting: verify the finding is a real issue in this diff (not a false positive or out-of-scope style preference). Cite the file/line and a short why.

Every comment starts with `[Type · Rank]` — vocab per [REVIEW.md](../REVIEW.md) **Types**; **Rank** per [REVIEW.md](../REVIEW.md) **Rank**. Inline comments only; no findings table.

## Flag

**Correctness**
- Logic errors, wrong edge/null handling, broken API or layer contracts
- Race/async hazards; incomplete Cubit/Bloc state updates
- Silent `catch` / swallowed errors without rethrow or user-visible handling
- Unhandled Futures / missing `await` on error-prone calls
- Left-unresolved analyzer errors; if `just check` fails, one **Correctness · High** comment — do not restate individual lint/format items

**Reliability & tests** → Type `Tests`
- New/changed public unit under `lib/` with no matching `*_test.dart` change
- Tests that `skip`, silence failures, or assert private/`_` members

**Performance** (Bugbot only)
- Work that blocks the UI isolate on hot paths
- Unbounded loops/rebuilds or N+1 work introduced in the diff

**Security**
- Secrets, keys, tokens, or device credentials in source, tests, or logs
- Insecure storage/transport; over-broad permissions; PII in logs

**Compliance**
- Diff diverges from accepted `plan.md` / `spec.md` without an in-commit plan update
- Layer or placement violations per [docs/architecture.md](../docs/architecture.md)
- `pubspec.yaml` / lockfile changes without justification in the PR body → **Compliance · High**

**Improve / refactor** → Type `Refactor` (Bugbot only)
- Clear duplication, layer leaks, or structure that should be rewritten for maintainability
- Propose a concrete better shape; anchor to the specific line/hunk
- Only when the improvement is justified by the diff, not speculative cleanup

## Skip

- Generated files (`*.g.dart`, `*.freezed.dart`, build outputs)
- Style/format/lint noise covered by `just check` (fold into the single check-failure comment when check fails)
- Low findings only reachable under contrived conditions (any Type), unless trivial to fix in the hunk
- Vague “nice to have” without a concrete rewrite
- Restating the PR description
- Unverified or speculative findings
