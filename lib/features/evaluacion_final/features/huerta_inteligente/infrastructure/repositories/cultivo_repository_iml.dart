import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/cultivo.dart';
import '../../domain/repositories/cultivo_repository.dart';

@LazySingleton(as: CultivoRepository)
class CultivoRepositoryImpl implements CultivoRepository {
  final List<Cultivo> _cultivos = [];

  CultivoRepositoryImpl() {
    _cargarDesdeMemoria();
  }

  @override
  void agregar(Cultivo cultivo) {
    _cultivos.add(cultivo);
    _guardarEnMemoria();
  }
  
   @override
  void actualizar(Cultivo cultivo) {
    final i = _cultivos.indexWhere((c) =>
        c.nombre == cultivo.nombre && c.fechaSiembra == cultivo.fechaSiembra);
    if (i != -1) {
      _cultivos[i] = cultivo;
      _guardarEnMemoria();
    }
  }

  @override
  List<Cultivo> obtenerTodos() => List.unmodifiable(_cultivos);

  @override
  void marcarComoCosechado(Cultivo cultivo) {
    final index = _cultivos.indexOf(cultivo);
    if (index != -1) {
      _cultivos[index] = cultivo.copyWith(cosechado: true);
      _guardarEnMemoria();
    }
  }
 //**********Persistencia ***********/
  Future<void> _guardarEnMemoria() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonCultivos = _cultivos.map((c) => jsonEncode(c.toJson())).toList();
    //Ver el json generado en consola
    print('🔸 Cultivos guardados en memoria:');
    for (final json in jsonCultivos) {
      print(json);
    }
    await prefs.setStringList('cultivos', jsonCultivos);
  }

  Future<void> _cargarDesdeMemoria() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('cultivos') ?? [];
    _cultivos.clear();
    _cultivos.addAll(jsonList.map((j) => Cultivo.fromJson(jsonDecode(j))));
  }
}
