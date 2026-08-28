// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizOptions _$QuizOptionsFromJson(Map<String, dynamic> json) {
  return _QuizOptions.fromJson(json);
}

/// @nodoc
mixin _$QuizOptions {
  int get amount => throw _privateConstructorUsedError;
  int? get category => throw _privateConstructorUsedError;
  QuestionDifficulty? get difficulty => throw _privateConstructorUsedError;
  QuestionType? get type => throw _privateConstructorUsedError;

  /// Serializes this QuizOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizOptionsCopyWith<QuizOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizOptionsCopyWith<$Res> {
  factory $QuizOptionsCopyWith(
          QuizOptions value, $Res Function(QuizOptions) then) =
      _$QuizOptionsCopyWithImpl<$Res, QuizOptions>;
  @useResult
  $Res call(
      {int amount,
      int? category,
      QuestionDifficulty? difficulty,
      QuestionType? type});
}

/// @nodoc
class _$QuizOptionsCopyWithImpl<$Res, $Val extends QuizOptions>
    implements $QuizOptionsCopyWith<$Res> {
  _$QuizOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? category = freezed,
    Object? difficulty = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as QuestionDifficulty?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizOptionsImplCopyWith<$Res>
    implements $QuizOptionsCopyWith<$Res> {
  factory _$$QuizOptionsImplCopyWith(
          _$QuizOptionsImpl value, $Res Function(_$QuizOptionsImpl) then) =
      __$$QuizOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int amount,
      int? category,
      QuestionDifficulty? difficulty,
      QuestionType? type});
}

/// @nodoc
class __$$QuizOptionsImplCopyWithImpl<$Res>
    extends _$QuizOptionsCopyWithImpl<$Res, _$QuizOptionsImpl>
    implements _$$QuizOptionsImplCopyWith<$Res> {
  __$$QuizOptionsImplCopyWithImpl(
      _$QuizOptionsImpl _value, $Res Function(_$QuizOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? category = freezed,
    Object? difficulty = freezed,
    Object? type = freezed,
  }) {
    return _then(_$QuizOptionsImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as QuestionDifficulty?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuestionType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizOptionsImpl implements _QuizOptions {
  const _$QuizOptionsImpl(
      {required this.amount, this.category, this.difficulty, this.type});

  factory _$QuizOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizOptionsImplFromJson(json);

  @override
  final int amount;
  @override
  final int? category;
  @override
  final QuestionDifficulty? difficulty;
  @override
  final QuestionType? type;

  @override
  String toString() {
    return 'QuizOptions(amount: $amount, category: $category, difficulty: $difficulty, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizOptionsImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, category, difficulty, type);

  /// Create a copy of QuizOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizOptionsImplCopyWith<_$QuizOptionsImpl> get copyWith =>
      __$$QuizOptionsImplCopyWithImpl<_$QuizOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizOptionsImplToJson(
      this,
    );
  }
}

abstract class _QuizOptions implements QuizOptions {
  const factory _QuizOptions(
      {required final int amount,
      final int? category,
      final QuestionDifficulty? difficulty,
      final QuestionType? type}) = _$QuizOptionsImpl;

  factory _QuizOptions.fromJson(Map<String, dynamic> json) =
      _$QuizOptionsImpl.fromJson;

  @override
  int get amount;
  @override
  int? get category;
  @override
  QuestionDifficulty? get difficulty;
  @override
  QuestionType? get type;

  /// Create a copy of QuizOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizOptionsImplCopyWith<_$QuizOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
