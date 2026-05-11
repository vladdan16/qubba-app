# Qubba App — Claude Code Guide

Mobile app for WB/Ozon marketplace sellers. Flutter + Dart 3.10+, Material Design 3.

## Quick Commands

```bash
# Install dependencies
flutter pub get

# Run codegen (DTOs, JSON serialization)
dart run build_runner build --delete-conflicting-outputs

# Regenerate localization
flutter gen-l10n

# Analyze (CI runs --fatal-infos, treat infos as errors)
flutter analyze

# Format check (CI requirement)
dart format --output=none --set-exit-if-changed .

# Run the app
flutter run
```

## Project Structure

```
lib/
├── app/
│   ├── app.dart                  # Root widget, AuthBloc, theming
│   └── navigation/
│       ├── router.dart           # GoRouter config (all routes)
│       ├── main_shell.dart       # NavigationBar scaffold (Кабинеты / Отзывы)
│       └── navigation_ext.dart   # BuildContext extension: go/push helpers
├── common/
│   └── ui/                       # Shared widgets used by multiple features
├── core/
│   └── di/
│       ├── app/                  # AppScope — pre-auth dependencies (Dio, AuthRepository)
│       └── user/                 # UserScope — post-auth dependencies (all feature repos)
├── features/
│   ├── authentication/           # Login, registration, token management
│   ├── cabinets/                 # Cabinet CRUD, employees, marketplace badges
│   ├── profile/                  # User profile
│   ├── sales/                    # Analytics charts (uses reportDio)
│   └── reviews/                  # Review list + detail (infinite scroll, filters)
├── l10n/
│   ├── app_en.arb                # English strings (source of truth)
│   ├── app_ru.arb                # Russian strings
│   ├── gen/                      # Generated — do not edit
│   └── l10n.dart                 # Re-export: import this, not gen/ directly
└── utils/
    └── require_data.dart         # Dio response extension: .requireData (throws on null)
```

Each feature follows `data/ → domain/ → ui/` with no cross-feature imports except through `common/`.

## Architecture

### Dependency Injection (two-level scopes)

**AppScope** (`core/di/app/`) — lives for the entire app lifetime. Holds:
- `Dio` with `https://api.qubba.io/` base URL, `AuthInterceptor`, `LogInterceptor`
- `AuthenticationRepository`

**UserScope** (`core/di/user/`) — created after successful login, disposed on logout. Holds:
- `dio` — main API (`https://api.qubba.io/`) with Bearer token header
- `reportDio` — analytics API (`https://report-api.qubba.io/`) with Bearer token
- One repository per feature: `CabinetsRepository`, `ProfileRepository`, `SalesRepository`, `ReviewsRepository`

Access pattern in widgets: `UserScope.of(context).reviewsRepository`

### Feature Layer Pattern

```
data/
  api/
    feature_api.dart          # sealed class FeatureApi { factory(Dio) = _Impl; … }
    api_params.dart           # part of — URL constants
  models/
    foo_dto.dart              # @JsonSerializable(createToJson: false) — DTO
    foo_dto.g.dart            # generated — do not edit
  mappers/
    foo_mapper.dart           # static toDomain(FooDto) → Foo
  repository/
    feature_repository_impl.dart
domain/
  models/
    foo.dart                  # @immutable plain Dart class, manual ==, hashCode, copyWith
  repository/
    feature_repository.dart   # abstract interface class
  bloc/
    feature_bloc.dart         # events + states + bloc in one file (or split with part)
ui/
  pages/
    feature_page.dart         # BlocProvider at top, then _FeatureView
  widgets/
    some_widget.dart          # private widgets extracted here, or reused via common/
```

### BLoC Rules

- Use `flutter_bloc` **BLoC only** — no Cubit.
- Events and states are `sealed class` annotated with `@immutable`.
- Every case in a `switch` on a sealed type must be handled explicitly — no `default:`.
- Use `switch` expressions/statements, not `if-else` chains.
- Event transformers: `restartable()` for load/filter events, `droppable()` for load-more.
- `bloc_concurrency` is already a dependency — `import 'package:bloc_concurrency/bloc_concurrency.dart'`.
- Keep BLoCs thin; move complex/reusable logic to UseCases if it grows.
- Error handling: `try/catch` inside Repository/DataSource — never swallow exceptions.

```dart
// State sealed class example
sealed class FeatureState {
  const FeatureState();
}

@immutable
final class FeatureLoadingState extends FeatureState {
  const FeatureLoadingState();
}

@immutable
final class FeatureReadyState extends FeatureState {
  const FeatureReadyState({required this.items});
  final List<Item> items;
}
```

### Domain Models

- `@immutable` plain Dart classes — **no freezed** on domain models.
- Manual `==`, `hashCode`, and `copyWith` with `_sentinel` pattern for nullable fields:

```dart
static const _sentinel = Object();

FooModel copyWith({Object? bar = _sentinel}) => FooModel(
  bar: bar == _sentinel ? this.bar : bar as String?,
);
```

### API Layer

Sealed class with a factory constructor pointing to a private implementation:

```dart
sealed class FeatureApi {
  factory FeatureApi(Dio dio) = _FeatureApiImpl;
  const FeatureApi._();

  Future<FooDto> getFoo(String id);
}

class _FeatureApiImpl extends FeatureApi {
  _FeatureApiImpl(this._dio) : super._();
  final Dio _dio;

  @override
  Future<FooDto> getFoo(String id) async {
    final response = await _dio.get<Map<String, Object?>>('/v1/foo/$id');
    // use requireData extension
    final data = response.requireData;
    return FooDto.fromJson(data);
  }
}
```

