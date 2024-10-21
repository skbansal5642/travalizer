import 'package:flutter/material.dart';
import 'package:travalizer/ui/login/desktop_layout.dart';
import 'package:travalizer/ui/login/mobile_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return const DesktopLayout();
          } else {
            return const MobileLayout();
          }
        },
      ),
    );
  }
}
