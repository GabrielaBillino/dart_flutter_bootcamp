import 'package:injectable/injectable.dart';
import '../entities/cultivo.dart';
import '../repositories/cultivo_repository.dart';

@injectable
class GestorCultivos {
  GestorCultivos(this._repo);
  final CultivoRepository _repo;

  void nuevoCultivo(String nombre) {
    final cultivo = Cultivo(nombre: nombre, fechaSiembra: DateTime.now());
    _repo.agregar(cultivo);
  }

  void cosechar(Cultivo cultivo) {
    _repo.actualizar(cultivo.marcarCosechado());
  }

  List<Cultivo> activos() =>
      _repo.obtenerTodos().where((c) => !c.cosechado).toList();
  List<Cultivo> cosechados() =>
      _repo.obtenerTodos().where((c) => c.cosechado).toList();
}