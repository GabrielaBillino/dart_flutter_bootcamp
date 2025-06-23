import 'package:injectable/injectable.dart';
import '../../domain/entities/cultivo.dart';
import '../../domain/repositories/cultivo_repository.dart';

@LazySingleton(as: CultivoRepository)
class CultivoRepositoryImpl implements CultivoRepository {
  final List<Cultivo> _bdFake = [];

  @override
  void agregar(Cultivo cultivo) => _bdFake.add(cultivo);

  @override
  void actualizar(Cultivo cultivo) {
    final index = _bdFake.indexWhere((c) => c.nombre == cultivo.nombre && c.fechaSiembra == cultivo.fechaSiembra);
    if (index != -1) _bdFake[index] = cultivo;
  }

  @override
  List<Cultivo> obtenerTodos() => List.unmodifiable(_bdFake);
}