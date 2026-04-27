import 'package:flutter/material.dart';
import 'package:gestion_gastos/core/utils/validators.dart';
import 'package:go_router/go_router.dart';

import 'package:gestion_gastos/shared/widgets/widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 1. Creamos los controladores
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // 2. Es buena práctica liberar la memoria al cerrar la pantalla
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

            // Boton de iniciar sesion
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    const colorBlue = Colors.blue;
    const colorGrey = Colors.grey;

    return ListenableBuilder(
      listenable: Listenable.merge([_emailController, _passwordController]),
      builder: (context, child) {
        // Lógica para saber si el botón debe estar habilitado
        // 1. Que los campos no estén vacíos
        // 2. Opcional: Podrías validar el formato aquí también
        final isFormNotEmpty =
            _emailController.text.trim().isNotEmpty &&
            _passwordController.text.trim().isNotEmpty;

        return Column(
          spacing: 10,
          children: [
            FilledButton(
              onPressed: isFormNotEmpty
                  ? () {
                      // Disparamos la validación
                      if (_formKey.currentState!.validate()) {
                        // Si todo está bien se procede
                        final email = _emailController.text;
                        final password = _passwordController.text;

                        print("Intentando login con: $email y $password");
                      }
                    }
                  : null,
              style: FilledButton.styleFrom(
                elevation: 2, // Añade una pequeña sombra
                shadowColor: Colors.blue.withValues(alpha: 0.3),

                // Color cuando está habilitado
                backgroundColor: colorBlue,
                foregroundColor: Colors.white,

                // Color cuando está deshabilitado (onPressed: null)
                disabledBackgroundColor: colorGrey,
                disabledForegroundColor: Colors.white,

                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Botón de registro
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿No tienes cuenta?',
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                  onPressed: () => context.go('/signup'),
                  child: const Text(
                    'Regístrate',
                    style: TextStyle(
                      fontSize: 16,
                      color: colorBlue,
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
}
