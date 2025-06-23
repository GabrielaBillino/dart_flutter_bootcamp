// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cultivos_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CultivosState {
  List<Cultivo> get activos => throw _privateConstructorUsedError;
  List<Cultivo> get cosechados => throw _privateConstructorUsedError;

  /// Create a copy of CultivosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CultivosStateCopyWith<CultivosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CultivosStateCopyWith<$Res> {
  factory $CultivosStateCopyWith(
    CultivosState value,
    $Res Function(CultivosState) then,
  ) = _$CultivosStateCopyWithImpl<$Res, CultivosState>;
  @useResult
  $Res call({List<Cultivo> activos, List<Cultivo> cosechados});
}

/// @nodoc
class _$CultivosStateCopyWithImpl<$Res, $Val extends CultivosState>
    implements $CultivosStateCopyWith<$Res> {
  _$CultivosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CultivosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activos = null, Object? cosechados = null}) {
    return _then(
      _value.copyWith(
            activos: null == activos
                ? _value.activos
                : activos // ignore: cast_nullable_to_non_nullable
                      as List<Cultivo>,
            cosechados: null == cosechados
                ? _value.cosechados
                : cosechados // ignore: cast_nullable_to_non_nullable
                      as List<Cultivo>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CultivosStateImplCopyWith<$Res>
    implements $CultivosStateCopyWith<$Res> {
  factory _$$CultivosStateImplCopyWith(
    _$CultivosStateImpl value,
    $Res Function(_$CultivosStateImpl) then,
  ) = __$$CultivosStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Cultivo> activos, List<Cultivo> cosechados});
}

/// @nodoc
class __$$CultivosStateImplCopyWithImpl<$Res>
    extends _$CultivosStateCopyWithImpl<$Res, _$CultivosStateImpl>
    implements _$$CultivosStateImplCopyWith<$Res> {
  __$$CultivosStateImplCopyWithImpl(
    _$CultivosStateImpl _value,
    $Res Function(_$CultivosStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CultivosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? activos = null, Object? cosechados = null}) {
    return _then(
      _$CultivosStateImpl(
        activos: null == activos
            ? _value._activos
            : activos // ignore: cast_nullable_to_non_nullable
                  as List<Cultivo>,
        cosechados: null == cosechados
            ? _value._cosechados
            : cosechados // ignore: cast_nullable_to_non_nullable
                  as List<Cultivo>,
      ),
    );
  }
}

/// @nodoc

class _$CultivosStateImpl implements _CultivosState {
  const _$CultivosStateImpl({
    final List<Cultivo> activos = const <Cultivo>[],
    final List<Cultivo> cosechados = const <Cultivo>[],
  }) : _activos = activos,
       _cosechados = cosechados;

  final List<Cultivo> _activos;
  @override
  @JsonKey()
  List<Cultivo> get activos {
    if (_activos is EqualUnmodifiableListView) return _activos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activos);
  }

  final List<Cultivo> _cosechados;
  @override
  @JsonKey()
  List<Cultivo> get cosechados {
    if (_cosechados is EqualUnmodifiableListView) return _cosechados;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cosechados);
  }

  @override
  String toString() {
    return 'CultivosState(activos: $activos, cosechados: $cosechados)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CultivosStateImpl &&
            const DeepCollectionEquality().equals(other._activos, _activos) &&
            const DeepCollectionEquality().equals(
              other._cosechados,
              _cosechados,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_activos),
    const DeepCollectionEquality().hash(_cosechados),
  );

  /// Create a copy of CultivosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CultivosStateImplCopyWith<_$CultivosStateImpl> get copyWith =>
      __$$CultivosStateImplCopyWithImpl<_$CultivosStateImpl>(this, _$identity);
}

abstract class _CultivosState implements CultivosState {
  const factory _CultivosState({
    final List<Cultivo> activos,
    final List<Cultivo> cosechados,
  }) = _$CultivosStateImpl;

  @override
  List<Cultivo> get activos;
  @override
  List<Cultivo> get cosechados;

  /// Create a copy of CultivosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CultivosStateImplCopyWith<_$CultivosStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
