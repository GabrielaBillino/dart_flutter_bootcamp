import '../entities/cultivo.dart';

abstract class CultivoRepository {
  void agregar(Cultivo cultivo);
  void actualizar(Cultivo cultivo);
  List<Cultivo> obtenerTodos();
}