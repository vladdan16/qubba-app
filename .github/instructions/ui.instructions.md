---
applyTo: "**/*.dart, **/*.arb"
---

# UI & Widget Rules

## Widget Structure
- **Decomposition:**
    - Decompose complex UIs into private widgets within the same file (e.g., `class _Header extends StatelessWidget`).
    - Extract to a separate file if the widget is reused across multiple screens.
    - You may extract widget to separate file if it is an independent part of UI.
    - Do not use builder methods (e.g. `Widget _buildButton()`)! Use separate private widgets instead.
- **Composition:** Prefer small, composable widgets over large build methods or helper methods returning Widgets.
- **Constructors:** ALWAYS use `const` constructors where possible.
- **Parameters:** Use named parameters for all widget constructors.

## Logic in UI
- **No Async Logic:** Never call async methods directly in the UI (e.g., `onTap: () async { await service.call(); }`).
- **Reaction:** UI should strictly react to BLoC state changes. Dispatch events to the BLoC instead.
- **Callback extraction:** Extract callbacks from build method if it larger than 3-line long (like listener in BlocListener or onTap).

## Styling
- **Theme:** Always use `Theme.of(context)` for colors and text styles. Never hardcode colors (e.g., `Colors.blue`).
- **Responsive:** Use `LayoutBuilder` or flexible widgets (`Expanded`, `Flexible`) rather than hardcoded pixel widths/heights.
- **Spacing:** Use `SizedBox(height/width: X)` or `gap` package, not `Container` with margin.

## Localization (l10n)
> **Note:** "l10n" is an abbreviation for "localization" (L + 10 letters + N).
- **No Hardcoded Strings:** NEVER use hardcoded string literals in the UI.
- **Usage:** Access localized strings using `Strings.of(context).yourStringKey`. You may create a local l10n variable for convenient re-usage within one build.
- **Resource Files:**
  - English: `lib/l10n/intl_en.arb`
  - Russian: `lib/l10n/intl_ru.arb`
- **ARB Management:**
    - When creating a new string, update **both** `intl_en.arb` and `intl_ru.arb`.
    - **Plurals:** Use ARB plural syntax (icu) for counts and quantities.
    - **Descriptions:** Add the `@yourStringKey` field in `intl_en.arb` with a `description` property to provide context for translators (especially for non-obvious keys).
