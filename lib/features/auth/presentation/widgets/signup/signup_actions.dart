import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Constantes
import 'package:gestion_gastos/core/constants/app_colors.dart';

// Widgets globales
import 'package:gestion_gastos/shared/widgets/widgets.dart';

class SignupActions extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  const SignupActions({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        nameController,
        emailController,
        passwordController,
        confirmPasswordController,
      ]),
      builder: (context, child) {
        final isFormValid = _isFormValid();

        return Column(
          spacing: 10,
          children: [
            // Botón crear cuenta
            CustomFilledButton(
              text: 'Crear Cuenta',
              isEnabled: isFormValid,
              onPressed: isFormValid ? () => _handleSignup() : null,
            ),

            // Link a login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Ya tienes cuenta?', style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: const Text(
                    'Inicia sesión',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.gradientButtonStart,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  bool _isFormValid() {
    final emailRegExp = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');

    return nameController.text.trim().isNotEmpty &&
        emailRegExp.hasMatch(emailController.text.trim()) &&
        passwordController.text.length >= 3 &&
        confirmPasswordController.text == passwordController.text;
  }

  void _handleSignup() {
    if (formKey.currentState?.validate() ?? false) {
      // TODO: lógica de registro
      debugPrint('Registrando: ${emailController.text}');
    }
  }
}
