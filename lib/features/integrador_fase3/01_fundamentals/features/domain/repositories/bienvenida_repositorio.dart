// bienvenida_repositorio_impl.dart
import '../entities/mensaje_bienvenida.dart';

abstract class BienvenidaRepositorio {
  MensajeBienvenida obtenerMensaje() {
    return MensajeBienvenida("Bienvenido, Juan");
  }
}