- Prefer a named `StatelessWidget`/`StatefulWidget` over a private
  `Widget _build…()` — classes rebuild independently.
- UI-only display formatting (domain → string/label) goes in an extension,
  not inline in the widget and not on the domain entity.
- Wire Cubits/Blocs at the page/route boundary. Widgets below consume via
  `BlocBuilder` / `BlocSelector` / `context.watch` — no business branching
  in `build`.
- `StatefulWidget` only for ephemeral UI state (controllers, animations,
  focus). App/domain state stays in Cubit/Bloc.
- Theme via `Theme.of(context)` / app theme tokens; l10n via generated
  slang accessors (once wired). No hard-coded user-facing strings in
  widgets after i18n lands.
- Pages orchestrate DI + layout; leaf widgets stay dumb and reusable.
