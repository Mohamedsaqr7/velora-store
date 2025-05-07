// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRoleResponse uerRloe) success,
    required TResult Function() lodaing,
    required TResult Function(ErrorHandler errorHandler) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRoleResponse uerRloe)? success,
    TResult? Function()? lodaing,
    TResult? Function(ErrorHandler errorHandler)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRoleResponse uerRloe)? success,
    TResult Function()? lodaing,
    TResult Function(ErrorHandler errorHandler)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) lodaing,
    required TResult Function(_Error value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? lodaing,
    TResult? Function(_Error value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? lodaing,
    TResult Function(_Error value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStateCopyWith<$Res> {
  factory $UserProfileStateCopyWith(
          UserProfileState value, $Res Function(UserProfileState) then) =
      _$UserProfileStateCopyWithImpl<$Res, UserProfileState>;
}

/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res, $Val extends UserProfileState>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserRoleResponse uerRloe});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uerRloe = null,
  }) {
    return _then(_$SuccessImpl(
      null == uerRloe
          ? _value.uerRloe
          : uerRloe // ignore: cast_nullable_to_non_nullable
              as UserRoleResponse,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.uerRloe);

  @override
  final UserRoleResponse uerRloe;

  @override
  String toString() {
    return 'UserProfileState.success(uerRloe: $uerRloe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.uerRloe, uerRloe) || other.uerRloe == uerRloe));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uerRloe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRoleResponse uerRloe) success,
    required TResult Function() lodaing,
    required TResult Function(ErrorHandler errorHandler) failure,
  }) {
    return success(uerRloe);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRoleResponse uerRloe)? success,
    TResult? Function()? lodaing,
    TResult? Function(ErrorHandler errorHandler)? failure,
  }) {
    return success?.call(uerRloe);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRoleResponse uerRloe)? success,
    TResult Function()? lodaing,
    TResult Function(ErrorHandler errorHandler)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(uerRloe);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) lodaing,
    required TResult Function(_Error value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? lodaing,
    TResult? Function(_Error value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? lodaing,
    TResult Function(_Error value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements UserProfileState {
  const factory _Success(final UserRoleResponse uerRloe) = _$SuccessImpl;

  UserRoleResponse get uerRloe;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserProfileState.lodaing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRoleResponse uerRloe) success,
    required TResult Function() lodaing,
    required TResult Function(ErrorHandler errorHandler) failure,
  }) {
    return lodaing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRoleResponse uerRloe)? success,
    TResult? Function()? lodaing,
    TResult? Function(ErrorHandler errorHandler)? failure,
  }) {
    return lodaing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRoleResponse uerRloe)? success,
    TResult Function()? lodaing,
    TResult Function(ErrorHandler errorHandler)? failure,
    required TResult orElse(),
  }) {
    if (lodaing != null) {
      return lodaing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) lodaing,
    required TResult Function(_Error value) failure,
  }) {
    return lodaing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? lodaing,
    TResult? Function(_Error value)? failure,
  }) {
    return lodaing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? lodaing,
    TResult Function(_Error value)? failure,
    required TResult orElse(),
  }) {
    if (lodaing != null) {
      return lodaing(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserProfileState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorHandler errorHandler});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorHandler = null,
  }) {
    return _then(_$ErrorImpl(
      null == errorHandler
          ? _value.errorHandler
          : errorHandler // ignore: cast_nullable_to_non_nullable
              as ErrorHandler,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.errorHandler);

  @override
  final ErrorHandler errorHandler;

  @override
  String toString() {
    return 'UserProfileState.failure(errorHandler: $errorHandler)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errorHandler, errorHandler) ||
                other.errorHandler == errorHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorHandler);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserRoleResponse uerRloe) success,
    required TResult Function() lodaing,
    required TResult Function(ErrorHandler errorHandler) failure,
  }) {
    return failure(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserRoleResponse uerRloe)? success,
    TResult? Function()? lodaing,
    TResult? Function(ErrorHandler errorHandler)? failure,
  }) {
    return failure?.call(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserRoleResponse uerRloe)? success,
    TResult Function()? lodaing,
    TResult Function(ErrorHandler errorHandler)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorHandler);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success value) success,
    required TResult Function(_Loading value) lodaing,
    required TResult Function(_Error value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Success value)? success,
    TResult? Function(_Loading value)? lodaing,
    TResult? Function(_Error value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success value)? success,
    TResult Function(_Loading value)? lodaing,
    TResult Function(_Error value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserProfileState {
  const factory _Error(final ErrorHandler errorHandler) = _$ErrorImpl;

  ErrorHandler get errorHandler;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
