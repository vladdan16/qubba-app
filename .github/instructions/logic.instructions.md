---
applyTo: "**/bloc/**.dart, **/domain/**.dart, **/data/**.dart, **/usecase/**.dart"
---

# Logic & BLoC Rules

## BLoC Pattern
- **Library:** `flutter_bloc`.
- **Architecture:** STRICTLY use **BLoC**. Do NOT use **Cubit**.
- **Events/States:**
    - Use `sealed class` for Events and States.
    - Annotate them with `@immutable`.
    - Use transformers (`event_transformer`) for event processing when applicable (e.g., `droppable`, `debounce`).
- **Complex Logic:** Move complex or reusable business logic out of the BLoC and into **UseCases**. The BLoC should map Events to UseCases and yield States.
  Simple logic may stay in BLoC.

## Pattern Matching
- **Switch:** Prefer `switch` expressions or statements over `if-else`.
- **Exhaustiveness:** Do NOT use `default` clauses in `switch` statements for sealed classes. Handle every state explicitly.

## Data Models
- **Immutability:** All domain and data classes must be immutable (`@immutable`).
- **Mutation:** NEVER mutate state. Create a `copyWith` method and use it to return new instances.
- **Structure:** Domain models should be plain Dart classes (no code generation packages like freezed).

## Error Handling
- Do not swallow errors. Wrap external calls in `try/catch` blocks within the Repository/DataSource layer.
