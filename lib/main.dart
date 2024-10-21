import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travalizer/provider/login_provider.dart';
import 'package:travalizer/ui/home_screen.dart';
import 'package:travalizer/ui/login/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travalizer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF029664)),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF029664)),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (_) => const LoginScreen());
        } else if (settings.name == '/home') {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        } else {
          return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text("No route defined"))));
        }
      },
    );
  }
}
