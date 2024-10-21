import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travalizer/provider/login_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF029664),
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Consumer<LoginProvider>(
              builder: (context, loginProvider, _) {
                return Text(
                  "Welcome to Home!\n${loginProvider.email}",
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
