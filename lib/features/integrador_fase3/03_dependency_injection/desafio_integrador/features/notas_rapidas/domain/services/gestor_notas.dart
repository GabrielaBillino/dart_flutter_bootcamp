import 'package:injectable/injectable.dart';
import '../entities/nota.dart';
import '../repositories/nota_repository.dart';

@injectable
class GestorNotas {
  GestorNotas(this._repo);
  final NotaRepository _repo;

  void nueva(String texto) => _repo.agregar(Nota(texto)); // Agrega una nueva nota
  List<Nota> todas() => _repo.obtenerTodas();  // Retorna todas las notas
}