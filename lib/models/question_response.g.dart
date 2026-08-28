// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionResponseImpl _$$QuestionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionResponseImpl(
      responseCode: (json['response_code'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionResponseImplToJson(
        _$QuestionResponseImpl instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'results': instance.results,
    };
