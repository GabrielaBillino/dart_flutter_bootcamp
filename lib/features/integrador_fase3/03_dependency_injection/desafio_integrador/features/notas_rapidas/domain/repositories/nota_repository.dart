import '../entities/nota.dart';

//Se define cómo se deben manejar las notas
abstract class NotaRepository {
  void agregar(Nota nota); //Agrega una nueva nota
  List<Nota> obtenerTodas(); //Devuelve todas las notas
}