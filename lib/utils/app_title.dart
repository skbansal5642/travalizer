import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key, required this.contentColor, this.contentAlignment = MainAxisAlignment.start});

  final Color contentColor;
  final MainAxisAlignment contentAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: contentAlignment,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Image.asset(
            'assets/logo.png',
            height: 30,
            width: 30,
            color: contentColor,
          ),
        ),
        Text(
          'Travalizer',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: contentColor,
          ),
        ),
      ],
    );
  }
}
