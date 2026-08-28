import 'package:freezed_annotation/freezed_annotation.dart';

import '../helpers/app_enums.dart';

part 'quiz_options.freezed.dart';
part 'quiz_options.g.dart';

@freezed
class QuizOptions with _$QuizOptions {
  const factory QuizOptions({
    required int amount,
    int? category,
    QuestionDifficulty? difficulty,
    QuestionType? type,
  }) = _QuizOptions;

  factory QuizOptions.fromJson(Map<String, dynamic> json) =>
      _$QuizOptionsFromJson(json);
}
