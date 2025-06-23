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
  // ── FAB para abrir el diálogo de alta ──────────────────────────────────
  void _mostrarModalAgregar(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text('Nuevo Cultivo'),
          content: TextField(
            controller: controller,
            decoration:
                const InputDecoration(labelText: 'Nombre del cultivo'),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final texto = controller.text.trim();
                if (texto.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('⚠️ Ingrese un nombre válido'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }
                context.read<CultivosCubit>().agregar(texto);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('✅ Cultivo “$texto” agregado'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(223, 88, 235, 88),
        title: const Text('Mi Huerta Inteligente'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _mostrarModalAgregar(context),
        icon: const Icon(Icons.add),
        label: const Text('Añadir cultivo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ── Campo de búsqueda ────────────────────────────────────────
            TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar cultivo',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (texto) =>
                  context.read<CultivosCubit>().aplicarFiltro(texto),
            ),
            const SizedBox(height: 16),
            // ── Listas de cultivos ──────────────────────────────────────
            Expanded(
              child: BlocBuilder<CultivosCubit, CultivosState>(
                builder: (_, state) {
                  final cubit = context.read<CultivosCubit>();
                  final activos = cubit.activosFiltrados;
                  final cosechados = cubit.cosechadosFiltrados;

                  return Row(
                    children: [
                      // Activos
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(8),
                          child: _buildLista('Activos', activos, false),
                        ),
                      ),
                      const VerticalDivider(),
                      // Cosechados
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
                          child: _buildLista('Cosechados', cosechados, true),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ────────────────────────────────────────────────────────────────────────
  // Construcción de cada lista
  // ────────────────────────────────────────────────────────────────────────
  Widget _buildLista(String titulo, List<Cultivo> lista, bool deshabilitado) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      onPressed: () => context
                          .read<CultivosCubit>()
                          .marcarCosechado(lista[i]),
                    )
                  : const Icon(Icons.check, color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
