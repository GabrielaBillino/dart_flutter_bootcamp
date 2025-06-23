// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cultivo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Cultivo _$CultivoFromJson(Map<String, dynamic> json) {
  return _Cultivo.fromJson(json);
}

/// @nodoc
mixin _$Cultivo {
  String get nombre => throw _privateConstructorUsedError;
  DateTime get fechaSiembra => throw _privateConstructorUsedError;
  bool get cosechado => throw _privateConstructorUsedError;

  /// Serializes this Cultivo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cultivo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CultivoCopyWith<Cultivo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CultivoCopyWith<$Res> {
  factory $CultivoCopyWith(Cultivo value, $Res Function(Cultivo) then) =
      _$CultivoCopyWithImpl<$Res, Cultivo>;
  @useResult
  $Res call({String nombre, DateTime fechaSiembra, bool cosechado});
}

/// @nodoc
class _$CultivoCopyWithImpl<$Res, $Val extends Cultivo>
    implements $CultivoCopyWith<$Res> {
  _$CultivoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cultivo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombre = null,
    Object? fechaSiembra = null,
    Object? cosechado = null,
  }) {
    return _then(
      _value.copyWith(
            nombre: null == nombre
                ? _value.nombre
                : nombre // ignore: cast_nullable_to_non_nullable
                      as String,
            fechaSiembra: null == fechaSiembra
                ? _value.fechaSiembra
                : fechaSiembra // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            cosechado: null == cosechado
                ? _value.cosechado
                : cosechado // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CultivoImplCopyWith<$Res> implements $CultivoCopyWith<$Res> {
  factory _$$CultivoImplCopyWith(
    _$CultivoImpl value,
    $Res Function(_$CultivoImpl) then,
  ) = __$$CultivoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nombre, DateTime fechaSiembra, bool cosechado});
}

/// @nodoc
class __$$CultivoImplCopyWithImpl<$Res>
    extends _$CultivoCopyWithImpl<$Res, _$CultivoImpl>
    implements _$$CultivoImplCopyWith<$Res> {
  __$$CultivoImplCopyWithImpl(
    _$CultivoImpl _value,
    $Res Function(_$CultivoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Cultivo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombre = null,
    Object? fechaSiembra = null,
    Object? cosechado = null,
  }) {
    return _then(
      _$CultivoImpl(
        nombre: null == nombre
            ? _value.nombre
            : nombre // ignore: cast_nullable_to_non_nullable
                  as String,
        fechaSiembra: null == fechaSiembra
            ? _value.fechaSiembra
            : fechaSiembra // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        cosechado: null == cosechado
            ? _value.cosechado
            : cosechado // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CultivoImpl implements _Cultivo {
  _$CultivoImpl({
    required this.nombre,
    required this.fechaSiembra,
    this.cosechado = false,
  });

  factory _$CultivoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CultivoImplFromJson(json);

  @override
  final String nombre;
  @override
  final DateTime fechaSiembra;
  @override
  @JsonKey()
  final bool cosechado;

  @override
  String toString() {
    return 'Cultivo(nombre: $nombre, fechaSiembra: $fechaSiembra, cosechado: $cosechado)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CultivoImpl &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.fechaSiembra, fechaSiembra) ||
                other.fechaSiembra == fechaSiembra) &&
            (identical(other.cosechado, cosechado) ||
                other.cosechado == cosechado));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nombre, fechaSiembra, cosechado);

  /// Create a copy of Cultivo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CultivoImplCopyWith<_$CultivoImpl> get copyWith =>
      __$$CultivoImplCopyWithImpl<_$CultivoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CultivoImplToJson(this);
  }
}

abstract class _Cultivo implements Cultivo {
  factory _Cultivo({
    required final String nombre,
    required final DateTime fechaSiembra,
    final bool cosechado,
  }) = _$CultivoImpl;

  factory _Cultivo.fromJson(Map<String, dynamic> json) = _$CultivoImpl.fromJson;

  @override
  String get nombre;
  @override
  DateTime get fechaSiembra;
  @override
  bool get cosechado;

  /// Create a copy of Cultivo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CultivoImplCopyWith<_$CultivoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
