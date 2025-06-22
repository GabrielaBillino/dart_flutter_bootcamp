import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/services/gestor_notas.dart';

@injectable
class NotasCubit extends Cubit<List<String>> {
  NotasCubit(this._gestor) : super([]);
  final GestorNotas _gestor;  //Servicio inyectado

  void cargar() => emit(_gestor.todas().map((n) => n.contenido).toList()); //Carga todas las notas
  void agregar(String texto) {
    _gestor.nueva(texto);  //Agrega una nueva nota
    cargar(); //Actualiza el estado
  }
}