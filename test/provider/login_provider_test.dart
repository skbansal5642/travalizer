import 'package:flutter_test/flutter_test.dart';

import 'package:travalizer/provider/login_provider.dart';

void main() {
  late LoginProvider loginProvider;
  group("Login Provider Tests", () {
    setUp(() {
      loginProvider = LoginProvider();
    });
    test("User Login Tests", () {
      expect(loginProvider.email.isEmpty, true);
      loginProvider.auth("shubhambansal5642@gmail.com", "Shubham@123");
      expect(loginProvider.email.isNotEmpty, true);
    });
  });
}
