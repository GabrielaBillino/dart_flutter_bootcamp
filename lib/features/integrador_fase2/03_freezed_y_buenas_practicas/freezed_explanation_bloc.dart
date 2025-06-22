import 'package:freezed_annotation/freezed_annotation.dart';


// Archivo: user.dart  (generará user.freezed.dart)
part 'freezed_explanation_bloc.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String name,
    required int age,
  }) = _User;
}

//Estados sellados para autenticación
// ----------------------------------------
// Archivo: auth_state.dart  (generará auth_state.freezed.dart)
@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success(String token) = Success;
  const factory AuthState.error(String message) = Error;
}

// --------------------------------------------------
//  Pequeña demo en consola
// --------------------------------------------------
void main() {
  // Demostración de User + copyWith
  final user = User(name: 'Gabriela', age: 38);
  final older = user.copyWith(age: 39);
  print('Original: $user');      // User(name: Gabriela, age: 38)
  print('Modificado: $older');   // User(name: Gabriela, age: 39)

  // Demostración de AuthState + pattern matching
  AuthState state = const AuthState.initial();
  handle(state);
  state = const AuthState.loading();
  handle(state);
  state = const AuthState.success('abc123');
  handle(state);
  state = const AuthState.error('Credenciales inválidas');
  handle(state);
}

void handle(AuthState state) {
  switch (state) {
    case Initial():
      print('🕛 Estado inicial');
      break;
    case Loading():
      print('⏳ Cargando...');
      break;
    case Success(:final token):
      print('🎉 Éxito con token: $token');
      break;
    case Error(:final message):
      print('💥 Error: $message');
      break;
  }
}
