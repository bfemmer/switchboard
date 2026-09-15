import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide.freezed.dart';
part 'guide.g.dart';

@freezed
abstract class Guide with _$Guide {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Guide({
    int? id,
    String? name,
    String? subtitle,
    String? description,
    @JsonKey(name: 'stress_sources') String? stress,
    String? signs,
    String? deployment,
    String? riskFactors,
    String? vigilance,
    String? action,
    String? assistance,
    String? considerations,
    @JsonKey(name: 'urlLink') String? urlLink,
  }) = _Guide;

  factory Guide.fromJson(Map<String, dynamic> json) => _$GuideFromJson(json);
}
