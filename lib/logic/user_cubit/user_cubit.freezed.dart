// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

/// @nodoc
mixin _$UserState {
  bool get onboardingIsDone => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  List<TriviaCategory> get categories => throw _privateConstructorUsedError;
  List<Quiz> get quizzes => throw _privateConstructorUsedError;
  int get winRate => throw _privateConstructorUsedError;
  int get lossRate => throw _privateConstructorUsedError;
  int get totalDone => throw _privateConstructorUsedError;
  int get countOfViewsStatistics => throw _privateConstructorUsedError;
  List<Achievement> get achievements => throw _privateConstructorUsedError;

  /// Serializes this UserState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {bool onboardingIsDone,
      String version,
      List<TriviaCategory> categories,
      List<Quiz> quizzes,
      int winRate,
      int lossRate,
      int totalDone,
      int countOfViewsStatistics,
      List<Achievement> achievements});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboardingIsDone = null,
    Object? version = null,
    Object? categories = null,
    Object? quizzes = null,
    Object? winRate = null,
    Object? lossRate = null,
    Object? totalDone = null,
    Object? countOfViewsStatistics = null,
    Object? achievements = null,
  }) {
    return _then(_value.copyWith(
      onboardingIsDone: null == onboardingIsDone
          ? _value.onboardingIsDone
          : onboardingIsDone // ignore: cast_nullable_to_non_nullable
              as bool,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TriviaCategory>,
      quizzes: null == quizzes
          ? _value.quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as int,
      lossRate: null == lossRate
          ? _value.lossRate
          : lossRate // ignore: cast_nullable_to_non_nullable
              as int,
      totalDone: null == totalDone
          ? _value.totalDone
          : totalDone // ignore: cast_nullable_to_non_nullable
              as int,
      countOfViewsStatistics: null == countOfViewsStatistics
          ? _value.countOfViewsStatistics
          : countOfViewsStatistics // ignore: cast_nullable_to_non_nullable
              as int,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool onboardingIsDone,
      String version,
      List<TriviaCategory> categories,
      List<Quiz> quizzes,
      int winRate,
      int lossRate,
      int totalDone,
      int countOfViewsStatistics,
      List<Achievement> achievements});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onboardingIsDone = null,
    Object? version = null,
    Object? categories = null,
    Object? quizzes = null,
    Object? winRate = null,
    Object? lossRate = null,
    Object? totalDone = null,
    Object? countOfViewsStatistics = null,
    Object? achievements = null,
  }) {
    return _then(_$UserStateImpl(
      onboardingIsDone: null == onboardingIsDone
          ? _value.onboardingIsDone
          : onboardingIsDone // ignore: cast_nullable_to_non_nullable
              as bool,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TriviaCategory>,
      quizzes: null == quizzes
          ? _value._quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as int,
      lossRate: null == lossRate
          ? _value.lossRate
          : lossRate // ignore: cast_nullable_to_non_nullable
              as int,
      totalDone: null == totalDone
          ? _value.totalDone
          : totalDone // ignore: cast_nullable_to_non_nullable
              as int,
      countOfViewsStatistics: null == countOfViewsStatistics
          ? _value.countOfViewsStatistics
          : countOfViewsStatistics // ignore: cast_nullable_to_non_nullable
              as int,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.onboardingIsDone = false,
      this.version = '1.0.0',
      final List<TriviaCategory> categories = const [],
      final List<Quiz> quizzes = const [],
      this.winRate = 0,
      this.lossRate = 0,
      this.totalDone = 0,
      this.countOfViewsStatistics = 0,
      final List<Achievement> achievements = const []})
      : _categories = categories,
        _quizzes = quizzes,
        _achievements = achievements;

  factory _$UserStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStateImplFromJson(json);

  @override
  @JsonKey()
  final bool onboardingIsDone;
  @override
  @JsonKey()
  final String version;
  final List<TriviaCategory> _categories;
  @override
  @JsonKey()
  List<TriviaCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Quiz> _quizzes;
  @override
  @JsonKey()
  List<Quiz> get quizzes {
    if (_quizzes is EqualUnmodifiableListView) return _quizzes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizzes);
  }

  @override
  @JsonKey()
  final int winRate;
  @override
  @JsonKey()
  final int lossRate;
  @override
  @JsonKey()
  final int totalDone;
  @override
  @JsonKey()
  final int countOfViewsStatistics;
  final List<Achievement> _achievements;
  @override
  @JsonKey()
  List<Achievement> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  String toString() {
    return 'UserState(onboardingIsDone: $onboardingIsDone, version: $version, categories: $categories, quizzes: $quizzes, winRate: $winRate, lossRate: $lossRate, totalDone: $totalDone, countOfViewsStatistics: $countOfViewsStatistics, achievements: $achievements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.onboardingIsDone, onboardingIsDone) ||
                other.onboardingIsDone == onboardingIsDone) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._quizzes, _quizzes) &&
            (identical(other.winRate, winRate) || other.winRate == winRate) &&
            (identical(other.lossRate, lossRate) ||
                other.lossRate == lossRate) &&
            (identical(other.totalDone, totalDone) ||
                other.totalDone == totalDone) &&
            (identical(other.countOfViewsStatistics, countOfViewsStatistics) ||
                other.countOfViewsStatistics == countOfViewsStatistics) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      onboardingIsDone,
      version,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_quizzes),
      winRate,
      lossRate,
      totalDone,
      countOfViewsStatistics,
      const DeepCollectionEquality().hash(_achievements));

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStateImplToJson(
      this,
    );
  }
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {final bool onboardingIsDone,
      final String version,
      final List<TriviaCategory> categories,
      final List<Quiz> quizzes,
      final int winRate,
      final int lossRate,
      final int totalDone,
      final int countOfViewsStatistics,
      final List<Achievement> achievements}) = _$UserStateImpl;

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$UserStateImpl.fromJson;

  @override
  bool get onboardingIsDone;
  @override
  String get version;
  @override
  List<TriviaCategory> get categories;
  @override
  List<Quiz> get quizzes;
  @override
  int get winRate;
  @override
  int get lossRate;
  @override
  int get totalDone;
  @override
  int get countOfViewsStatistics;
  @override
  List<Achievement> get achievements;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
