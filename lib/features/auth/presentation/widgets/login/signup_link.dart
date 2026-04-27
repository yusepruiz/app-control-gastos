import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

// Constantes
import 'package:gestion_gastos/core/constants/app_colors.dart';

class SignupLink extends StatelessWidget {
  const SignupLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('¿No tienes cuenta?', style: TextStyle(fontSize: 16)),
        TextButton(
          onPressed: () => context.go('/signup'),
          child: const Text(
            'Regístrate',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
