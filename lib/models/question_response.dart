// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'question.dart';

part 'question_response.freezed.dart';
part 'question_response.g.dart';

@freezed
class QuestionResponse with _$QuestionResponse {
  const factory QuestionResponse({
    @JsonKey(name: 'response_code') required int responseCode,
    required List<Question> results,
  }) = _QuestionResponse;

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);
}
