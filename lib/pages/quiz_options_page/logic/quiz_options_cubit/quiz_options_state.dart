part of 'quiz_options_cubit.dart';

@freezed
class QuizOptionsState with _$QuizOptionsState {
  const factory QuizOptionsState({
    @Default(10) int amount,
    int? category,
    QuestionDifficulty? difficulty,
    QuestionType? type,
  }) = _QuizOptionsState;
}
