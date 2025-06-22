import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_form_bloc.freezed.dart';

/* ────────────────────────────────────
│  EVENTOS
└──────────────────────────────────── */
@freezed
sealed class ContactFormEvent with _$ContactFormEvent {
  const factory ContactFormEvent.nameChanged(String name)       = NameChanged;
  const factory ContactFormEvent.emailChanged(String email)     = EmailChanged;
  const factory ContactFormEvent.messageChanged(String message) = MessageChanged;
  const factory ContactFormEvent.formSubmitted()                = FormSubmitted;
}

/* ────────────────────────────────────
│  ESTADOS
└──────────────────────────────────── */
@freezed
sealed class ContactFormState with _$ContactFormState {
  const factory ContactFormState.initial({
    @Default('') String name,
    @Default('') String email,
    @Default('') String message,
  }) = Initial;

  const factory ContactFormState.validating({
    required String name,
    required String email,
    required String message,
  }) = Validating;

  const factory ContactFormState.submitting({
    required String name,
    required String email,
    required String message,
  }) = Submitting;

  const factory ContactFormState.success()                     = Success;
  const factory ContactFormState.failure(String message)       = Failure;
}

/* ────────────────────────────────────
│  BLOC
└──────────────────────────────────── */
class ContactFormBloc extends Bloc<ContactFormEvent, ContactFormState> {
  ContactFormBloc() : super(const ContactFormState.initial()) {
    /* ── Name ───────────────────────── */
    on<NameChanged>((event, emit) {
      final (name, email, message) = _extractFields(state);
      emit(ContactFormState.initial(
        name: event.name,
        email: email,
        message: message,
      ));
    });

    /* ── Email ──────────────────────── */
    on<EmailChanged>((event, emit) {
      final (name, _, message) = _extractFields(state);
      emit(ContactFormState.initial(
        name: name,
        email: event.email,
        message: message,
      ));
    });

    /* ── Message ────────────────────── */
    on<MessageChanged>((event, emit) {
      final (name, email, _) = _extractFields(state);
      emit(ContactFormState.initial(
        name: name,
        email: email,
        message: event.message,
      ));
    });

    /* ── Submit ─────────────────────── */
    on<FormSubmitted>((event, emit) async {
      final (name, email, message) = _extractFields(state);

      emit(ContactFormState.validating(name: name, email: email, message: message));

      // Validaciones
      if (name.length < 3 && (!email.contains('@') || !email.contains('.')) && message.isEmpty) {
        emit(const ContactFormState.failure('Todos los campos son obligatorios.'));
        return;
      }
      if (name.length < 3) {
        emit(const ContactFormState.failure('El nombre debe tener al menos 3 caracteres.'));
        return;
      }
      if (!email.contains('@') || !email.contains('.')) {
        emit(const ContactFormState.failure('El email no es válido.'));
        return;
      }
      if (message.isEmpty) {
        emit(const ContactFormState.failure('El mensaje no puede estar vacío.'));
        return;
      }

      emit(ContactFormState.submitting(name: name, email: email, message: message));
      await Future.delayed(const Duration(seconds: 2)); // Simulación de envío
      emit(const ContactFormState.success());
    });
  }

  /* ──────────────────────────────────
  | Helper: extrae (name, email, msg)
  ─────────────────────────────────── */
  (String, String, String) _extractFields(ContactFormState state) {
    return state.map(
      initial:     (s) => (s.name, s.email, s.message),
      validating:  (s) => (s.name, s.email, s.message),
      submitting:  (s) => (s.name, s.email, s.message),
      success:     (_) => ('', '', ''),
      failure:     (_) => ('', '', ''),
    );
  }

}
