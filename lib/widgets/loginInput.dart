import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginInput extends StatelessWidget {
  bool? hidePassword;
  final String hintText;
  final TextEditingController inputController;
  final String? Function(String?)? validate;

  LoginInput(
      {super.key,
      required this.inputController,
      this.hidePassword,
      required this.hintText,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: inputController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(47, 60, 80, 1),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromRGBO(123, 97, 255, 1)),
              borderRadius: BorderRadius.circular(8),
            ),
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
            hintText: hintText,
          ),
          validator: validate,
        ));
  }
}
