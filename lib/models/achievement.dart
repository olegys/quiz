import 'package:freezed_annotation/freezed_annotation.dart';

import '../helpers/app_enums.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String title,
    required String description,
    required AchievementGroup group,
    required String icon,
    @Default(false) bool isUnlocked,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}
