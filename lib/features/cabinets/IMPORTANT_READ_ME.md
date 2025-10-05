# Code Generation Required

This feature uses `freezed` and `json_serializable` packages.

To generate the required `.freezed.dart` and `.g.dart` files, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Or use the provided script:
```bash
./codegen.sh
```

The stub files included are minimal implementations to allow the code to compile
but proper code generation should be run before using this feature in production.
