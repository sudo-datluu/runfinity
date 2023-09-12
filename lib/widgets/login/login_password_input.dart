import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';

class LoginPasswordInput extends StatefulWidget {
  final String hintText;
  final TextEditingController passwordController;
  final String? Function(String?)? validate;

  const LoginPasswordInput(
      {super.key,
      required this.passwordController,
      required this.hintText,
      this.validate});

  @override
  State<LoginPasswordInput> createState() => _LoginPasswordInputState();
}

class _LoginPasswordInputState extends State<LoginPasswordInput> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.passwordController,
        obscureText: _hidePassword ? true : false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.neutral750,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
          suffixIcon: _hidePassword
              ? GestureDetector(
                  onTap: () => setState(() {
                        _hidePassword = false;
                      }),
                  child: const Icon(Icons.visibility))
              : GestureDetector(
                  onTap: () => setState(() {
                        _hidePassword = true;
                      }),
                  child: const Icon(Icons.visibility_off)),
        ),
        validator: (value) => widget.validate!(value), //value parameter represents the user input entered into the text field that is being validated.
      ),
    );
  }
}
