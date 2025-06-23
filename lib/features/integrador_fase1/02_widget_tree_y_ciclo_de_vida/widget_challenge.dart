import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Punto de entrada de la app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Lifecycle Challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: const MyHomePage(
        title: 'Ciclo de vida en Flutter',
      ),
    );
  }
}

//Página principal, StatefulWidget.
class MyHomePage extends StatefulWidget {
  final String title;

  // TODO: Agregar propiedad que será usada para mostrar u ocultar el contador.
  final bool showCounter= false;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // TODO(1): Imprimir en consola "initState ejecutado" dentro de este método
  @override
  void initState() {
    super.initState();
    print('initState ejecutado');
  }
  // TODO(2): Detectar si cambió `showCounter` usando didUpdateWidget.
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showCounter != widget.showCounter) {
      print('showCounter cambió de ${oldWidget.showCounter} a ${widget.showCounter}');
    }
  }
  // TODO(3): Imprimir en consola "dispose ejecutado" al destruir el widget.
  @override
  void dispose() {
    print('dispose ejecutado');
    super.dispose();
  }
  // TODO(4): Mostrar un SnackBar si el contador alcanza 5. Con ScaffoldMessenger.of(context).showSnackBar(...)
  void _incrementCounter() { 
    setState(() {
      _counter++;
    });

    if (_counter == 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Alcanzaste 5 clics')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Has presionado el botón esta cantidad de veces:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
