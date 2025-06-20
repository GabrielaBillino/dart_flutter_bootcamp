import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _handleAction(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Acción: $action')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Center(
                child: Image.asset(
                  'assets/images/logo.png', // logo local
                  height: 100,
                ),
              ),
              const Spacer(),
              const Text(
                'Bienvenido ❤️',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 15, 103, 218)
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'A mi primera app con Flutter',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 169, 200, 240),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () => _handleAction(context, 'Iniciar sesión'), //action Iniciar sesión
                  child: const Text('Iniciar sesión'),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: OutlinedButton(
                  onPressed: () => _handleAction(context, 'Registrarse'), //action Registrarse
                  child: const Text('Registrarse'),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
