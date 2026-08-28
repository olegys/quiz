// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  int get time => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  QuizOptions get options => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;
  int get currentQuestion => throw _privateConstructorUsedError;
  int get winRate => throw _privateConstructorUsedError;
  bool get withoutMistakes => throw _privateConstructorUsedError;
  bool get less1Minute => throw _privateConstructorUsedError;
  bool get isComeback => throw _privateConstructorUsedError;
  bool get isStreak => throw _privateConstructorUsedError;
  int get correctAnswers => throw _privateConstructorUsedError;
  int get incorrectAnswers => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this Quiz to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {int time,
      DateTime date,
      QuizOptions options,
      List<Question> questions,
      int currentQuestion,
      int winRate,
      bool withoutMistakes,
      bool less1Minute,
      bool isComeback,
      bool isStreak,
      int correctAnswers,
      int incorrectAnswers,
      bool isCompleted});

  $QuizOptionsCopyWith<$Res> get options;
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? date = null,
    Object? options = null,
    Object? questions = null,
    Object? currentQuestion = null,
    Object? winRate = null,
    Object? withoutMistakes = null,
    Object? less1Minute = null,
    Object? isComeback = null,
    Object? isStreak = null,
    Object? correctAnswers = null,
    Object? incorrectAnswers = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as QuizOptions,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      currentQuestion: null == currentQuestion
          ? _value.currentQuestion
          : currentQuestion // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as int,
      withoutMistakes: null == withoutMistakes
          ? _value.withoutMistakes
          : withoutMistakes // ignore: cast_nullable_to_non_nullable
              as bool,
      less1Minute: null == less1Minute
          ? _value.less1Minute
          : less1Minute // ignore: cast_nullable_to_non_nullable
              as bool,
      isComeback: null == isComeback
          ? _value.isComeback
          : isComeback // ignore: cast_nullable_to_non_nullable
              as bool,
      isStreak: null == isStreak
          ? _value.isStreak
          : isStreak // ignore: cast_nullable_to_non_nullable
              as bool,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      incorrectAnswers: null == incorrectAnswers
          ? _value.incorrectAnswers
          : incorrectAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuizOptionsCopyWith<$Res> get options {
    return $QuizOptionsCopyWith<$Res>(_value.options, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$QuizImplCopyWith(
          _$QuizImpl value, $Res Function(_$QuizImpl) then) =
      __$$QuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int time,
      DateTime date,
      QuizOptions options,
      List<Question> questions,
      int currentQuestion,
      int winRate,
      bool withoutMistakes,
      bool less1Minute,
      bool isComeback,
      bool isStreak,
      int correctAnswers,
      int incorrectAnswers,
      bool isCompleted});

  @override
  $QuizOptionsCopyWith<$Res> get options;
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res>
    extends _$QuizCopyWithImpl<$Res, _$QuizImpl>
    implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? date = null,
    Object? options = null,
    Object? questions = null,
    Object? currentQuestion = null,
    Object? winRate = null,
    Object? withoutMistakes = null,
    Object? less1Minute = null,
    Object? isComeback = null,
    Object? isStreak = null,
    Object? correctAnswers = null,
    Object? incorrectAnswers = null,
    Object? isCompleted = null,
  }) {
    return _then(_$QuizImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as QuizOptions,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      currentQuestion: null == currentQuestion
          ? _value.currentQuestion
          : currentQuestion // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as int,
      withoutMistakes: null == withoutMistakes
          ? _value.withoutMistakes
          : withoutMistakes // ignore: cast_nullable_to_non_nullable
              as bool,
      less1Minute: null == less1Minute
          ? _value.less1Minute
          : less1Minute // ignore: cast_nullable_to_non_nullable
              as bool,
      isComeback: null == isComeback
          ? _value.isComeback
          : isComeback // ignore: cast_nullable_to_non_nullable
              as bool,
      isStreak: null == isStreak
          ? _value.isStreak
          : isStreak // ignore: cast_nullable_to_non_nullable
              as bool,
      correctAnswers: null == correctAnswers
          ? _value.correctAnswers
          : correctAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      incorrectAnswers: null == incorrectAnswers
          ? _value.incorrectAnswers
          : incorrectAnswers // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizImpl implements _Quiz {
  const _$QuizImpl(
      {required this.time,
      required this.date,
      required this.options,
      required final List<Question> questions,
      required this.currentQuestion,
      required this.winRate,
      required this.withoutMistakes,
      required this.less1Minute,
      required this.isComeback,
      required this.isStreak,
      required this.correctAnswers,
      required this.incorrectAnswers,
      required this.isCompleted})
      : _questions = questions;

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  final int time;
  @override
  final DateTime date;
  @override
  final QuizOptions options;
  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final int currentQuestion;
  @override
  final int winRate;
  @override
  final bool withoutMistakes;
  @override
  final bool less1Minute;
  @override
  final bool isComeback;
  @override
  final bool isStreak;
  @override
  final int correctAnswers;
  @override
  final int incorrectAnswers;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'Quiz(time: $time, date: $date, options: $options, questions: $questions, currentQuestion: $currentQuestion, winRate: $winRate, withoutMistakes: $withoutMistakes, less1Minute: $less1Minute, isComeback: $isComeback, isStreak: $isStreak, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.options, options) || other.options == options) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.currentQuestion, currentQuestion) ||
                other.currentQuestion == currentQuestion) &&
            (identical(other.winRate, winRate) || other.winRate == winRate) &&
            (identical(other.withoutMistakes, withoutMistakes) ||
                other.withoutMistakes == withoutMistakes) &&
            (identical(other.less1Minute, less1Minute) ||
                other.less1Minute == less1Minute) &&
            (identical(other.isComeback, isComeback) ||
                other.isComeback == isComeback) &&
            (identical(other.isStreak, isStreak) ||
                other.isStreak == isStreak) &&
            (identical(other.correctAnswers, correctAnswers) ||
                other.correctAnswers == correctAnswers) &&
            (identical(other.incorrectAnswers, incorrectAnswers) ||
                other.incorrectAnswers == incorrectAnswers) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      date,
      options,
      const DeepCollectionEquality().hash(_questions),
      currentQuestion,
      winRate,
      withoutMistakes,
      less1Minute,
      isComeback,
      isStreak,
      correctAnswers,
      incorrectAnswers,
      isCompleted);

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizImplToJson(
      this,
    );
  }
}

abstract class _Quiz implements Quiz {
  const factory _Quiz(
      {required final int time,
      required final DateTime date,
      required final QuizOptions options,
      required final List<Question> questions,
      required final int currentQuestion,
      required final int winRate,
      required final bool withoutMistakes,
      required final bool less1Minute,
      required final bool isComeback,
      required final bool isStreak,
      required final int correctAnswers,
      required final int incorrectAnswers,
      required final bool isCompleted}) = _$QuizImpl;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  int get time;
  @override
  DateTime get date;
  @override
  QuizOptions get options;
  @override
  List<Question> get questions;
  @override
  int get currentQuestion;
  @override
  int get winRate;
  @override
  bool get withoutMistakes;
  @override
  bool get less1Minute;
  @override
  bool get isComeback;
  @override
  bool get isStreak;
  @override
  int get correctAnswers;
  @override
  int get incorrectAnswers;
  @override
  bool get isCompleted;

  /// Create a copy of Quiz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
