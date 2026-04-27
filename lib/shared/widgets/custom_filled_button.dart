import 'package:flutter/material.dart';

// Constantes
import 'package:gestion_gastos/core/constants/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isEnabled;

  const CustomFilledButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isEnabled = true,
  });

  // Método para construir el gradiante del botón
  LinearGradient get _buildGradientButton => const LinearGradient(
    colors: [AppColors.gradientButtonStart, AppColors.gradientButtonEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Método para construir la sombra del botón
  List<BoxShadow> get _buildBoxShadowButton => [
    BoxShadow(
      color: AppColors.gradientButtonStart.withValues(alpha: 0.3),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        gradient: isEnabled ? _buildGradientButton : null,
        color: !isEnabled ? AppColors.grey : null,
        boxShadow: isEnabled ? _buildBoxShadowButton : null,
      ),
      child: FilledButton(
        onPressed: isEnabled ? onPressed : null,
        style: FilledButton.styleFrom(
          elevation: 0, // Añade una pequeña sombra
          shadowColor: AppColors.transparent,

          // Color cuando está habilitado
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.white,

          // Color cuando está deshabilitado (onPressed: null)
          disabledBackgroundColor: AppColors.transparent,
          disabledForegroundColor: AppColors.grey300,

          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
