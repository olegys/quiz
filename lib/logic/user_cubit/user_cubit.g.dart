// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStateImpl _$$UserStateImplFromJson(Map<String, dynamic> json) =>
    _$UserStateImpl(
      onboardingIsDone: json['onboardingIsDone'] as bool? ?? false,
      version: json['version'] as String? ?? '1.0.0',
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => TriviaCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      quizzes: (json['quizzes'] as List<dynamic>?)
              ?.map((e) => Quiz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      winRate: (json['winRate'] as num?)?.toInt() ?? 0,
      lossRate: (json['lossRate'] as num?)?.toInt() ?? 0,
      totalDone: (json['totalDone'] as num?)?.toInt() ?? 0,
      countOfViewsStatistics:
          (json['countOfViewsStatistics'] as num?)?.toInt() ?? 0,
      achievements: (json['achievements'] as List<dynamic>?)
              ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) =>
    <String, dynamic>{
      'onboardingIsDone': instance.onboardingIsDone,
      'version': instance.version,
      'categories': instance.categories,
      'quizzes': instance.quizzes,
      'winRate': instance.winRate,
      'lossRate': instance.lossRate,
      'totalDone': instance.totalDone,
      'countOfViewsStatistics': instance.countOfViewsStatistics,
      'achievements': instance.achievements,
    };
