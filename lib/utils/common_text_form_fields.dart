import 'package:flutter/material.dart';

class CommonTextFormFieldWidget extends StatefulWidget {
  final FocusNode focusNode;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CommonTextFormFieldWidget({
    super.key,
    required this.focusNode,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
  });

  @override
  State<CommonTextFormFieldWidget> createState() => _CommonTextFormFieldWidgetState();
}

class _CommonTextFormFieldWidgetState extends State<CommonTextFormFieldWidget> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Theme(
        data: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            selectionColor: Colors.green,
            selectionHandleColor: Colors.green,
            cursorColor: Colors.black,
          ),
        ),
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: widget.controller,
          focusNode: widget.focusNode,
          obscureText: widget.obscureText,
          validator: widget.validator,
          cursorHeight: 20,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorStyle: const TextStyle(color: Colors.red),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.green.shade200),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.green.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.green.shade200),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: widget.suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            alignLabelWithHint: true,
          ),
          onSaved: (newValue) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
