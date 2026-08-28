import 'dart:developer';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../helpers/app_enums.dart';
import '../../models/achievement.dart';
import '../../models/category_response.dart';
import '../../models/quiz.dart';
import '../../models/trivia_category.dart';
import '../../repositories/questions_repository.dart';
import '../../themes/app_colors.dart';
import '../../widgets/dialogs/achievement_dialog.dart';

part 'user_cubit.freezed.dart';
part 'user_cubit.g.dart';
part 'user_state.dart';

class UserCubit extends HydratedCubit<UserState> {
  final QuestionsRepository _questionsRepository;
  static const List<Achievement> _achievements = [
    Achievement(
      id: 'first_quiz',
      title: 'Quiz Architect',
      description: 'Create your first quiz',
      group: AchievementGroup.creation,
      icon: '🏗',
    ),
    Achievement(
      id: 'ten_quizzes',
      title: 'Custom Master',
      description: 'Create 10 custom quizzes',
      group: AchievementGroup.creation,
      icon: '🧩',
    ),
    Achievement(
      id: 'five_categories',
      title: 'Category Curator',
      description: 'Use 5+ different categories',
      group: AchievementGroup.creation,
      icon: '🗂',
    ),
    Achievement(
      id: 'hard_only',
      title: 'Hardcore Builder',
      description: 'Create a quiz with only Hard level questions',
      group: AchievementGroup.creation,
      icon: '🤯',
    ),
    Achievement(
      id: 'first_sport',
      title: 'Just do It',
      description: 'Create your first sports quiz',
      group: AchievementGroup.creation,
      icon: '🥇',
    ),
    Achievement(
      id: 'first_finish',
      title: 'First Shot',
      description: 'Complete 1 quiz',
      group: AchievementGroup.completion,
      icon: '🎯',
    ),
    Achievement(
      id: 'five_perfect',
      title: 'On Fire',
      description: 'Complete 5 quizzes without mistakes',
      group: AchievementGroup.completion,
      icon: '🔥',
    ),
    Achievement(
      id: 'hundred_quizzes',
      title: '100 Club',
      description: 'Complete 100 quizzes',
      group: AchievementGroup.completion,
      icon: '💯',
    ),
    Achievement(
      id: 'ten_one_day',
      title: 'Quiz Marathoner',
      description: 'Complete 10+ quizzes in 1 day',
      group: AchievementGroup.completion,
      icon: '🕒',
    ),
    Achievement(
      id: 'all_categories',
      title: 'All-Rounder',
      description: 'Complete quizzes from all categories',
      group: AchievementGroup.completion,
      icon: '🌐',
    ),
    Achievement(
      id: 'easy_5',
      title: 'Easy Rider',
      description: 'Complete 5 quizzes on easy level',
      group: AchievementGroup.difficulty,
      icon: '🍃',
    ),
    Achievement(
      id: 'medium_5',
      title: 'Medium Thinker',
      description: 'Complete 5 quizzes on medium level',
      group: AchievementGroup.difficulty,
      icon: '⛑️',
    ),
    Achievement(
      id: 'hard_5',
      title: 'Hardcore Brain',
      description: 'Complete 5 quizzes at the hard level',
      group: AchievementGroup.difficulty,
      icon: '💀',
    ),
    Achievement(
      id: 'perfect_hard',
      title: 'Fearless Mind',
      description: 'Complete a hard quiz without a single mistake',
      group: AchievementGroup.difficulty,
      icon: '🛡',
    ),
    Achievement(
      id: 'stats_10',
      title: 'Stat Addict',
      description: 'Check your statistics 10 times',
      group: AchievementGroup.stats,
      icon: '📈',
    ),
    Achievement(
      id: 'accuracy_90',
      title: 'Accuracy Pro',
      description: 'Achieve 90%+ correct answers',
      group: AchievementGroup.stats,
      icon: '💎',
    ),
    Achievement(
      id: 'fast_finish',
      title: 'Fast Finger',
      description: 'Complete a quiz in <1 minute',
      group: AchievementGroup.stats,
      icon: '⚡',
    ),
    Achievement(
      id: 'comeback',
      title: 'Comeback',
      description: 'Start with a mistake and finish without any others',
      group: AchievementGroup.stats,
      icon: '🔁',
    ),
    Achievement(
      id: 'streak_master',
      title: 'Streak Master',
      description: '5 correct answers in a row in 3 consecutive quizzes',
      group: AchievementGroup.stats,
      icon: '📶',
    ),
    Achievement(
      id: 'tag_sport',
      title: 'Sports League',
      description: 'Complete 10 sports quizzes',
      group: AchievementGroup.tags,
      icon: '🏆',
    ),
    Achievement(
      id: 'tag_history',
      title: 'History Buff',
      description: 'Complete 5 history quizzes',
      group: AchievementGroup.tags,
      icon: '🏛',
    ),
    Achievement(
      id: 'tag_movies',
      title: 'Movie Geek',
      description: 'Complete 5 movie-themed quizzes',
      group: AchievementGroup.tags,
      icon: '🎬',
    ),
    Achievement(
      id: 'tag_code',
      title: 'Code Cracker',
      description: 'Complete 5 computer quizzes',
      group: AchievementGroup.tags,
      icon: '💻',
    ),
    Achievement(
      id: 'perfect_15',
      title: 'Know-It-All',
      description: 'Answer all 15 questions in a quiz correctly',
      group: AchievementGroup.tags,
      icon: '🧞',
    ),
  ];

