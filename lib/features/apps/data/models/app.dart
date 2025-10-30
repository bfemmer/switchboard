import 'package:freezed_annotation/freezed_annotation.dart';

part 'app.freezed.dart';
part 'app.g.dart';

@freezed
abstract class App with _$App {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory App({
    int? id,
    String? name,
    String? organization,
    String? description,
    String? applestore,
    String? playstore,
    String? icon,
  }) = _App;

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);
}
