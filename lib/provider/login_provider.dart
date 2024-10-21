import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isPasswordObscured = true;
  bool isRememberMe = true;
  String email = '';
  String passwd = '';

  auth(String email, String passwd) {
    this.email = email;
    this.passwd = passwd;
  }

  togglePasswdVisibility() {
    isPasswordObscured = !isPasswordObscured;
    notifyListeners();
  }

  toggleRememberMe() {
    isRememberMe = !isRememberMe;
    notifyListeners();
  }
}
