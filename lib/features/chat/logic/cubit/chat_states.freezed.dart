// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingChatsList,
    required TResult Function(T chats) loadedChatsList,
    required TResult Function() loadingChatBody,
    required TResult Function(T messages) loadedChatBody,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingChatsList,
    TResult? Function(T chats)? loadedChatsList,
    TResult? Function()? loadingChatBody,
    TResult? Function(T messages)? loadedChatBody,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingChatsList,
    TResult Function(T chats)? loadedChatsList,
    TResult Function()? loadingChatBody,
    TResult Function(T messages)? loadedChatBody,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(LoadingChatsList<T> value) loadingChatsList,
    required TResult Function(LoadedChatsList<T> value) loadedChatsList,
    required TResult Function(LoadingChatBody<T> value) loadingChatBody,
    required TResult Function(LoadedChatBody<T> value) loadedChatBody,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult? Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult? Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult? Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<T, $Res> {
  factory $ChatStateCopyWith(
          ChatState<T> value, $Res Function(ChatState<T>) then) =
      _$ChatStateCopyWithImpl<T, $Res, ChatState<T>>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<T, $Res, $Val extends ChatState<T>>
    implements $ChatStateCopyWith<T, $Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingChatsList,
    required TResult Function(T chats) loadedChatsList,
    required TResult Function() loadingChatBody,
    required TResult Function(T messages) loadedChatBody,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingChatsList,
    TResult? Function(T chats)? loadedChatsList,
    TResult? Function()? loadingChatBody,
    TResult? Function(T messages)? loadedChatBody,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingChatsList,
    TResult Function(T chats)? loadedChatsList,
    TResult Function()? loadingChatBody,
    TResult Function(T messages)? loadedChatBody,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(LoadingChatsList<T> value) loadingChatsList,
    required TResult Function(LoadedChatsList<T> value) loadedChatsList,
    required TResult Function(LoadingChatBody<T> value) loadingChatBody,
    required TResult Function(LoadedChatBody<T> value) loadedChatBody,
    required TResult Function(Error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult? Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult? Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult? Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult? Function(Error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial<T> implements ChatState<T> {
  const factory Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingChatsListImplCopyWith<T, $Res> {
  factory _$$LoadingChatsListImplCopyWith(_$LoadingChatsListImpl<T> value,
          $Res Function(_$LoadingChatsListImpl<T>) then) =
      __$$LoadingChatsListImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingChatsListImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$LoadingChatsListImpl<T>>
    implements _$$LoadingChatsListImplCopyWith<T, $Res> {
  __$$LoadingChatsListImplCopyWithImpl(_$LoadingChatsListImpl<T> _value,
      $Res Function(_$LoadingChatsListImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingChatsListImpl<T> implements LoadingChatsList<T> {
  const _$LoadingChatsListImpl();

  @override
  String toString() {
    return 'ChatState<$T>.loadingChatsList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingChatsListImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingChatsList,
    required TResult Function(T chats) loadedChatsList,
    required TResult Function() loadingChatBody,
    required TResult Function(T messages) loadedChatBody,
    required TResult Function(String message) error,
  }) {
    return loadingChatsList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingChatsList,
    TResult? Function(T chats)? loadedChatsList,
    TResult? Function()? loadingChatBody,
    TResult? Function(T messages)? loadedChatBody,
    TResult? Function(String message)? error,
  }) {
    return loadingChatsList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingChatsList,
    TResult Function(T chats)? loadedChatsList,
    TResult Function()? loadingChatBody,
    TResult Function(T messages)? loadedChatBody,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadingChatsList != null) {
      return loadingChatsList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(LoadingChatsList<T> value) loadingChatsList,
    required TResult Function(LoadedChatsList<T> value) loadedChatsList,
    required TResult Function(LoadingChatBody<T> value) loadingChatBody,
    required TResult Function(LoadedChatBody<T> value) loadedChatBody,
    required TResult Function(Error<T> value) error,
  }) {
    return loadingChatsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult? Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult? Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult? Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult? Function(Error<T> value)? error,
  }) {
    return loadingChatsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loadingChatsList != null) {
      return loadingChatsList(this);
    }
    return orElse();
  }
}

abstract class LoadingChatsList<T> implements ChatState<T> {
  const factory LoadingChatsList() = _$LoadingChatsListImpl<T>;
}

/// @nodoc
abstract class _$$LoadedChatsListImplCopyWith<T, $Res> {
  factory _$$LoadedChatsListImplCopyWith(_$LoadedChatsListImpl<T> value,
          $Res Function(_$LoadedChatsListImpl<T>) then) =
      __$$LoadedChatsListImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T chats});
}

/// @nodoc
class __$$LoadedChatsListImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$LoadedChatsListImpl<T>>
    implements _$$LoadedChatsListImplCopyWith<T, $Res> {
  __$$LoadedChatsListImplCopyWithImpl(_$LoadedChatsListImpl<T> _value,
      $Res Function(_$LoadedChatsListImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = freezed,
  }) {
    return _then(_$LoadedChatsListImpl<T>(
      freezed == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoadedChatsListImpl<T> implements LoadedChatsList<T> {
  const _$LoadedChatsListImpl(this.chats);

  @override
  final T chats;

  @override
  String toString() {
    return 'ChatState<$T>.loadedChatsList(chats: $chats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedChatsListImpl<T> &&
            const DeepCollectionEquality().equals(other.chats, chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedChatsListImplCopyWith<T, _$LoadedChatsListImpl<T>> get copyWith =>
      __$$LoadedChatsListImplCopyWithImpl<T, _$LoadedChatsListImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingChatsList,
    required TResult Function(T chats) loadedChatsList,
    required TResult Function() loadingChatBody,
    required TResult Function(T messages) loadedChatBody,
    required TResult Function(String message) error,
  }) {
    return loadedChatsList(chats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingChatsList,
    TResult? Function(T chats)? loadedChatsList,
    TResult? Function()? loadingChatBody,
    TResult? Function(T messages)? loadedChatBody,
    TResult? Function(String message)? error,
  }) {
    return loadedChatsList?.call(chats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingChatsList,
    TResult Function(T chats)? loadedChatsList,
    TResult Function()? loadingChatBody,
    TResult Function(T messages)? loadedChatBody,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedChatsList != null) {
      return loadedChatsList(chats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(LoadingChatsList<T> value) loadingChatsList,
    required TResult Function(LoadedChatsList<T> value) loadedChatsList,
    required TResult Function(LoadingChatBody<T> value) loadingChatBody,
    required TResult Function(LoadedChatBody<T> value) loadedChatBody,
    required TResult Function(Error<T> value) error,
  }) {
    return loadedChatsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult? Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult? Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult? Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult? Function(Error<T> value)? error,
  }) {
    return loadedChatsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loadedChatsList != null) {
      return loadedChatsList(this);
    }
    return orElse();
  }
}

abstract class LoadedChatsList<T> implements ChatState<T> {
  const factory LoadedChatsList(final T chats) = _$LoadedChatsListImpl<T>;

  T get chats;
  @JsonKey(ignore: true)
  _$$LoadedChatsListImplCopyWith<T, _$LoadedChatsListImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingChatBodyImplCopyWith<T, $Res> {
  factory _$$LoadingChatBodyImplCopyWith(_$LoadingChatBodyImpl<T> value,
          $Res Function(_$LoadingChatBodyImpl<T>) then) =
      __$$LoadingChatBodyImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingChatBodyImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$LoadingChatBodyImpl<T>>
    implements _$$LoadingChatBodyImplCopyWith<T, $Res> {
  __$$LoadingChatBodyImplCopyWithImpl(_$LoadingChatBodyImpl<T> _value,
      $Res Function(_$LoadingChatBodyImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingChatBodyImpl<T> implements LoadingChatBody<T> {
  const _$LoadingChatBodyImpl();

  @override
  String toString() {
    return 'ChatState<$T>.loadingChatBody()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingChatBodyImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingChatsList,
    required TResult Function(T chats) loadedChatsList,
    required TResult Function() loadingChatBody,
    required TResult Function(T messages) loadedChatBody,
    required TResult Function(String message) error,
  }) {
    return loadingChatBody();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingChatsList,
    TResult? Function(T chats)? loadedChatsList,
    TResult? Function()? loadingChatBody,
    TResult? Function(T messages)? loadedChatBody,
    TResult? Function(String message)? error,
  }) {
    return loadingChatBody?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingChatsList,
    TResult Function(T chats)? loadedChatsList,
    TResult Function()? loadingChatBody,
    TResult Function(T messages)? loadedChatBody,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadingChatBody != null) {
      return loadingChatBody();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(LoadingChatsList<T> value) loadingChatsList,
    required TResult Function(LoadedChatsList<T> value) loadedChatsList,
    required TResult Function(LoadingChatBody<T> value) loadingChatBody,
    required TResult Function(LoadedChatBody<T> value) loadedChatBody,
    required TResult Function(Error<T> value) error,
  }) {
    return loadingChatBody(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult? Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult? Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult? Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult? Function(Error<T> value)? error,
  }) {
    return loadingChatBody?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loadingChatBody != null) {
      return loadingChatBody(this);
    }
    return orElse();
  }
}

abstract class LoadingChatBody<T> implements ChatState<T> {
  const factory LoadingChatBody() = _$LoadingChatBodyImpl<T>;
}

/// @nodoc
abstract class _$$LoadedChatBodyImplCopyWith<T, $Res> {
  factory _$$LoadedChatBodyImplCopyWith(_$LoadedChatBodyImpl<T> value,
          $Res Function(_$LoadedChatBodyImpl<T>) then) =
      __$$LoadedChatBodyImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T messages});
}

/// @nodoc
class __$$LoadedChatBodyImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$LoadedChatBodyImpl<T>>
    implements _$$LoadedChatBodyImplCopyWith<T, $Res> {
  __$$LoadedChatBodyImplCopyWithImpl(_$LoadedChatBodyImpl<T> _value,
      $Res Function(_$LoadedChatBodyImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_$LoadedChatBodyImpl<T>(
      freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$LoadedChatBodyImpl<T> implements LoadedChatBody<T> {
  const _$LoadedChatBodyImpl(this.messages);

  @override
  final T messages;

  @override
  String toString() {
    return 'ChatState<$T>.loadedChatBody(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedChatBodyImpl<T> &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedChatBodyImplCopyWith<T, _$LoadedChatBodyImpl<T>> get copyWith =>
      __$$LoadedChatBodyImplCopyWithImpl<T, _$LoadedChatBodyImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingChatsList,
    required TResult Function(T chats) loadedChatsList,
    required TResult Function() loadingChatBody,
    required TResult Function(T messages) loadedChatBody,
    required TResult Function(String message) error,
  }) {
    return loadedChatBody(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingChatsList,
    TResult? Function(T chats)? loadedChatsList,
    TResult? Function()? loadingChatBody,
    TResult? Function(T messages)? loadedChatBody,
    TResult? Function(String message)? error,
  }) {
    return loadedChatBody?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingChatsList,
    TResult Function(T chats)? loadedChatsList,
    TResult Function()? loadingChatBody,
    TResult Function(T messages)? loadedChatBody,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedChatBody != null) {
      return loadedChatBody(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(LoadingChatsList<T> value) loadingChatsList,
    required TResult Function(LoadedChatsList<T> value) loadedChatsList,
    required TResult Function(LoadingChatBody<T> value) loadingChatBody,
    required TResult Function(LoadedChatBody<T> value) loadedChatBody,
    required TResult Function(Error<T> value) error,
  }) {
    return loadedChatBody(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult? Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult? Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult? Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult? Function(Error<T> value)? error,
  }) {
    return loadedChatBody?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loadedChatBody != null) {
      return loadedChatBody(this);
    }
    return orElse();
  }
}

abstract class LoadedChatBody<T> implements ChatState<T> {
  const factory LoadedChatBody(final T messages) = _$LoadedChatBodyImpl<T>;

  T get messages;
  @JsonKey(ignore: true)
  _$$LoadedChatBodyImplCopyWith<T, _$LoadedChatBodyImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$ChatStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingChatsList,
    required TResult Function(T chats) loadedChatsList,
    required TResult Function() loadingChatBody,
    required TResult Function(T messages) loadedChatBody,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingChatsList,
    TResult? Function(T chats)? loadedChatsList,
    TResult? Function()? loadingChatBody,
    TResult? Function(T messages)? loadedChatBody,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingChatsList,
    TResult Function(T chats)? loadedChatsList,
    TResult Function()? loadingChatBody,
    TResult Function(T messages)? loadedChatBody,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial<T> value) initial,
    required TResult Function(LoadingChatsList<T> value) loadingChatsList,
    required TResult Function(LoadedChatsList<T> value) loadedChatsList,
    required TResult Function(LoadingChatBody<T> value) loadingChatBody,
    required TResult Function(LoadedChatBody<T> value) loadedChatBody,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial<T> value)? initial,
    TResult? Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult? Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult? Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult? Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial<T> value)? initial,
    TResult Function(LoadingChatsList<T> value)? loadingChatsList,
    TResult Function(LoadedChatsList<T> value)? loadedChatsList,
    TResult Function(LoadingChatBody<T> value)? loadingChatBody,
    TResult Function(LoadedChatBody<T> value)? loadedChatBody,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements ChatState<T> {
  const factory Error(final String message) = _$ErrorImpl<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
