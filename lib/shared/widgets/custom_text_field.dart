import 'package:flutter/material.dart';

// Constantes
import 'package:gestion_gastos/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.validator,
    this.maxLength,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // Variable interna para controlar la visibilidad
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // Al inicio, si es password, ocultamos el texto
    _obscureText = widget.isPassword;
  }

  // Estilo del borde
  OutlineInputBorder _buildBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  // Boton para mostrar/ocultar contraseña
  IconButton _buildEyeButton() {
    return IconButton(
      icon: Icon(
        _obscureText
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        color: AppColors.grey400,
      ),
      onPressed: () => setState(() => _obscureText = !_obscureText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          maxLength: widget.maxLength,
          validator: widget.validator,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,

          decoration: InputDecoration(
            counterText: "",
            prefixIcon: Icon(widget.icon, color: AppColors.grey400),
            suffixIcon: widget.isPassword ? _buildEyeButton() : null,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.grey500),

            // Error
            errorBorder: _buildBorder(AppColors.errorRed),
            focusedErrorBorder: _buildBorder(AppColors.errorRed, width: 2),

            // Normal
            enabledBorder: _buildBorder(AppColors.grey400),
            focusedBorder: _buildBorder(AppColors.grey500, width: 2),

            filled: true,
            fillColor: AppColors.white.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
