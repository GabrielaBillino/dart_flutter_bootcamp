import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/services/gestor_cultivos.dart';
import '../../domain/entities/cultivo.dart';

part 'cultivos_cubit.freezed.dart';

@freezed
sealed class CultivosState with _$CultivosState {
  const factory CultivosState({
    @Default(<Cultivo>[]) List<Cultivo> activos,
    @Default(<Cultivo>[]) List<Cultivo> cosechados,
  }) = _CultivosState;
}

@injectable
class CultivosCubit extends Cubit<CultivosState> {
  CultivosCubit(this._gestor) : super(const CultivosState()) {
    refrescar();
  }

  final GestorCultivos _gestor;

  void agregar(String nombre) {
    _gestor.nuevoCultivo(nombre);
    refrescar();
  }

  void marcarCosechado(Cultivo cultivo) {
    _gestor.cosechar(cultivo);
    refrescar();
  }

  void refrescar() {
    emit(CultivosState(
      activos: _gestor.activos(),
      cosechados: _gestor.cosechados(),
    ));
  }
}