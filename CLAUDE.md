<!-- AGENTS.md and .github/copilot-instructions.md are symlinks to this file. Edit here only. -->

Be extremely concise in chat and commits; sacrifice grammar for concision.

- Commits and PR titles follow [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/): `<type>[optional scope][!]: <description>`; `!` or a `BREAKING CHANGE:` footer for breaking changes.
- YAGNI/KISS — smallest change that fully solves the task.
- Never mask failures (no skip/retry/silence).
- No secrets, key material, or device credentials.

**Workflow**
- Every change starts in `docs/intents/<kebab-name>/`: `intent.md` → `spec.md` → `plan.md`, each accepted by me before the next.
- New intents copy `docs/intents/_template.md`. Product context: [docs/SPEC.md](docs/SPEC.md).
- No code without an accepted `plan.md`. Save it as `docs/intents/<kebab-name>/plan.md`, not `~/.claude/plans/`.
- If the code departs from the plan, update `plan.md` in the same commit.
- Version via git only; never create `v2` copies.

**Validation** — run after every change, before saying done: [docs/validation.md](docs/validation.md)

**Docs**
- Architecture: [docs/architecture.md](docs/architecture.md) — before placement/structure changes
- Presentation: [docs/presentation.md](docs/presentation.md) — before UI structure changes
- Testing: [docs/testing.md](docs/testing.md) — before writing tests
- Git: [docs/git.md](docs/git.md) — before branching, merging, or PR workflow
- Review: [REVIEW.md](REVIEW.md) — before reviewing a PR

**When stuck**
- 2nd mistake in the same area → open that area's doc ([architecture](docs/architecture.md) | [presentation](docs/presentation.md) | [testing](docs/testing.md) | [validation](docs/validation.md) | [git](docs/git.md)); add a one-line rule there if the gap is reusable (here only if it applies everywhere).
- Still stuck or high-risk → stop for Vitaly before more code.
