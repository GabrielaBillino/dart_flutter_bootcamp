import 'dart:async';
import 'package:bloc/bloc.dart';

// ========== CUBIT IMPLEMENTATION ==========

/// Un cubit muy sencillo que mantiene la temperatura como [double].
/// Comienza en 20.0 °C y expone métodos para incrementarla o disminuirla.
class TemperatureCubit extends Cubit<double> {
  TemperatureCubit() : super(20.0);

  void increase() => emit(state + 1);
  void decrease() => emit(state - 1);
}

// ========== BLOC IMPLEMENTATION ==========

abstract class TemperatureEvent {}

class IncreaseTemp extends TemperatureEvent {}
class DecreaseTemp extends TemperatureEvent {}

/// Bloc equivalente que maneja eventos [IncreaseTemp] y [DecreaseTemp].
class TemperatureBloc extends Bloc<TemperatureEvent, double> {
  TemperatureBloc() : super(20.0) {
    on<IncreaseTemp>((event, emit) => emit(state + 1));
    on<DecreaseTemp>((event, emit) => emit(state - 1));
  }
}

// ========== MAIN FUNCTION ==========

Future<void> main() async {
  print('== Cubit ==');
  final cubit = TemperatureCubit();

  final cubitSubscription = cubit.stream.listen(
    (temp) => print('[Cubit] Temperatura actual: $temp°C'),
  );

  cubit.increase(); // 21
  cubit.increase(); // 22
  cubit.decrease(); // 21

  await Future.delayed(const Duration(milliseconds: 100));
  await cubit.close();
  await cubitSubscription.cancel();

  print('\n== Bloc ==');
  final bloc = TemperatureBloc();

  final blocSubscription = bloc.stream.listen(
    (temp) => print('[Bloc] Temperatura actual: $temp°C'),
  );

  bloc.add(IncreaseTemp()); // 21
  bloc.add(IncreaseTemp()); // 22
  bloc.add(DecreaseTemp()); // 21

  await Future.delayed(const Duration(milliseconds: 100));
  await bloc.close();
  await blocSubscription.cancel();
}
