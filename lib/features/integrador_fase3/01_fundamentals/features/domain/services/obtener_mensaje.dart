// obtener_mensaje.dart
import '../repositories/bienvenida_repositorio.dart';
import '../entities/mensaje_bienvenida.dart';

class ObtenerMensaje {
  final BienvenidaRepositorio _repositorio;
  ObtenerMensaje(this._repositorio);

  MensajeBienvenida call() {
    return _repositorio.obtenerMensaje();
  }
}