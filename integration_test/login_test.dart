import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:travalizer/main.dart';
import 'package:travalizer/provider/login_provider.dart';

Future<Map<String, dynamic>> loadJsonFromFile(String path) async {
  final file = File(path);
  final jsonString = await file.readAsString();
  return jsonDecode(jsonString);
}

void main() {
  group('Testing Login', () {
    testWidgets('Login Flow Test', (tester) async {
      await tester.pumpWidget(const MainWidget());

      TestWidgetsFlutterBinding.ensureInitialized();

      expect(find.byKey(const ValueKey("login_field")), findsOneWidget);
      await tester.enterText(find.byKey(const ValueKey("login_field")), 'shubhambansal5642@gmail.com');

      expect(find.byKey(const ValueKey("password_field")), findsOneWidget);
      await tester.enterText(find.byKey(const ValueKey("password_field")), 'Shubham@123');

      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.text("Login"));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Welcome to Home!\nshubhambansal5642@gmail.com'), findsOneWidget);
    });
  });
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
      ],
      child: const MyApp(),
    );
  }
}