  UserCubit(this._questionsRepository)
      : super(
          const UserState(
            achievements: _achievements,
          ),
        ) {
    getAppInfo();
    getCategories();
    checkAchievements();
  }

  Future<void> getAppInfo() async {
    try {
      final PackageInfo info = await PackageInfo.fromPlatform();

      emit(
        state.copyWith(
          version: info.version,
        ),
      );
    } catch (e) {
      log('$e');
    }
  }

  Future<void> getCategories() async {
    try {
      final CategoryResponse response =
          await _questionsRepository.getCategories();

      emit(
        state.copyWith(
          categories: response.triviaCategories,
        ),
      );
    } catch (e) {
      log('$e');
    }
  }

  void completeOnboarding() {
    emit(
      state.copyWith(
        onboardingIsDone: true,
      ),
    );
  }

  void resetData() {
    emit(
      UserState(
        version: state.version,
        achievements: _achievements,
      ),
    );
  }

  void addQuiz(Quiz quiz) {
    final List<Quiz> quizzes = [...state.quizzes];

    quizzes.add(quiz);

    final int winRate =
        (quizzes.fold(0.0, (a, b) => a + b.winRate) / quizzes.length).toInt();

    final int totalDone = quizzes
        .expand((e) => e.questions)
        .where((e) => e.userAnswer != null)
        .length;

    emit(
      state.copyWith(
        quizzes: quizzes,
        winRate: winRate,
        lossRate: 100 - winRate,
        totalDone: totalDone,
      ),
    );
  }

  void viewStatistics() {
    emit(
      state.copyWith(
        countOfViewsStatistics: state.countOfViewsStatistics + 1,
      ),
    );
  }

  void checkAchievements() async {
    final List<Achievement> unlocked = [];

    for (final Achievement achievement in state.achievements) {
      if (!achievement.isUnlocked && _checkCondition(achievement.id)) {
        unlocked.add(achievement.copyWith(isUnlocked: true));
      }
    }

    if (unlocked.isNotEmpty) {
      emit(
        state.copyWith(
          achievements: [
            for (final Achievement achievement in state.achievements)
              if (unlocked.any((u) => u.id == achievement.id))
                achievement.copyWith(isUnlocked: true)
              else
                achievement
          ],
        ),
      );

      for (final Achievement achievement in unlocked) {
        await SmartDialog.show(
          maskColor: AppColors.backgroundThree,
          builder: (_) => AchievementDialog(
            icon: achievement.icon,
            title: achievement.title,
          ),
        );
      }
    }
  }

