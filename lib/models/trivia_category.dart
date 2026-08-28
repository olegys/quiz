import 'package:freezed_annotation/freezed_annotation.dart';

part 'trivia_category.freezed.dart';
part 'trivia_category.g.dart';

@freezed
class TriviaCategory with _$TriviaCategory {
  const factory TriviaCategory({
    required int id,
    required String name,
  }) = _TriviaCategory;

  factory TriviaCategory.fromJson(Map<String, dynamic> json) =>
      _$TriviaCategoryFromJson(json);
}
