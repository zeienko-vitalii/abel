Trunk-based. Default branch: `main`.

- Branch from latest `main` for each change; keep branches short-lived.
- Name: `<type>/<short-slug>` (e.g. `feat/login-cubit`, `fix/bundle-id`).
- Open a PR into `main`; merge often (squash or merge — prefer squash unless history must stay).
- No long-lived feature/release branches; no gitflow.
- Rebase or merge `main` into the branch before review if it drifted.
- Never force-push `main`. Force-push feature branches only when rewriting your own PR history.
