import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
abstract class Feed with _$Feed {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Feed({
    int? id,
    String? date,
    String? title,
    String? subtitle,
    String? description,
    String? imageUrl,
    String? linkUrl,
    int? sortOrder,
  }) = _Feed;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
