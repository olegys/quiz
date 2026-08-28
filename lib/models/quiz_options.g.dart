// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizOptionsImpl _$$QuizOptionsImplFromJson(Map<String, dynamic> json) =>
    _$QuizOptionsImpl(
      amount: (json['amount'] as num).toInt(),
      category: (json['category'] as num?)?.toInt(),
      difficulty:
          $enumDecodeNullable(_$QuestionDifficultyEnumMap, json['difficulty']),
      type: $enumDecodeNullable(_$QuestionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$QuizOptionsImplToJson(_$QuizOptionsImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'category': instance.category,
      'difficulty': _$QuestionDifficultyEnumMap[instance.difficulty],
      'type': _$QuestionTypeEnumMap[instance.type],
    };

const _$QuestionDifficultyEnumMap = {
  QuestionDifficulty.easy: 'easy',
  QuestionDifficulty.medium: 'medium',
  QuestionDifficulty.hard: 'hard',
};

const _$QuestionTypeEnumMap = {
  QuestionType.multiple: 'multiple',
  QuestionType.boolean: 'boolean',
};
