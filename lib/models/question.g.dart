// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      type: $enumDecode(_$QuestionTypeEnumMap, json['type']),
      difficulty: $enumDecode(_$QuestionDifficultyEnumMap, json['difficulty']),
      category: json['category'] as String,
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      incorrectAnswers: (json['incorrect_answers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      allAnswers: (json['allAnswers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      userAnswer: json['userAnswer'] as String?,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'type': _$QuestionTypeEnumMap[instance.type]!,
      'difficulty': _$QuestionDifficultyEnumMap[instance.difficulty]!,
      'category': instance.category,
      'question': instance.question,
      'correct_answer': instance.correctAnswer,
      'incorrect_answers': instance.incorrectAnswers,
      'allAnswers': instance.allAnswers,
      'userAnswer': instance.userAnswer,
    };

const _$QuestionTypeEnumMap = {
  QuestionType.multiple: 'multiple',
  QuestionType.boolean: 'boolean',
};

const _$QuestionDifficultyEnumMap = {
  QuestionDifficulty.easy: 'easy',
  QuestionDifficulty.medium: 'medium',
  QuestionDifficulty.hard: 'hard',
};
