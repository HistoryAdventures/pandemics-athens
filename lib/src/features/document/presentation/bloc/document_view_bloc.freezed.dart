// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'document_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DocumentViewEventTearOff {
  const _$DocumentViewEventTearOff();

  ZoomIn zoomIn() {
    return const ZoomIn();
  }

  ZoomOut zoomOut() {
    return const ZoomOut();
  }
}

/// @nodoc
const $DocumentViewEvent = _$DocumentViewEventTearOff();

/// @nodoc
mixin _$DocumentViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZoomIn value) zoomIn,
    required TResult Function(ZoomOut value) zoomOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZoomIn value)? zoomIn,
    TResult Function(ZoomOut value)? zoomOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentViewEventCopyWith<$Res> {
  factory $DocumentViewEventCopyWith(
          DocumentViewEvent value, $Res Function(DocumentViewEvent) then) =
      _$DocumentViewEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DocumentViewEventCopyWithImpl<$Res>
    implements $DocumentViewEventCopyWith<$Res> {
  _$DocumentViewEventCopyWithImpl(this._value, this._then);

  final DocumentViewEvent _value;
  // ignore: unused_field
  final $Res Function(DocumentViewEvent) _then;
}

/// @nodoc
abstract class $ZoomInCopyWith<$Res> {
  factory $ZoomInCopyWith(ZoomIn value, $Res Function(ZoomIn) then) =
      _$ZoomInCopyWithImpl<$Res>;
}

/// @nodoc
class _$ZoomInCopyWithImpl<$Res> extends _$DocumentViewEventCopyWithImpl<$Res>
    implements $ZoomInCopyWith<$Res> {
  _$ZoomInCopyWithImpl(ZoomIn _value, $Res Function(ZoomIn) _then)
      : super(_value, (v) => _then(v as ZoomIn));

  @override
  ZoomIn get _value => super._value as ZoomIn;
}

/// @nodoc

class _$ZoomIn implements ZoomIn {
  const _$ZoomIn();

  @override
  String toString() {
    return 'DocumentViewEvent.zoomIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ZoomIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
  }) {
    return zoomIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    required TResult orElse(),
  }) {
    if (zoomIn != null) {
      return zoomIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZoomIn value) zoomIn,
    required TResult Function(ZoomOut value) zoomOut,
  }) {
    return zoomIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZoomIn value)? zoomIn,
    TResult Function(ZoomOut value)? zoomOut,
    required TResult orElse(),
  }) {
    if (zoomIn != null) {
      return zoomIn(this);
    }
    return orElse();
  }
}

abstract class ZoomIn implements DocumentViewEvent {
  const factory ZoomIn() = _$ZoomIn;
}

/// @nodoc
abstract class $ZoomOutCopyWith<$Res> {
  factory $ZoomOutCopyWith(ZoomOut value, $Res Function(ZoomOut) then) =
      _$ZoomOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$ZoomOutCopyWithImpl<$Res> extends _$DocumentViewEventCopyWithImpl<$Res>
    implements $ZoomOutCopyWith<$Res> {
  _$ZoomOutCopyWithImpl(ZoomOut _value, $Res Function(ZoomOut) _then)
      : super(_value, (v) => _then(v as ZoomOut));

  @override
  ZoomOut get _value => super._value as ZoomOut;
}

/// @nodoc

class _$ZoomOut implements ZoomOut {
  const _$ZoomOut();

  @override
  String toString() {
    return 'DocumentViewEvent.zoomOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ZoomOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() zoomIn,
    required TResult Function() zoomOut,
  }) {
    return zoomOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? zoomIn,
    TResult Function()? zoomOut,
    required TResult orElse(),
  }) {
    if (zoomOut != null) {
      return zoomOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ZoomIn value) zoomIn,
    required TResult Function(ZoomOut value) zoomOut,
  }) {
    return zoomOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ZoomIn value)? zoomIn,
    TResult Function(ZoomOut value)? zoomOut,
    required TResult orElse(),
  }) {
    if (zoomOut != null) {
      return zoomOut(this);
    }
    return orElse();
  }
}

abstract class ZoomOut implements DocumentViewEvent {
  const factory ZoomOut() = _$ZoomOut;
}

/// @nodoc
class _$DocumentViewStateTearOff {
  const _$DocumentViewStateTearOff();

  Initial initial() {
    return const Initial();
  }

  ZoomedIn zoomedIn() {
    return const ZoomedIn();
  }

  ZoomedOut zoomedOut() {
    return const ZoomedOut();
  }
}

/// @nodoc
const $DocumentViewState = _$DocumentViewStateTearOff();

