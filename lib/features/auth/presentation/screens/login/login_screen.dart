import 'package:flutter/material.dart';

// Constantes
import 'package:gestion_gastos/core/constants/app_colors.dart';

// Widgets
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
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
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
