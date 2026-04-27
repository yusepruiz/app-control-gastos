import 'package:flutter/material.dart';

// Utils
import 'package:gestion_gastos/core/utils/validators.dart';

// Widgets globales
import 'package:gestion_gastos/shared/widgets/widgets.dart';

// Widgets de auth
import 'package:gestion_gastos/features/auth/presentation/widgets/widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controladores de los campos de texto
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Liberar la memoria al cerrar la pantalla
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SizedBox(
        width: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            CustomTextField(
              controller: _emailController,
              label: 'Correo electrónico',
              hintText: 'tu@correo.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: AppValidators.validateEmail,
            ),

            CustomTextField(
              controller: _passwordController,
              label: "Contraseña",
              hintText: "******",
              icon: Icons.lock_outline,
              isPassword: true,
              validator: AppValidators.validatePassword,
              maxLength: 4,
            ),

            const SizedBox(height: 20),

            // Botones para iniciar sesión y registrarse
            LoginActions(
              emailController: _emailController,
              passwordController: _passwordController,
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
