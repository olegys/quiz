import 'package:flutter/material.dart';

import '../i18n/strings.g.dart';
import 'app_enums.dart';

extension QuestionDifficultyX on QuestionDifficulty {
  String getTitle(BuildContext context) {
    final Translations tr = Translations.of(context);

    switch (this) {
      case QuestionDifficulty.easy:
        return tr.easy;
      case QuestionDifficulty.medium:
        return tr.medium;
      case QuestionDifficulty.hard:
        return tr.hard;
    }
  }
}

extension QuestionTypeX on QuestionType {
  String getTitle(BuildContext context) {
    final Translations tr = Translations.of(context);

    switch (this) {
      case QuestionType.multiple:
        return tr.multipleChoice;
      case QuestionType.boolean:
        return tr.trueFalse;
    }
  }
}

extension AchievementGroupX on AchievementGroup {
  String getTitle(BuildContext context) {
    final Translations tr = Translations.of(context);

    switch (this) {
      case AchievementGroup.creation:
        return tr.creatingQuizzes;
      case AchievementGroup.completion:
        return tr.completingQuizzes;
      case AchievementGroup.difficulty:
        return tr.difficulty;
      case AchievementGroup.stats:
        return tr.statisticsRecords;
      case AchievementGroup.tags:
        return tr.intellectualTags;
    }
  }
}
