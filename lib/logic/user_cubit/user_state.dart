part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool onboardingIsDone,
    @Default('1.0.0') String version,
    @Default([]) List<TriviaCategory> categories,
    @Default([]) List<Quiz> quizzes,
    @Default(0) int winRate,
    @Default(0) int lossRate,
    @Default(0) int totalDone,
    @Default(0) int countOfViewsStatistics,
    @Default([]) List<Achievement> achievements,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}
