import 'package:flutter/material.dart';

import 'package:gestion_gastos/features/auth/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEFF6FF), Color(0xFFF5F3FF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(title: const Text('Registro')),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: const IntrinsicHeight(
                    child: Center(
                      child: Column(
                        children: [
                          Spacer(flex: 1),

                          // --- ENCABEZADO ---
                          AuthHeader(
                            title: '¡Bienvenido!',
                            subtitle: 'Inicia sesión para continuar',
                          ),

                          Spacer(flex: 2),

                          // --- FORMULARIO ---
                          LoginForm(),

                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
