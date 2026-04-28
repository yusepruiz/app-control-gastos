import 'package:flutter/material.dart';

// Utils
import 'package:gestion_gastos/core/utils/validators.dart';

// Widgets globales
import 'package:gestion_gastos/shared/widgets/widgets.dart';

// Widgets de auth
import 'package:gestion_gastos/features/auth/presentation/widgets/widgets.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              controller: _nameController,
              label: 'Nombre',
              hintText: 'Tu nombre',
              icon: Icons.person_outline,
              textInputAction: TextInputAction.next,
              validator: AppValidators.validateName,
            ),

            CustomTextField(
              controller: _emailController,
              label: 'Email',
              hintText: 'tu@email.com',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: AppValidators.validateEmail,
            ),

            CustomTextField(
              controller: _passwordController,
              label: 'Contraseña',
              hintText: '••••••••',
              icon: Icons.lock_outline,
              isPassword: true,
              textInputAction: TextInputAction.next,
              validator: AppValidators.validatePassword,
            ),

            CustomTextField(
              controller: _confirmPasswordController,
              label: 'Confirmar Contraseña',
              hintText: '••••••••',
              icon: Icons.lock_outline,
              isPassword: true,
              textInputAction: TextInputAction.done,
              validator: AppValidators.validateConfirmPassword(
                _passwordController, // ← pasa el controlador, no el texto
              ),
            ),

            const SizedBox(height: 8),

            // Botones de acción
            SignupActions(
              nameController: _nameController,
              emailController: _emailController,
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
