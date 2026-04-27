import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    const pathImage = 'assets/images/logo.png';

    return Column(
      children: [
        Image.asset(pathImage, width: 200, height: 200),
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(subtitle, style: TextStyle(fontSize: 17, color: Colors.grey[700])),
      ],
    );
  }
}
