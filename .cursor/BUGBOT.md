<!-- .cursor/BUGBOT.md — high-signal PR review rules -->

High-signal only. Prefer concrete, diff-verifiable defects.
Before commenting: verify the finding is a real issue in this diff (not a false positive or out-of-scope style preference). Cite the file/line and a short why.

Every comment starts with `[Type · Rank]` using the same vocab as [REVIEW.md](../REVIEW.md):
- **Type:** Correctness · Security · Tests · Performance · Compliance · Refactor
- **Rank:** Critical · High · Medium · Low (Critical/High = must-fix before merge)
No findings table — inline comments only.

## Flag

**Correctness**
- Logic errors, wrong edge/null handling, broken API or layer contracts
- Race/async hazards; incomplete Cubit/Bloc state updates
- Silent `catch` / swallowed errors without rethrow or user-visible handling

**Reliability & tests** → Type `Tests`
- New/changed public unit under `lib/` with no matching `*_test.dart` change
- Tests that `skip`, silence failures, or assert private/`_` members
- Unhandled Futures / missing `await` on error-prone calls

**Performance**
- Work that blocks the UI isolate on hot paths
- Unbounded loops/rebuilds or N+1 work introduced in the diff

**Security**
- Secrets, keys, tokens, or device credentials in source, tests, or logs
- Insecure storage/transport; over-broad permissions; PII in logs

**Static analysis** → Type `Correctness`
- Left-unresolved analyzer errors; formatting/`just check` failures in the change

**Dependencies** → Type `Compliance`
- `pubspec.yaml` / lockfile changes without justification in the PR body

**Improve / refactor** → Type `Refactor` (suggestion, not blocking unless it causes a defect above)
- Clear duplication, layer leaks, or structure that should be rewritten for maintainability
- Propose a concrete better shape; anchor to the specific line/hunk
- Only when the improvement is justified by the diff, not speculative cleanup


## Skip

- Generated files (`*.g.dart`, `*.freezed.dart`, build outputs)
- Style/format/lint noise covered by `just check`
- Vague “nice to have” without a concrete rewrite
- Restating the PR description
- Unverified or speculative findings
