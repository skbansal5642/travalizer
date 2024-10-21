import 'package:flutter/material.dart';
import 'package:travalizer/utils/app_title.dart';

import 'login_form.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF029664),
        title: const AppTitle(
          contentColor: Colors.white,
          contentAlignment: MainAxisAlignment.center,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/desc.png',
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: LoginForm(isDesktop: false),
            ),
          ],
        ),
      ),
    );
  }
}
