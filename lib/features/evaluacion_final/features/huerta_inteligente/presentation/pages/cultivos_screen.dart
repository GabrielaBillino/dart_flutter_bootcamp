import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/cubit/cultivos_cubit.dart';
import '../../../../../../core/injection.dart';
import '../../domain/entities/cultivo.dart';

class CultivosScreen extends StatelessWidget {
  const CultivosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CultivosCubit>(),
      child: const _CultivosView(),
    );
  }
}

class _CultivosView extends StatefulWidget {
  const _CultivosView();

  @override
  State<_CultivosView> createState() => _CultivosViewState();
}

class _CultivosViewState extends State<_CultivosView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 88, 235, 88),
        title: const Text('Mi Huerta Inteligente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Campo de texto para ingresar cultivo
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Nombre del cultivo'),
            ),
            const SizedBox(height: 8),
            // Botón para agregar cultivo
            ElevatedButton(
              onPressed: () {
                final texto = _controller.text.trim();

                if (texto.isEmpty) {
                  // Mostrar error si está vacío
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('⚠️ Ingrese un nombre para el cultivo'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }

                // Agregar cultivo
                context.read<CultivosCubit>().agregar(texto);
                _controller.clear();

                // Confirmación de agregado
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('✅ Cultivo “$texto” agregado'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Agregar Cultivo'),
            ),
            const SizedBox(height: 16),
            // Mostrar listas de cultivos
            Expanded(
              child: BlocBuilder<CultivosCubit, CultivosState>(
                builder: (_, state) => Row(
                  children: [
                    // Lista de cultivos activos
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 8,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(8),
                        child: _buildLista('Activos', state.activos, false),
                      ),
                    ),
                    const VerticalDivider(),
                    // Lista de cultivos cosechados
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 164, 240, 180),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown,
                              blurRadius: 6,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(8),
                        child: _buildLista('Cosechados', state.cosechados, true),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Construcción de cada lista (activos / cosechados)
  Widget _buildLista(String titulo, List<Cultivo> lista, bool deshabilitado) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(lista[i].nombre),
              subtitle: Text(
                'Siembra: ${lista[i].fechaSiembra.toLocal().toString().split(' ')[0]}',
              ),
              trailing: !deshabilitado
                  ? IconButton(
                      icon: const Icon(Icons.grass),
                      onPressed: () =>
                          context.read<CultivosCubit>().marcarCosechado(lista[i]),
                    )
                  : const Icon(Icons.check, color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
