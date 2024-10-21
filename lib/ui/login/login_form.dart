import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travalizer/provider/login_provider.dart';
import 'package:travalizer/utils/app_title.dart';
import 'package:travalizer/utils/common_text_form_fields.dart';

class LoginForm extends StatelessWidget {
  final bool isDesktop;

  const LoginForm({super.key, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController paswdController = TextEditingController();
    FocusNode emailFocus = FocusNode();
    FocusNode paswdFocus = FocusNode();
    final formKey = GlobalKey<FormState>();

    final RegExp kEmailRegex = RegExp(r'^[a-zA-Z0-9_.±]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9]+$');
    String? validateEmail(String? email) {
      try {
        if (email == null || email.isEmpty) {
          return "Please enter your email.";
        } else if (!kEmailRegex.hasMatch(email)) {
          return "Please enter a valid email.";
        }
      } catch (exception) {
        debugPrint(exception.toString());
      }
      return null;
    }

    String? validatePassword(String? paswd) {
      try {
        if (paswd == null || paswd.isEmpty) {
          return "Please enter your password.";
        }
        if (paswd.length < 8) {
          return "Password length must be greater than 8.";
        }
      } catch (exception) {
        debugPrint(exception.toString());
      }
      return null;
    }

    actionLogin() {
      if (formKey.currentState?.validate() != true) return;
      final email = emailController.text.trim();
      final password = paswdController.text;

      context.read<LoginProvider>().auth(email, password);
      const snackBar = SnackBar(
        content: Text("You have logged in successfully"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacementNamed(context, '/home');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isDesktop) const AppTitle(contentColor: Color(0xFF223A28)),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isDesktop) const SizedBox(height: 20),
              const Text(
                'Artificial Intelligence giving you travel recommendations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF223A28),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome Back, Please login to your account',
                style: TextStyle(
                  color: Color(0xFF223A28),
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email', style: TextStyle(fontSize: 14)),
                    CommonTextFormFieldWidget(
                      key: const Key("login_field"),
                      controller: emailController,
                      focusNode: emailFocus,
                      hintText: "Email",
                      validator: validateEmail,
                    ),
                    SizedBox(height: isDesktop ? 40 : 20),
                    const Text('Password', style: TextStyle(fontSize: 14)),
                    Consumer<LoginProvider>(
                      builder: (context, loginProvider, child) => CommonTextFormFieldWidget(
                        key: const Key("password_field"),
                        obscureText: loginProvider.isPasswordObscured,
                        controller: paswdController,
                        focusNode: paswdFocus,
                        hintText: "Password",
                        validator: validatePassword,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            loginProvider.togglePasswdVisibility();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              loginProvider.isPasswordObscured ? 'assets/eye_close.png' : 'assets/eye.png',
                              height: 10,
                              width: 10,
                              color: const Color(0xFF95B29B),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isDesktop ? 30 : 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Consumer<LoginProvider>(
                        builder: (context, loginProvider, child) => Checkbox(
                          value: loginProvider.isRememberMe,
                          onChanged: (value) {
                            loginProvider.toggleRememberMe();
                          },
                        ),
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          color: Color(0xFF355B3E),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color(0xFF355B3E),
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: isDesktop ? 40 : 30),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: actionLogin,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF029664),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF029664)),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Color(0xFF029664),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isDesktop ? 40 : 20),
              Center(
                child: Column(
                  children: [
                    if (!isDesktop) const Text('Or, login with', style: TextStyle(color: Color(0xFF355B3E))),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (isDesktop) const Text('Or, login with', style: TextStyle(color: Color(0xFF355B3E))),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Facebook"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Linked In"),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Google"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
