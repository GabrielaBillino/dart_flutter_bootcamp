import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_form_bloc.dart';

class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactFormBloc(),
      child: const ContactFormView(),
    );
  }
}

class ContactFormView extends StatefulWidget {
  const ContactFormView({super.key});

  @override
  State<ContactFormView> createState() => _ContactFormViewState();
}

class _ContactFormViewState extends State<ContactFormView> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactFormBloc, ContactFormState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Formulario enviado correctamente 🎉'),
              backgroundColor: Colors.green,
            ),
          ),
          failure: (msg) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msg),
              backgroundColor: Colors.red,
            ),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Contacto'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<ContactFormBloc, ContactFormState>(
            builder: (context, state) {
              final bloc = context.read<ContactFormBloc>();
              final isLoading = state is Submitting;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _nameCtrl,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    onChanged: (v) =>
                        bloc.add(ContactFormEvent.nameChanged(v)),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _emailCtrl,
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (v) =>
                        bloc.add(ContactFormEvent.emailChanged(v)),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _msgCtrl,
                    decoration: const InputDecoration(labelText: 'Mensaje'),
                    maxLines: 3,
                    onChanged: (v) =>
                        bloc.add(ContactFormEvent.messageChanged(v)),
                  ),
                  const SizedBox(height: 24),
                  isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () =>
                              bloc.add(const ContactFormEvent.formSubmitted()),
                          child: const Text('Enviar'),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
