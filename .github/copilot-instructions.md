# Global Project Guidelines

## Tech Stack & Language
- **Language:** Dart 3+ (Strict null safety).
- **Features:** Use Dart 3 features like records, patterns, sealed classes, and dot shorthands (e.g., `crossAxisAlignment: .stretch,` vs `crossAxisAlignment: CrossAxisAlignment.stretch,`).
- **Variable Declarations:**
    - ALWAYS use `final` or `const`.
    - DO NOT specify types explicitly for local variables initialized with `final` or `var` (let type inference work).
    - Example: `final items = ['a', 'b'];` (Good) vs `final List<String> items = ...` (Bad).
- **Async:** Always use `async`/`await`. **Never** use `.then()`.

## Architecture & Libraries
- **Routing:** GoRouter.
- **Serialization:** `json_annotation` / `json_serializable`.
    - **Banned:** Do NOT use `freezed`.
- **Imports:** Prefer **relative imports** for files within the same package.

## Rules and Coding Philosophy
- `unawaited_futures: true` (Always await or unawaited futures).
- `public_member_api_docs: false` (No doc comments required for public members, however it's better
  to add comments on important features with non-obvious behaviour or public interfaces).
- `specify_nonobvious_property_types: false`.
- `discarded_futures: true` Futures should be properly awaited or explicitly wrapped in `unawated()`
- `prefer_expression_function_bodies: true` To save space and make code more clear
- **Localization:** All user-facing text must be localized via `intl`. Hardcoded strings are a lint error.
