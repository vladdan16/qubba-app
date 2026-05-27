import 'package:meta/meta.dart';

@immutable
final class AiModel {
  const AiModel({
    required this.providerCode,
    required this.providerName,
    required this.modelCode,
    required this.modelName,
    required this.isDefault,
  });

  final String providerCode;
  final String providerName;
  final String modelCode;
  final String modelName;
  final bool isDefault;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AiModel &&
          runtimeType == other.runtimeType &&
          providerCode == other.providerCode &&
          modelCode == other.modelCode;

  @override
  int get hashCode => Object.hash(providerCode, modelCode);
}
