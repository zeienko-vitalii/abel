Clean Architecture, feature-first. One Flutter app package **`abel`** at the repo
root (product name: Release Copilot). **Platforms:** macOS only (`macos/`). Dependency rule: **presentation → domain ←
data**. Domain never imports data.

**Top-level under `lib/`**
- `app/` — root `MaterialApp` / app widget only: router, theme application,
  top-level providers. No feature logic.
- `core/` — configs, constants, app-wide Cubits, shared presentation/services,
  theme, utilities, logging, DI (`get_it` + `injectable`), and other cross-
  feature wiring. No separate `lib/di/`.
- `features/<feature>/` — each feature owns `presentation`, `domain`, and
  `data`.

**Layers (per feature)**
- **presentation** — Cubit by default; Bloc when you need event streams,
  delayed/debounced emissions, or richer event control. Pages/widgets.
  Depends on domain UseCases + repository contracts only. Branching in
  Cubit/Bloc; widgets render state.
- **domain** — `Entity*` (freezed), repository abstracts, concrete UseCases
  (`deps` via ctor + `call()`). No UseCase interfaces / `*Impl`. Fields
  non-null unless optional. Prefer no Flutter, plugins, I/O, or SDK types.
- **data** — `Model*`, repository `*_impl`, datasources, DTOs, mappers.
  Implements domain contracts.

**Other**
- Plugin/SDK code behind a repository or service abstraction; abstract in
  domain (or `core` if shared), `*_impl` in data/`core`.
- Register and resolve via `get_it` / `injectable` at composition root —
  never construct impls inside domain.
- Shared kernel in `core` only for truly cross-feature types/services.
