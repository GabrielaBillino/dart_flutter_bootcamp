import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/cultivo.dart';
import '../../domain/services/gestor_cultivos.dart';

part 'cultivos_cubit.freezed.dart';

@freezed
class CultivosState with _$CultivosState {
  /// [filtro] se guarda en minúsculas para comparar sin distinción de mayúsculas.
  const factory CultivosState({
    @Default(<Cultivo>[]) List<Cultivo> activos,
    @Default(<Cultivo>[]) List<Cultivo> cosechados,
    @Default('') String filtro,
  }) = _CultivosState;
}

@injectable
class CultivosCubit extends Cubit<CultivosState> {
  CultivosCubit(this._gestor) : super(const CultivosState()) {
    _refrescar(); // cargar datos iniciales
  }

  final GestorCultivos _gestor;

  // ──────────────────────── Acciones de dominio ────────────────────────
  void agregar(String nombre) {
    _gestor.nuevoCultivo(nombre);
    _refrescar();
  }

  void marcarCosechado(Cultivo cultivo) {
    _gestor.cosechar(cultivo);
    _refrescar();
  }

  // ───────────────────────────── Buscador ──────────────────────────────
  void aplicarFiltro(String texto) {
    emit(state.copyWith(filtro: texto.toLowerCase()));
  }

  // ──────────────────────── Getters filtrados ──────────────────────────
  List<Cultivo> get activosFiltrados => state.activos
      .where((c) => c.nombre.toLowerCase().contains(state.filtro))
      .toList();

  List<Cultivo> get cosechadosFiltrados => state.cosechados
      .where((c) => c.nombre.toLowerCase().contains(state.filtro))
      .toList();

  // ───────────────────────── Helper interno ────────────────────────────
  void _refrescar() {
    emit(CultivosState(
      activos: _gestor.activos(),
      cosechados: _gestor.cosechados(),
      filtro: state.filtro, // mantiene el filtro actual
    ));
  }
}
