import 'package:freezed_annotation/freezed_annotation.dart';

import 'question.dart';
import 'quiz_options.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required int time,
    required DateTime date,
    required QuizOptions options,
    required List<Question> questions,
    required int currentQuestion,
    required int winRate,
    required bool withoutMistakes,
    required bool less1Minute,
    required bool isComeback,
    required bool isStreak,
    required int correctAnswers,
    required int incorrectAnswers,
    required bool isCompleted,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}
