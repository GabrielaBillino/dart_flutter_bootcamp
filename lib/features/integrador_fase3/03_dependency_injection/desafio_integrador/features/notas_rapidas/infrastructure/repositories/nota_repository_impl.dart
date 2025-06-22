import 'package:injectable/injectable.dart';
import '../../domain/entities/nota.dart';
import '../../domain/repositories/nota_repository.dart';

// Implementación del repositorio usando una lista en memoria

@LazySingleton(as: NotaRepository)
class NotaRepositoryImpl implements NotaRepository {
  final List<Nota> _memoria = [];
  @override
  void agregar(Nota nota) => _memoria.add(nota);
  @override
  List<Nota> obtenerTodas() => List.unmodifiable(_memoria);
}