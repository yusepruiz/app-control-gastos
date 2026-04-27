import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Colores principales
  static const Color black = Color(0xFF000000);
  static const Color blue = Color(0xFF2196F3);
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);

  // Colores del Gradiente de Fondo
  static const Color gradientStart = Color(0xFFEFF6FF); // El azul clarito
  static const Color gradientEnd = Color(0xFFF5F3FF); // El tono lila/blanco

  // Colores del Gradiente de Botón
  static const Color gradientButtonStart = Color(0xFF2563EB); // blue-600
  static const Color gradientButtonEnd = Color(0xFF7E22CE); // purple-700

  // Escala de grises
  static const Color grey = Color(0xFF9E9E9E);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey700 = Color(0xFF616161);

  // Colores de error
  static const Color errorRed = Color(0xFFFF5252);
}
