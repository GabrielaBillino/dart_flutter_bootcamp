import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/cubit/notas_cubit.dart';
import '../../../../../../../../core/injection.dart';

// Pantalla principal con campo de texto, botón y lista de notas
class NotasScreen extends StatelessWidget {
  const NotasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NotasCubit>()..cargar(),
      child: const _NotasView(),
    );
  }
}

class _NotasView extends StatefulWidget {
  const _NotasView();

  @override
  State<_NotasView> createState() => _NotasViewState();
}

class _NotasViewState extends State<_NotasView> {
  final _controller = TextEditingController();  // Controlador para el campo de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(244, 78, 243, 166), title: const Text('Notas Rápidas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nueva nota'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  context.read<NotasCubit>().agregar(_controller.text);
                  _controller.clear();
                }
              },
              child: const Text('Agregar'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<NotasCubit, List<String>>(
                builder: (_, notas) => ListView.builder(
                  itemCount: notas.length,
                  itemBuilder: (_, i) => ListTile(title: Text(notas[i])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}