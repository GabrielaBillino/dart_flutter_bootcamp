import 'package:freezed_annotation/freezed_annotation.dart';

part 'cultivo.freezed.dart';
part 'cultivo.g.dart';

@freezed
class Cultivo with _$Cultivo {
  factory Cultivo({
    required String nombre,
    required DateTime fechaSiembra,
    @Default(false) bool cosechado,
  }) = _Cultivo;

  factory Cultivo.fromJson(Map<String, dynamic> json) => _$CultivoFromJson(json);
}
