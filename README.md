# Qubba App

A mobile application for marketplace sellers on Wildberries and Ozon platforms. Manage your seller profiles, track sales analytics, and monitor your business performance across multiple marketplaces in one unified mobile interface.

## 📱 About

Qubba App is designed for sellers who operate on Russian e-commerce marketplaces (Wildberries and Ozon). The application provides:

- **Multi-marketplace Management**: Handle multiple seller cabinets across WB and Ozon in one place
- **Sales Analytics**: Visualize revenue, profit, and sales quantity with interactive charts
- **Cabinet Management**: Configure API integrations, tax settings, and organizational details
- **Team Collaboration**: Manage employee access to different seller cabinets
- **Profile Management**: Personalize your user profile with photo and contact information

## ✨ Features

### 🏪 Cabinet Management
- Create and manage multiple seller cabinets
- Configure Wildberries and Ozon API integrations
- Set up tax rates, legal types, and organizational information
- Activate/deactivate cabinets as needed

### 📊 Sales Analytics
- View sales data from both Wildberries and Ozon
- Interactive charts for revenue, profit, and sales quantity
- Customizable date range selection
- Track returns and advertising expenses
- Real-time data synchronization

### 👥 Team Access Control
- Add employees to specific cabinets
- Manage access permissions
- Email-based employee management

### 👤 User Profile
- Update personal information
- Upload and manage profile photo
- Multi-language support (English and Russian)

## 🛠 Tech Stack

### Framework & Language
- **Flutter** 3.10+ with Dart 3.10+
- **Material Design 3** with dynamic color theming
- **Platform Support**: Android, iOS, Web

### Architecture & State Management
- **BLoC Pattern** using `flutter_bloc` and `bloc`
- Clean Architecture with domain/data/UI separation
- Repository pattern for data access
- Event transformers with `bloc_concurrency`

### Navigation & Routing
- **GoRouter** for declarative routing
- Authentication-based route guards

### Data & Networking
- **Dio** for HTTP networking
- **json_serializable** for JSON serialization
- **flutter_secure_storage** for secure token storage
- Custom authentication interceptor for API requests

### UI & Visualization
- **fl_chart** for interactive charts
- **dynamic_color** for Material You theming
- **image_picker** for profile photo selection

### Localization
- **intl** and **flutter_localizations**
- Support for English (en) and Russian (ru)
- ARB-based localization files

### Code Quality
- **very_good_analysis** lint rules
- Strict null safety
- Custom lint configurations

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.10 or higher
- Dart SDK 3.10 or higher
- Android Studio / Xcode (for mobile development)
- FVM (optional, for Flutter version management)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd qubba-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   
   On Unix/macOS:
   ```bash
   ./codegen.sh
   ```
   
   On Windows:
   ```bash
   codegen.bat
   ```
   
   Or manually:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

The app requires backend API endpoints for authentication, cabinets, sales, and profile management. Configure your API base URL in the appropriate configuration files.

## 📂 Project Structure

```
lib/
├── app/                    # Application-level configuration
│   └── navigation/         # GoRouter configuration
├── common/                 # Shared UI components
│   └── ui/                 # Reusable widgets
├── core/                   # Core infrastructure
│   └── di/                 # Dependency injection setup
├── features/               # Feature modules
│   ├── authentication/     # Login and auth flows
│   ├── cabinets/           # Cabinet management
│   ├── home/               # Home screen
│   ├── profile/            # User profile
│   └── sales/              # Sales analytics
├── l10n/                   # Localization files
└── utils/                  # Utility functions
```

Each feature follows clean architecture:
```
feature/
├── data/           # DTOs, API clients, repositories
├── domain/         # Business logic, BLoCs, models
└── ui/             # Screens and widgets
```

## 🧪 Development

### Code Generation

Run code generation when you modify:
- JSON serialization classes (`@JsonSerializable`)
- Freezed classes (used in DTOs)

```bash
flutter pub run build_runner watch
```

### Linting

The project uses `very_good_analysis` with custom rules. Run:

```bash
flutter analyze
```

### Testing

Run tests with:

```bash
flutter test
```

## 🌍 Localization

To add or modify translations:

1. Edit `lib/l10n/app_en.arb` (English)
2. Edit `lib/l10n/app_ru.arb` (Russian)
3. Run code generation to update localization classes

## 📋 Coding Conventions

- Use **BLoC pattern** (not Cubit) for state management
- All user-facing strings must be localized (no hardcoded strings)
- Use `final` or `const` for variable declarations
- Prefer relative imports for same-package files
- Use `async`/`await` (never `.then()`)
- Follow Material Design 3 guidelines
- Use theme-based styling (never hardcode colors)

## 🔐 Security

- Authentication tokens stored securely using `flutter_secure_storage`
- HTTP interceptors handle token refresh automatically
- Secure API communication with proper error handling

## 📝 License

This project is private and proprietary.

## 🤝 Contributing

This is a private project. For team members:

1. Create a feature branch from `main`
2. Follow the coding conventions
3. Ensure all tests pass
4. Submit a pull request for review

## 📧 Contact

For questions or support, please contact the development team.

---

Built with ❤️ using Flutter
