import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

@freezed
abstract class Resource with _$Resource {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Resource({
    int? id,
    String? name,
    String? type,
    String? level,
    String? description,
    String? link,
    String? voice,
    String? sms,
    String? video,
    String? icon,
    String? image,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}
