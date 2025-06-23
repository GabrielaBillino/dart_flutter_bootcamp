/// Entidad inmutable que representa un cultivo en la huerta.
class Cultivo {
  final String nombre;
  final DateTime fechaSiembra;
  final bool cosechado;

  const Cultivo({
    required this.nombre,
    required this.fechaSiembra,
    this.cosechado = false,
  });

  // Devuelve una copia con `cosechado` = true (útil para marcar cosecha).
  Cultivo marcarCosechado() => copyWith(cosechado: true);

  Cultivo copyWith({String? nombre, DateTime? fechaSiembra, bool? cosechado}) =>
      Cultivo(
        nombre: nombre ?? this.nombre,
        fechaSiembra: fechaSiembra ?? this.fechaSiembra,
        cosechado: cosechado ?? this.cosechado,
      );
}