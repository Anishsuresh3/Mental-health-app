// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChatBotResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatBotResponse _$ChatBotResponseFromJson(Map<String, dynamic> json) {
  return _ChatBotResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatBotResponse {
  String get res => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatBotResponseCopyWith<ChatBotResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBotResponseCopyWith<$Res> {
  factory $ChatBotResponseCopyWith(
          ChatBotResponse value, $Res Function(ChatBotResponse) then) =
      _$ChatBotResponseCopyWithImpl<$Res, ChatBotResponse>;
  @useResult
  $Res call({String res});
}

/// @nodoc
class _$ChatBotResponseCopyWithImpl<$Res, $Val extends ChatBotResponse>
    implements $ChatBotResponseCopyWith<$Res> {
  _$ChatBotResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? res = null,
  }) {
    return _then(_value.copyWith(
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatBotResponseCopyWith<$Res>
    implements $ChatBotResponseCopyWith<$Res> {
  factory _$$_ChatBotResponseCopyWith(
          _$_ChatBotResponse value, $Res Function(_$_ChatBotResponse) then) =
      __$$_ChatBotResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String res});
}

/// @nodoc
class __$$_ChatBotResponseCopyWithImpl<$Res>
    extends _$ChatBotResponseCopyWithImpl<$Res, _$_ChatBotResponse>
    implements _$$_ChatBotResponseCopyWith<$Res> {
  __$$_ChatBotResponseCopyWithImpl(
      _$_ChatBotResponse _value, $Res Function(_$_ChatBotResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? res = null,
  }) {
    return _then(_$_ChatBotResponse(
      res: null == res
          ? _value.res
          : res // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatBotResponse implements _ChatBotResponse {
  const _$_ChatBotResponse({required this.res});

  factory _$_ChatBotResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatBotResponseFromJson(json);

  @override
  final String res;

  @override
  String toString() {
    return 'ChatBotResponse(res: $res)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatBotResponse &&
            (identical(other.res, res) || other.res == res));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, res);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatBotResponseCopyWith<_$_ChatBotResponse> get copyWith =>
      __$$_ChatBotResponseCopyWithImpl<_$_ChatBotResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatBotResponseToJson(
      this,
    );
  }
}

abstract class _ChatBotResponse implements ChatBotResponse {
  const factory _ChatBotResponse({required final String res}) =
      _$_ChatBotResponse;

  factory _ChatBotResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatBotResponse.fromJson;

  @override
  String get res;
  @override
  @JsonKey(ignore: true)
  _$$_ChatBotResponseCopyWith<_$_ChatBotResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
