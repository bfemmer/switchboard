import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotline.freezed.dart';
part 'hotline.g.dart';

@freezed
abstract class Hotline with _$Hotline {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Hotline({
    int? id,
    String? name,
    String? description,
    String? phone,
    String? phoneType,
    String? link,
  }) = _Hotline;

  factory Hotline.fromJson(Map<String, dynamic> json) =>
      _$HotlineFromJson(json);
}
