import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/cubit/animal_cubit.dart';

class AnimalListScreen extends StatelessWidget {
  const AnimalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animales')),
      body: BlocBuilder<AnimalCubit, List<String>>(
        builder: (context, animales) {
          return ListView.builder(
            itemCount: animales.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(animales[index]),
            ),
          );
        },
      ),
    );
  }
}
