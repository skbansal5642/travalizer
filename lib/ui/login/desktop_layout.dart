import 'package:flutter/material.dart';
import 'package:travalizer/ui/login/login_form.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: LoginForm(isDesktop: true),
          ),
        ),
        Expanded(
          child: Image.asset(
            'assets/desc.png',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