  bool _checkCondition(String id) {
    switch (id) {
      case 'first_quiz':
        return state.quizzes.isNotEmpty;
      case 'ten_quizzes':
        return state.quizzes.length >= 10;
      case 'five_categories':
        final Set<int> uniqueCategories = {};
        for (final Quiz quiz in state.quizzes) {
          if (quiz.options.category != null) {
            uniqueCategories.add(quiz.options.category!);
          }
        }
        return uniqueCategories.length >= 5;
      case 'hard_only':
        return state.quizzes
            .any((e) => e.options.difficulty == QuestionDifficulty.hard);
      case 'first_sport':
        return state.quizzes.any((e) => e.options.category == 21);
      case 'first_finish':
        return state.quizzes.any((e) => e.isCompleted);
      case 'five_perfect':
        return state.quizzes.where((e) => e.withoutMistakes).length >= 5;
      case 'hundred_quizzes':
        return state.quizzes.where((e) => e.isCompleted).length >= 100;
      case 'ten_one_day':
        final Map<String, int> quizzesByDate = {};
        for (final Quiz quiz in state.quizzes) {
          if (!quiz.isCompleted) continue;
          final String key =
              '${quiz.date.year}-${quiz.date.month}-${quiz.date.day}';
          quizzesByDate[key] = (quizzesByDate[key] ?? 0) + 1;
          if (quizzesByDate[key]! >= 10) return true;
        }
        return false;
      case 'all_categories':
        final Set<int?> completedCategories = state.quizzes
            .where((e) => e.isCompleted && e.options.category != null)
            .map((e) => e.options.category)
            .toSet();

        return state.categories.isNotEmpty &&
            state.categories
                .map((e) => e.id)
                .toSet()
                .difference(completedCategories)
                .isEmpty;
      case 'easy_5':
        return state.quizzes
                .where(
                  (e) =>
                      e.options.difficulty == QuestionDifficulty.easy &&
                      e.isCompleted,
                )
                .length >=
            5;
      case 'medium_5':
        return state.quizzes
                .where(
                  (e) =>
                      e.options.difficulty == QuestionDifficulty.medium &&
                      e.isCompleted,
                )
                .length >=
            5;
      case 'hard_5':
        return state.quizzes
                .where(
                  (e) =>
                      e.options.difficulty == QuestionDifficulty.hard &&
                      e.isCompleted,
                )
                .length >=
            5;
      case 'perfect_hard':
        return state.quizzes.any(
          (e) =>
              e.options.difficulty == QuestionDifficulty.hard &&
              e.withoutMistakes,
        );
      case 'stats_10':
        return state.countOfViewsStatistics >= 10;
      case 'accuracy_90':
        return state.quizzes.any((e) => e.winRate >= 90);
      case 'fast_finish':
        return state.quizzes.any((e) => e.less1Minute && e.isCompleted);
      case 'comeback':
        return state.quizzes.any((e) => e.isComeback && e.isCompleted);
      case 'streak_master':
        int count = 0;
        for (final quiz in state.quizzes) {
          if (quiz.isStreak) {
            count++;
            if (count >= 3) return true;
          } else {
            count = 0;
          }
        }
        return false;
      case 'tag_sport':
        return state.quizzes
                .where((e) => e.options.category == 21 && e.isCompleted)
                .length >=
            10;
      case 'tag_history':
        return state.quizzes
                .where((e) => e.options.category == 23 && e.isCompleted)
                .length >=
            5;
      case 'tag_movies':
        return state.quizzes
                .where((e) => e.options.category == 11 && e.isCompleted)
                .length >=
            5;
      case 'tag_code':
        return state.quizzes
                .where((e) => e.options.category == 18 && e.isCompleted)
                .length >=
            5;
      case 'perfect_15':
        return state.quizzes.any(
          (e) => e.questions.length >= 15 && e.withoutMistakes,
        );
      default:
        return false;
    }
  }

  @override
  UserState fromJson(Map<String, dynamic> json) => UserState.fromJson(json);

  @override
  Map<String, dynamic> toJson(UserState state) => state.toJson();
}
