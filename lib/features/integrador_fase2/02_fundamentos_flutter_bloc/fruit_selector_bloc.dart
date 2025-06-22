import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ========== EVENTO ==========
// TODO: Crear una clase FruitEvent con solo un tipo de evento llamado SelectedFruitEvent que
// contenga un campo 'fruit' (tipo String)
abstract class FruitEvent {}

class SelectedFruitEvent extends FruitEvent {
  final String fruit;
  SelectedFruitEvent(this.fruit);
}

// ========== ESTADO ==========
// TODO: Crear una clase FruitState que tenga una propiedad 'selectedFruit' y ademas las posibles
// frutas disponibles 'Manzana', 'Banana' y 'Naranja'.
class FruitState {
  final String? selectedFruit;
  final List<String> availableFruits = ['Manzana', 'Banana', 'Naranja'];

  FruitState({this.selectedFruit});
}

// ========== BLOC ==========
// TODO: Crear el FruitBloc que extienda Bloc<FruitEvent, FruitState>
//          En el constructor, registrar on<SelectedFruitEvent> y emitir el nuevo estado con la
// fruta seleccionada
class FruitBloc extends Bloc<FruitEvent, FruitState> {
  FruitBloc() : super(FruitState()) {
    on<SelectedFruitEvent>((event, emit) {
      emit(FruitState(selectedFruit: event.fruit));
    });
  }
}

// ========== UI ==========
void main() {
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Selector',
      //TODO: Instanciar el FruitBloc y darle acceso a la pantalla de selección de frutas.
      home: BlocProvider(
        create: (_) => FruitBloc(),
        child: const FruitSelectorScreen(),
      ),
    );
  }
}

class FruitSelectorScreen extends StatelessWidget {
  const FruitSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Seleccioná tu fruta')),
      body: BlocListener<FruitBloc, FruitState>(
        listenWhen: (prev, curr) => prev.selectedFruit != curr.selectedFruit,
        listener: (context, state) {
          if (state.selectedFruit != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Fruta seleccionada: ${state.selectedFruit}')),
            );
          }
        },
        child: Center(                       
          child: BlocBuilder<FruitBloc, FruitState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,    
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Elegí una fruta:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),       // distancia mínima
                  // Botones de frutas
                  ...state.availableFruits.map(
                    (fruit) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ElevatedButton(
                        onPressed: () =>
                            context.read<FruitBloc>().add(SelectedFruitEvent(fruit)),
                        child: Text(fruit),
                      ),
                    ),
                  ),
                  if (state.selectedFruit != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Seleccionaste: ${state.selectedFruit}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}