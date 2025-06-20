import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: RegistroMascotaScreen()));
}

class Mascota {
  final String nombre;
  final TipoMascota tipo;
  final int edad;

  Mascota({required this.nombre, required this.tipo, required this.edad});
}

//emun para el tipoMascota que se utiliza en la clase mascota
enum TipoMascota { perro, gato, otro }

class RegistroMascotaScreen extends StatefulWidget {
  const RegistroMascotaScreen({super.key});

  @override
  State<RegistroMascotaScreen> createState() => _RegistroMascotaScreenState();
}

class _RegistroMascotaScreenState extends State<RegistroMascotaScreen> {
  final _nombreController = TextEditingController();
  final _edadController = TextEditingController();
  TipoMascota _tipoSeleccionado = TipoMascota.perro;

  //Metodo que registra a la mascota si cumple con todas las validaciones
  void _registrarMascota() {
  String nombre = _nombreController.text.trim();
  int? edad = int.tryParse(_edadController.text); //Se convierte a int el string que se recibe
  String mensajeError = '';

  //Se realiza las validaciones y en caso de no cumplir se muestra el mensaje correspondiente
  if(nombre.isEmpty && edad == null ){
    mensajeError = 'Todos los campos son obligatorios';
  }else if (nombre.isEmpty) {
    mensajeError = 'El nombre no puede estar vacío';
  } else if (edad == null) {
    mensajeError = 'La edad debe ser un número válido';
  } else if (edad <= 0) {
    mensajeError = 'La edad debe ser mayor a 0';
  }

  //Se muestra el mensaje de error en Snackbar
  if (mensajeError.isNotEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(216, 228, 69, 69),
        content: Text(mensajeError),
      ),
    );
    return;
  }

  // Si pasa todas las validaciones, se crea la mascota
  Mascota nuevaMascota = Mascota(
    nombre: nombre,
    tipo: _tipoSeleccionado,
    edad: edad!,
  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BienvenidaMascotaScreen(mascota: nuevaMascota),
    ),
  ).then((value) {
    if (value == true) {
      _nombreController.clear();
      _edadController.clear();
      setState(() => _tipoSeleccionado = TipoMascota.perro);
    }
  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Mascota')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 16),
            DropdownButton<TipoMascota>(
              value: _tipoSeleccionado,
              isExpanded: true,
              onChanged: (nuevoTipo) {
                if (nuevoTipo != null) {
                  setState(() => _tipoSeleccionado = nuevoTipo);
                }
              },
              items: TipoMascota.values.map((tipo) {
                return DropdownMenuItem(
                  value: tipo,
                  child: Text(tipo.name[0].toUpperCase() + tipo.name.substring(1)),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _edadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Edad'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _registrarMascota,
              child: const Text('Registrar'),
            )
          ],
        ),
      ),
    );
  }
}

class BienvenidaMascotaScreen extends StatelessWidget {
  final Mascota mascota;

  const BienvenidaMascotaScreen({super.key, required this.mascota});

  IconData _iconoPorTipo() {
    switch (mascota.tipo) {
      case TipoMascota.perro:
        return Icons.pets;
      case TipoMascota.gato:
        return Icons.pets_outlined;
      default:
        return Icons.all_out;
    }
  }

  String _edadDescripcion() {
    return mascota.edad < 2 ? 'Joven 🐣' : 'Adulto 🐾';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bienvenida')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_iconoPorTipo(), size: 64),
            const SizedBox(height: 24),
            Text(
              '¡Bienvenido ${mascota.nombre} el ${mascota.tipo.name}!',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              _edadDescripcion(),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Registrar otra mascota'),
            )
          ],
        ),
      ),
    );
  }
}
