import '../../domain/repositories/bienvenida_repositorio.dart';
import '../../domain/entities/mensaje_bienvenida.dart';

class BienvenidaRepositorioImpl implements BienvenidaRepositorio {
  @override
  MensajeBienvenida obtenerMensaje() {
    return MensajeBienvenida("Bienvenido, Juan");
  }
}
