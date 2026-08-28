// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../helpers/app_enums.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required QuestionType type,
    required QuestionDifficulty difficulty,
    required String category,
    required String question,
    @JsonKey(name: 'correct_answer') required String correctAnswer,
    @JsonKey(name: 'incorrect_answers') required List<String> incorrectAnswers,
    @Default([]) List<String> allAnswers,
    String? userAnswer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