Use null-aware map entries for optional query params (Dart 3): `'is_answered': ?isAnswered`.  
For array params: `if (id != null) 'cabinet_id': [id]`.

### DTOs and Codegen

```dart
@JsonSerializable(createToJson: false)
class FooDto {
  const FooDto({required this.id, this.name});

  factory FooDto.fromJson(Map<String, Object?> json) => _$FooDtoFromJson(json);

  final String id;
  @JsonKey(name: 'display_name')
  final String? name;
}
```

After adding/changing a DTO, run: `dart run build_runner build --delete-conflicting-outputs`

## UI Conventions

- Decompose complex UIs into **private widget classes** in the same file (`class _Header extends StatelessWidget`). **Never** use builder methods (`Widget _buildHeader()`).
- Extract to a separate file only if the widget is reused or independent.
- Use `const` constructors everywhere possible.
- Named parameters on all widget constructors.
- No `async` in UI callbacks — dispatch BLoC events instead.
- Spacing: `SizedBox(width/height: N)` — not `Container` with margin/padding for spacing.
- Colors/text styles: always `Theme.of(context).colorScheme.*` / `Theme.of(context).textTheme.*` — never hardcoded `Colors.blue` etc.
- Responsive sizing: `Expanded`, `Flexible`, `LayoutBuilder` — avoid hardcoded pixel widths/heights.

## Localization

All user-facing strings must be localized. Hardcoded strings are a lint error.

- Add new keys to **both** `lib/l10n/app_en.arb` and `lib/l10n/app_ru.arb`.
- Access: `Strings.of(context).yourKey` (create `final strings = Strings.of(context)` locally for reuse).
- Parametrized keys: `"reviewsError": "Error: {message}"` — use ICU syntax for plurals.
- After editing ARB files, `flutter gen-l10n` runs automatically on next build (`generate: true` in pubspec).

## Dart Style

- Dart 3+ features: records, patterns, sealed classes, dot shorthands (`crossAxisAlignment: .center`).
- Always `final` or `const` — no `var` for local variables.
- No explicit types for locally-inferred locals: `final items = [...];` not `final List<String> items = [...]`.
- Always `async`/`await` — **never** `.then()`.
- `prefer_expression_function_bodies`: use `=>` for single-expression functions/getters.
- Relative imports within the package: `import '../models/foo.dart'` not `import 'package:qubba_app/features/…'`.
- All futures must be `await`ed or wrapped in `unawaited()` — both `unawaited_futures` and `discarded_futures` are enforced.

## Navigation

Routes are in `lib/app/navigation/router.dart`. The authenticated shell uses `StatefulShellRoute.indexedStack` with two branches:
- Branch 0: `/cabinets` and all sub-routes
- Branch 1: `/reviews` and `/reviews/:id`

`CabinetsBloc` is provided at the `StatefulShellRoute` level so both tabs can access the cabinet list.

Use `navigation_ext.dart` helpers in widgets:
```dart
context.go('/cabinets');
context.openReviewDetail(review.id);
```

When adding a new top-level route, add it to the appropriate branch in `router.dart` and add a helper to `navigation_ext.dart`.

## Adding a New Feature

1. Create `lib/features/<name>/` with `data/`, `domain/`, `ui/` sub-trees (mirror `reviews/` or `cabinets/`).
2. Add `abstract interface class FeatureRepository` in `domain/repository/`.
3. Add `FeatureRepository get featureRepository` to `UserDependencies` interface and its `_impl`.
4. Wire up `FeatureApi(dio)` + `FeatureRepositoryImpl(api: ...)` in `UserDependenciesImpl.init()`.
5. Add `await featureRepository.dispose()` to `UserDependenciesImpl.dispose()`.
6. Add routes to `router.dart`, navigation helpers to `navigation_ext.dart`.
7. Add all user-facing strings to both ARB files.
8. Run `dart run build_runner build --delete-conflicting-outputs` if new DTOs were added.
9. Run `flutter analyze` — CI blocks on any info-level issue.

## CI Checks (must pass before merging to main)

1. `dart format --output=none --set-exit-if-changed .` — zero formatting diffs
2. `dart analyze --fatal-infos` — zero issues including infos
3. `flutter build apk` — clean release build

## Key Dependencies

| Package | Version | Purpose |
|---|---|---|
| `flutter_bloc` | ^9.1.1 | State management (BLoC only) |
| `bloc_concurrency` | ^0.3.0 | `restartable()`, `droppable()` transformers |
| `go_router` | ^17.0.0 | Declarative navigation |
| `dio` | ^5.9.0 | HTTP client |
| `json_serializable` | ^6.11.1 | DTO codegen (dev) |
| `json_annotation` | ^4.9.0 | `@JsonSerializable`, `@JsonKey` |
| `freezed_annotation` | ^3.1.0 | Available but **banned** on domain models; only for data layer if needed |
| `very_good_analysis` | ^10.0.0 | Strict lint rules (dev) |
| `flutter_secure_storage` | ^10.0.0 | Auth token storage |
| `fl_chart` | ^1.1.1 | Analytics charts (sales feature) |
| `dynamic_color` | ^1.8.1 | Material You theming |
| `intl` | ^0.20.2 | Localization |
| `meta` | ^1.16.0 | `@immutable`, `@protected` |

## What Not To Do

- **No freezed on domain models** — use plain `@immutable` classes with manual `copyWith`.
- **No Cubit** — always BLoC.
- **No `.then()`** — always `async/await`.
- **No hardcoded colors or strings** in widgets.
- **No builder methods** that return `Widget` — use private widget classes.
- **No `default:` in sealed-class switches** — be exhaustive.
- **No `var`** for local variable declarations.
- **No absolute package imports** within the same package — use relative.
