# Cabinets Feature

This feature provides functionality for managing cabinets in the Qubba app.

## Architecture

The feature follows the architecture guidelines specified in `lib/features/architecture.md`:

```
cabinets/
├── data/
│   ├── api/
│   │   ├── cabinets_api.dart       # API calls for cabinet operations
│   │   └── api_params.dart         # API endpoints configuration
│   ├── models/
│   │   ├── cabinet_dto.dart        # Data transfer object for Cabinet
│   │   ├── cabinets_response_dto.dart  # Response DTO for list of cabinets
│   │   └── update_cabinet_request_dto.dart  # Request DTO for updating cabinets
│   ├── mappers/
│   │   └── cabinet_mapper.dart     # Converts between DTOs and domain models
│   └── repository/
│       └── cabinets_repository_impl.dart  # Implementation of repository
├── domain/
│   ├── bloc/
│   │   ├── cabinets_bloc.dart      # BLoC for managing cabinet data
│   │   ├── cabinets_event.dart     # Events for cabinets bloc
│   │   └── cabinets_state.dart     # States for cabinets bloc
│   ├── models/
│   │   └── cabinet.dart            # Domain model for Cabinet
│   └── repository/
│       └── cabinets_repository.dart  # Repository interface
└── ui/
    ├── bloc/
    │   ├── cabinet_form_bloc.dart  # BLoC for form state management
    │   ├── cabinet_form_event.dart # Events for form bloc
    │   └── cabinet_form_state.dart # States for form bloc
    ├── cabinets_list_screen.dart   # Screen showing list of cabinets
    └── cabinet_form_screen.dart    # Screen for adding/editing cabinets
```

## Features

### 1. View All Cabinets
- Endpoint: `GET https://bot-api.qubba.io/cabinet/all?limit=1000`
- Displays a list of all cabinets with their details (name, description, address, phone, email)
- Accessible via `/cabinets` route

### 2. Add/Edit Cabinets
- Endpoint: `PUT https://user-api.qubba.io/v1/cabinet/{id}`
- Form for adding new cabinets or editing existing ones
- Fields: Name (required), Description, Address, Phone, Email
- Accessible via `/cabinets/add` or `/cabinets/edit/{id}` routes

## Integration

### Dependency Injection
The cabinets repository is provided through `UserDependencies`:

```dart
abstract interface class UserDependencies {
  CabinetsRepository get cabinetsRepository;
  // ...
}
```

### Routing
Routes are configured in `lib/app/navigation/router.dart`:

- `/cabinets` - List of cabinets
- `/cabinets/add` - Add new cabinet
- `/cabinets/edit/:id` - Edit existing cabinet

## Usage

To navigate to the cabinets screen:

```dart
context.push('/cabinets');
```

To add a new cabinet:

```dart
context.push('/cabinets/add');
```

To edit an existing cabinet:

```dart
context.push('/cabinets/edit/${cabinet.id}', extra: cabinet);
```

## Code Generation

This feature uses `freezed` for data and domain models, and `json_serializable` for JSON serialization.

**Important:** Before running the app, generate the required code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Or use the provided script:

```bash
./codegen.sh
```

The generated files (`.freezed.dart` and `.g.dart`) are included as stubs to allow compilation, but proper generation should be run for production use.

## Models

### Domain Model
```dart
class Cabinet {
  final String id;
  final String name;
  final String? description;
  final String? address;
  final String? phone;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
```

### API Integration
- Uses Dio client from `UserDependencies` with pre-configured authorization header
- Full URLs are used for API endpoints (not relative paths)
- Supports pagination with limit parameter

## State Management

### Domain BLoC (CabinetsBloc)
Manages cabinet data and interacts with the repository:
- `LoadCabinets` - Fetches list of cabinets
- `UpdateCabinet` - Updates or creates a cabinet

### UI BLoC (CabinetFormBloc)
Manages form state (UI layer only, doesn't interact with data layer):
- Handles form field changes
- Validates form data
- Maintains form state

## Notes

- Authentication is handled by `UserDependencies` which provides a Dio client with pre-configured authorization header
- The feature strictly follows the architecture defined in `lib/features/architecture.md`
- Data models use `freezed` for immutability and code generation
- State and Event models for BLoCs use built-in sealed classes (not freezed)
- The UI is responsive and follows Material Design guidelines
