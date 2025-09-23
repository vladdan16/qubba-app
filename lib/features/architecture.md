#### Архитектура фичи

Архитектура фичи должна иметь следующую структуру:

```
.
├── data
│   ├── api
│   ├── mappers
│   ├── models
│   └── repository
├── di
├── domain
│   ├── bloc
│   ├── models
│   └── repository
└── ui
    ├── bloc
    └── widgets
```

#### Подробнее

##### Data

- api: тут взаимодействие с сетью и парсинг моделей

пример API класса

```dart
sealed class AuthenticationApi {
  factory AuthenticationApi(Dio dio) = _AuthenticationApiImpl;

  const AuthenticationApi._();

  Future<Map<String, Object?>> loginWithEmailAndPassword(LoginWithEmailAndPasswordRequest dto,);

  LoginResponse parseLoginResponse(Map<String, Object?> json) =>
      LoginResponse.fromJson(json);
}

final class _AuthenticationApiImpl extends AuthenticationApi {
  final Dio dio;

  _AuthenticationApiImpl(this.dio) : super._();

  @override
  Future<Map<String, Object?>> loginWithEmailAndPassword(
      LoginWithEmailAndPasswordRequest dto,) async {
    final response = await dio.post<Map<String, Object?>>(
      _ApiParams.login,
      data: dto.toJson(),
    );
    return response.requireData;
  }
}

final class MockAuthenticationApi extends AuthenticationApi {
  const MockAuthenticationApi() : super._();

  @override
  Future<Map<String, Object?>> loginWithEmailAndPassword(
      LoginWithEmailAndPasswordRequest dto,) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return {
      'token': 'token',
      'refresh_token': 'refreshToken',
    };
  }
}
```

**Note!** Хорошей практикой является имплементация `MockSomeApi` для тестирования.

- models: тут находятся data модели. Они должны иметь toJson и/или fromJson методы для удобной
  сериализации и десериализации. Можно использовать freezed или json_serializable пакеты.
- mappers: тут находятся мапперы для преобразования data моделей в domain модели и наоборот.
  хорошей практикой является отделение доменных и дата моделей даже если набор полей абсолютно
  идентичный.
- repository: опциональная директория. Тут находится реализация репозиториев из domain слоя.
  Репозитории могут понадобится если нужен персистанс или какое-то преобразование данных перед
  переводом в доменные модели.

##### DI

Это директория опциональна. Нужна если фича объемная и есть необходимость предоставления
зависимостей вниз по дереву виджетов. Реализуется по аналогии с `AppScope` и `UserScope`.

##### Domain

- bloc: тут находятся блоки из domain слоя. Особенность доменных блоков - взаимодействие
  с сущностями из data слоя. Блоки из доменного слоя не должны управлять состояниями экранов,
  а только состояниями *данных*.
- models: тут находятся domain модели, которые могут использоваться в том числе в ui слое.
- repository: опциональная директория. Тут находятся интерфейсы для взаимодействия с репозиториями
  из data слоя.

##### UI

В слое UI располагаются экраны и компоненты (виджеты). Верстка экрана обычно находится в корне ui
слоя.
Чаще всего одна фича - один экран, но может быть и несколько.

- bloc: в этой директории лежат блоки которые управляют состояниями ui (например форм). Они ни в
  коем случае не должны взаимодействовать с сущностями из data слоя и (скорее всего) не должны
  взаимодействовать с сущностями из domain слоя.
- widgets: тут стоит поместить виджеты которые можно переиспользовать в нескольких местах
  в рамках одной фичи.

**Note!** Какие-то общие компоненты, которые будут использоваться в разных фичах, стоит выносить в
`features/common/ui`
