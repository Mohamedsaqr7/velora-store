// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_cubit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NavBarEnum navBarEnum) selectedIconState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(NavBarEnum navBarEnum)? selectedIconState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NavBarEnum navBarEnum)? selectedIconState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SelectedIconState value) selectedIconState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SelectedIconState value)? selectedIconState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SelectedIconState value)? selectedIconState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainCubitStateCopyWith<$Res> {
  factory $MainCubitStateCopyWith(
          MainCubitState value, $Res Function(MainCubitState) then) =
      _$MainCubitStateCopyWithImpl<$Res, MainCubitState>;
}

/// @nodoc
class _$MainCubitStateCopyWithImpl<$Res, $Val extends MainCubitState>
    implements $MainCubitStateCopyWith<$Res> {
  _$MainCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MainCubitStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MainCubitState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NavBarEnum navBarEnum) selectedIconState,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(NavBarEnum navBarEnum)? selectedIconState,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NavBarEnum navBarEnum)? selectedIconState,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_SelectedIconState value) selectedIconState,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SelectedIconState value)? selectedIconState,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SelectedIconState value)? selectedIconState,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MainCubitState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SelectedIconStateImplCopyWith<$Res> {
  factory _$$SelectedIconStateImplCopyWith(_$SelectedIconStateImpl value,
          $Res Function(_$SelectedIconStateImpl) then) =
      __$$SelectedIconStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NavBarEnum navBarEnum});
}

/// @nodoc
class __$$SelectedIconStateImplCopyWithImpl<$Res>
    extends _$MainCubitStateCopyWithImpl<$Res, _$SelectedIconStateImpl>
    implements _$$SelectedIconStateImplCopyWith<$Res> {
  __$$SelectedIconStateImplCopyWithImpl(_$SelectedIconStateImpl _value,
      $Res Function(_$SelectedIconStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navBarEnum = null,
  }) {
    return _then(_$SelectedIconStateImpl(
      navBarEnum: null == navBarEnum
          ? _value.navBarEnum
          : navBarEnum // ignore: cast_nullable_to_non_nullable
              as NavBarEnum,
    ));
  }
}

/// @nodoc

class _$SelectedIconStateImpl implements _SelectedIconState {
  const _$SelectedIconStateImpl({required this.navBarEnum});

  @override
  final NavBarEnum navBarEnum;

  @override
  String toString() {
    return 'MainCubitState.selectedIconState(navBarEnum: $navBarEnum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedIconStateImpl &&
            (identical(other.navBarEnum, navBarEnum) ||
                other.navBarEnum == navBarEnum));
  }

  @override
  int get hashCode => Object.hash(runtimeType, navBarEnum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedIconStateImplCopyWith<_$SelectedIconStateImpl> get copyWith =>
      __$$SelectedIconStateImplCopyWithImpl<_$SelectedIconStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NavBarEnum navBarEnum) selectedIconState,
  }) {
    return selectedIconState(navBarEnum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(NavBarEnum navBarEnum)? selectedIconState,
  }) {
    return selectedIconState?.call(navBarEnum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NavBarEnum navBarEnum)? selectedIconState,
    required TResult orElse(),
  }) {
    if (selectedIconState != null) {
      return selectedIconState(navBarEnum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SelectedIconState value) selectedIconState,
  }) {
    return selectedIconState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SelectedIconState value)? selectedIconState,
  }) {
    return selectedIconState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SelectedIconState value)? selectedIconState,
    required TResult orElse(),
  }) {
    if (selectedIconState != null) {
      return selectedIconState(this);
    }
    return orElse();
  }
}

abstract class _SelectedIconState implements MainCubitState {
  const factory _SelectedIconState({required final NavBarEnum navBarEnum}) =
      _$SelectedIconStateImpl;

  NavBarEnum get navBarEnum;
  @JsonKey(ignore: true)
  _$$SelectedIconStateImplCopyWith<_$SelectedIconStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
