import 'package:flutter/material.dart';

// Constantes
import 'package:gestion_gastos/core/constants/app_assets.dart';
import 'package:gestion_gastos/core/constants/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.logo, width: 200, height: 200),
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 17, color: AppColors.grey700),
        ),
      ],
    );
  }
}
