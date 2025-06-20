import 'package:flutter/material.dart';


/// TODO Consigna:
//   1.  Identifica el error relacionado con el uso del BuildContext.
//   2.  Explica por qué es riesgoso.
//   3.  Corrige el código respetando buenas prácticas de ciclo de vida.


void main() {
  runApp(const MaterialApp(home: DiagnosticPage()));
}

class DiagnosticPage extends StatefulWidget {
  const DiagnosticPage({super.key});

  @override
  State<DiagnosticPage> createState() => _DiagnosticPageState();
}

class _DiagnosticPageState extends State<DiagnosticPage> {
  bool _loading = false;

  Future<void> _simulateAsyncAction() async {
    setState(() {
      _loading = true;
    });

//********************** En esta parte del código está el error ********** */
///Es un riesgo porque el BuildContext (context) que se usa para mostrar el SnackBar
// puede  no estar asociado al widget en pantalla si el widget fue destruido durante la espera
// (por ejemplo, al navegar a otra pantalla).
//Esto puede generar una excepción

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return; //Solución que sirve para saber si el widget sigue en el tree
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('¡Operación completada!')),
    );

    setState(() {
      _loading = false;
    });
  }
//********************** Fin serctor con error **********************/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diagnóstico de Context')),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
          onPressed: _simulateAsyncAction,
          child: const Text('Ejecutar acción async'),
        ),
      ),
    );
  }
}
