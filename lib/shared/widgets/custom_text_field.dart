import 'package:flutter/material.dart';

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
  final colorGrey400 = Colors.grey[400];
  final colorGrey500 = Colors.grey[500];
  final colorRed = Colors.redAccent;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.black,
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
            prefixIcon: Icon(widget.icon, color: colorGrey400),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: colorGrey400,
                    ),
                    onPressed: () =>
                        setState(() => _obscureText = !_obscureText),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: colorGrey500),

            // Error
            errorBorder: _buildBorder(colorRed),
            focusedErrorBorder: _buildBorder(colorRed, width: 2),

            // Normal
            enabledBorder: _buildBorder(colorGrey400!),
            focusedBorder: _buildBorder(colorGrey500!, width: 2),

            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