/// @nodoc
mixin _$DocumentViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() zoomedIn,
    required TResult Function() zoomedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? zoomedIn,
    TResult Function()? zoomedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ZoomedIn value) zoomedIn,
    required TResult Function(ZoomedOut value) zoomedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ZoomedIn value)? zoomedIn,
    TResult Function(ZoomedOut value)? zoomedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentViewStateCopyWith<$Res> {
  factory $DocumentViewStateCopyWith(
          DocumentViewState value, $Res Function(DocumentViewState) then) =
      _$DocumentViewStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DocumentViewStateCopyWithImpl<$Res>
    implements $DocumentViewStateCopyWith<$Res> {
  _$DocumentViewStateCopyWithImpl(this._value, this._then);

  final DocumentViewState _value;
  // ignore: unused_field
  final $Res Function(DocumentViewState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$DocumentViewStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'DocumentViewState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() zoomedIn,
    required TResult Function() zoomedOut,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? zoomedIn,
    TResult Function()? zoomedOut,
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
    required TResult Function(Initial value) initial,
    required TResult Function(ZoomedIn value) zoomedIn,
    required TResult Function(ZoomedOut value) zoomedOut,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ZoomedIn value)? zoomedIn,
    TResult Function(ZoomedOut value)? zoomedOut,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements DocumentViewState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $ZoomedInCopyWith<$Res> {
  factory $ZoomedInCopyWith(ZoomedIn value, $Res Function(ZoomedIn) then) =
      _$ZoomedInCopyWithImpl<$Res>;
}

/// @nodoc
class _$ZoomedInCopyWithImpl<$Res> extends _$DocumentViewStateCopyWithImpl<$Res>
    implements $ZoomedInCopyWith<$Res> {
  _$ZoomedInCopyWithImpl(ZoomedIn _value, $Res Function(ZoomedIn) _then)
      : super(_value, (v) => _then(v as ZoomedIn));

  @override
  ZoomedIn get _value => super._value as ZoomedIn;
}

/// @nodoc

class _$ZoomedIn implements ZoomedIn {
  const _$ZoomedIn();

  @override
  String toString() {
    return 'DocumentViewState.zoomedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ZoomedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() zoomedIn,
    required TResult Function() zoomedOut,
  }) {
    return zoomedIn();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? zoomedIn,
    TResult Function()? zoomedOut,
    required TResult orElse(),
  }) {
    if (zoomedIn != null) {
      return zoomedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ZoomedIn value) zoomedIn,
    required TResult Function(ZoomedOut value) zoomedOut,
  }) {
    return zoomedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ZoomedIn value)? zoomedIn,
    TResult Function(ZoomedOut value)? zoomedOut,
    required TResult orElse(),
  }) {
    if (zoomedIn != null) {
      return zoomedIn(this);
    }
    return orElse();
  }
}

abstract class ZoomedIn implements DocumentViewState {
  const factory ZoomedIn() = _$ZoomedIn;
}

/// @nodoc
abstract class $ZoomedOutCopyWith<$Res> {
  factory $ZoomedOutCopyWith(ZoomedOut value, $Res Function(ZoomedOut) then) =
      _$ZoomedOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$ZoomedOutCopyWithImpl<$Res>
    extends _$DocumentViewStateCopyWithImpl<$Res>
    implements $ZoomedOutCopyWith<$Res> {
  _$ZoomedOutCopyWithImpl(ZoomedOut _value, $Res Function(ZoomedOut) _then)
      : super(_value, (v) => _then(v as ZoomedOut));

  @override
  ZoomedOut get _value => super._value as ZoomedOut;
}

/// @nodoc

class _$ZoomedOut implements ZoomedOut {
  const _$ZoomedOut();

  @override
  String toString() {
    return 'DocumentViewState.zoomedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ZoomedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() zoomedIn,
    required TResult Function() zoomedOut,
  }) {
    return zoomedOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? zoomedIn,
    TResult Function()? zoomedOut,
    required TResult orElse(),
  }) {
    if (zoomedOut != null) {
      return zoomedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(ZoomedIn value) zoomedIn,
    required TResult Function(ZoomedOut value) zoomedOut,
  }) {
    return zoomedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(ZoomedIn value)? zoomedIn,
    TResult Function(ZoomedOut value)? zoomedOut,
    required TResult orElse(),
  }) {
    if (zoomedOut != null) {
      return zoomedOut(this);
    }
    return orElse();
  }
}

abstract class ZoomedOut implements DocumentViewState {
  const factory ZoomedOut() = _$ZoomedOut;
}
