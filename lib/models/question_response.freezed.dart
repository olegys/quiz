// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) {
  return _QuestionResponse.fromJson(json);
}

/// @nodoc
mixin _$QuestionResponse {
  @JsonKey(name: 'response_code')
  int get responseCode => throw _privateConstructorUsedError;
  List<Question> get results => throw _privateConstructorUsedError;

  /// Serializes this QuestionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionResponseCopyWith<QuestionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionResponseCopyWith<$Res> {
  factory $QuestionResponseCopyWith(
          QuestionResponse value, $Res Function(QuestionResponse) then) =
      _$QuestionResponseCopyWithImpl<$Res, QuestionResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'response_code') int responseCode,
      List<Question> results});
}

/// @nodoc
class _$QuestionResponseCopyWithImpl<$Res, $Val extends QuestionResponse>
    implements $QuestionResponseCopyWith<$Res> {
  _$QuestionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionResponseImplCopyWith<$Res>
    implements $QuestionResponseCopyWith<$Res> {
  factory _$$QuestionResponseImplCopyWith(_$QuestionResponseImpl value,
          $Res Function(_$QuestionResponseImpl) then) =
      __$$QuestionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'response_code') int responseCode,
      List<Question> results});
}

/// @nodoc
class __$$QuestionResponseImplCopyWithImpl<$Res>
    extends _$QuestionResponseCopyWithImpl<$Res, _$QuestionResponseImpl>
    implements _$$QuestionResponseImplCopyWith<$Res> {
  __$$QuestionResponseImplCopyWithImpl(_$QuestionResponseImpl _value,
      $Res Function(_$QuestionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? results = null,
  }) {
    return _then(_$QuestionResponseImpl(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionResponseImpl implements _QuestionResponse {
  const _$QuestionResponseImpl(
      {@JsonKey(name: 'response_code') required this.responseCode,
      required final List<Question> results})
      : _results = results;

  factory _$QuestionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'response_code')
  final int responseCode;
  final List<Question> _results;
  @override
  List<Question> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'QuestionResponse(responseCode: $responseCode, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionResponseImpl &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, responseCode, const DeepCollectionEquality().hash(_results));

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionResponseImplCopyWith<_$QuestionResponseImpl> get copyWith =>
      __$$QuestionResponseImplCopyWithImpl<_$QuestionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionResponseImplToJson(
      this,
    );
  }
}

abstract class _QuestionResponse implements QuestionResponse {
  const factory _QuestionResponse(
      {@JsonKey(name: 'response_code') required final int responseCode,
      required final List<Question> results}) = _$QuestionResponseImpl;

  factory _QuestionResponse.fromJson(Map<String, dynamic> json) =
      _$QuestionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'response_code')
  int get responseCode;
  @override
  List<Question> get results;

  /// Create a copy of QuestionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionResponseImplCopyWith<_$QuestionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
