import 'package:flutter/material.dart';
import 'core/injection.dart';
import 'features/evaluacion_final/features/huerta_inteligente/presentation/pages/cultivos_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MaterialApp(home: CultivosScreen()));
}

