// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      time: (json['time'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      options: QuizOptions.fromJson(json['options'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentQuestion: (json['currentQuestion'] as num).toInt(),
      winRate: (json['winRate'] as num).toInt(),
      withoutMistakes: json['withoutMistakes'] as bool,
      less1Minute: json['less1Minute'] as bool,
      isComeback: json['isComeback'] as bool,
      isStreak: json['isStreak'] as bool,
      correctAnswers: (json['correctAnswers'] as num).toInt(),
      incorrectAnswers: (json['incorrectAnswers'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool,
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'date': instance.date.toIso8601String(),
      'options': instance.options,
      'questions': instance.questions,
      'currentQuestion': instance.currentQuestion,
      'winRate': instance.winRate,
      'withoutMistakes': instance.withoutMistakes,
      'less1Minute': instance.less1Minute,
      'isComeback': instance.isComeback,
      'isStreak': instance.isStreak,
      'correctAnswers': instance.correctAnswers,
      'incorrectAnswers': instance.incorrectAnswers,
      'isCompleted': instance.isCompleted,
    };
