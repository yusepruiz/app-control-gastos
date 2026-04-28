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
        final isFormValid = _isFormValid();

        return Column(
          spacing: 10,
          children: [
            // Boton de iniciar sesión
            CustomFilledButton(
              text: 'Iniciar sesión',
              isEnabled: isFormValid,
              onPressed: isFormValid ? _handleLogin : null,
            ),

            // Botón de registro
            const SignupLink(),
          ],
        );
      },
    );
  }

  bool _isFormValid() {
    final emailRegExp = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');

    return emailRegExp.hasMatch(emailController.text.trim()) &&
        passwordController.text.length >= 3;
  }

  void _handleLogin() {
    if (formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      debugPrint("Intentando login con: $email y $password");
    }
  }
}
