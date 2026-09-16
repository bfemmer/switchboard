import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:switchboard/features/home/data/models/resilience_tip.dart';

class ResilienceTipService {
  static ResilienceTipService? _instance;
  static ResilienceTipService get instance =>
      _instance ??= ResilienceTipService._();

  ResilienceTipService._();

  List<ResilienceTip>? _cachedTips;

  Future<List<ResilienceTip>> getTips() async {
    if (_cachedTips != null && _cachedTips!.isNotEmpty) {
      return _cachedTips!;
    }
    final jsonString = await rootBundle.loadString(
      'assets/datafiles/resilience_tips_52_weeks.json',
    );
    final List<dynamic> jsonList = jsonDecode(jsonString);
    _cachedTips =
        jsonList.map((e) => ResilienceTip.fromJson(e as Map<String, dynamic>)).toList();
    return _cachedTips!;
  }

  int getWeekOfYear([DateTime? date]) {
    final now = date ?? DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays + 1;
    int weekNumber = ((dayOfYear - now.weekday + 10) / 7).floor();
    if (weekNumber < 1) {
      return 1;
    } else if (weekNumber > 52) {
      // For years containing 53 weeks, use the last element (52).
      return 52;
    }
    return weekNumber;
  }

  Future<ResilienceTip?> getTipForWeek(int weekNumber) async {
    final tips = await getTips();
    if (tips.isEmpty) return null;
    final clampedWeek = weekNumber.clamp(1, 52);
    return tips.firstWhere(
      (t) => t.weekNumber == clampedWeek,
      orElse: () => tips[clampedWeek - 1],
    );
  }
}
