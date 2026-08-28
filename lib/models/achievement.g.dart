// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementImpl _$$AchievementImplFromJson(Map<String, dynamic> json) =>
    _$AchievementImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      group: $enumDecode(_$AchievementGroupEnumMap, json['group']),
      icon: json['icon'] as String,
      isUnlocked: json['isUnlocked'] as bool? ?? false,
    );

Map<String, dynamic> _$$AchievementImplToJson(_$AchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'group': _$AchievementGroupEnumMap[instance.group]!,
      'icon': instance.icon,
      'isUnlocked': instance.isUnlocked,
    };

const _$AchievementGroupEnumMap = {
  AchievementGroup.creation: 'creation',
  AchievementGroup.completion: 'completion',
  AchievementGroup.difficulty: 'difficulty',
  AchievementGroup.stats: 'stats',
  AchievementGroup.tags: 'tags',
};
