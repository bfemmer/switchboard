import 'package:freezed_annotation/freezed_annotation.dart';

part 'resilience_tip.freezed.dart';
part 'resilience_tip.g.dart';

@freezed
abstract class ResilienceTip with _$ResilienceTip {
  const factory ResilienceTip({
    int? weekNumber,
    String? domain,
    String? title,
    String? actionText,
    String? linkUrl,
    String? contactPhone,
  }) = _ResilienceTip;

  factory ResilienceTip.fromJson(Map<String, dynamic> json) =>
      _$ResilienceTipFromJson(json);
}
