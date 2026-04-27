import 'package:flutter/material.dart';

// Widgets globales
import 'package:gestion_gastos/shared/widgets/widgets.dart';

// Widgets de auth
import 'package:gestion_gastos/features/auth/presentation/widgets/widgets.dart';

class LoginActions extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginActions({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([emailController, passwordController]),
      builder: (context, child) {
        // Lógica para saber si el botón debe estar habilitado
        // 1. Que los campos no estén vacíos
        // 2. Opcional: Podrías validar el formato aquí también
        final isFormNotEmpty =
            emailController.text.trim().isNotEmpty &&
            passwordController.text.trim().isNotEmpty;

        return Column(
          spacing: 10,
          children: [
            // Boton de iniciar sesión
            CustomFilledButton(
              text: 'Iniciar sesión',
              isEnabled: isFormNotEmpty,
              onPressed: isFormNotEmpty ? _handleLogin : null,
            ),

            // Botón de registro
            const SignupLink(),
          ],
        );
      },
    );
  }

  void _handleLogin() {
    // Disparamos la validación
    if (formKey.currentState!.validate()) {
      // Si todo está bien se procede
      final email = emailController.text;
      final password = passwordController.text;

      debugPrint("Intentando login con: $email y $password");
    }
  }
}
