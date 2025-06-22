// mensaje_widget.dart
import 'package:flutter/material.dart';
import '../../domain/services/obtener_mensaje.dart';
import '../../domain/entities/mensaje_bienvenida.dart';

class MensajeWidget extends StatelessWidget {
  final ObtenerMensaje obtenerMensaje;

  const MensajeWidget({required this.obtenerMensaje, super.key});

  @override
  Widget build(BuildContext context) {
    final MensajeBienvenida mensaje = obtenerMensaje();

    return Center(
      child: Text(
        mensaje.valor,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
