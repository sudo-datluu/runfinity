import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';

class LoginCheckbox extends StatefulWidget {
  const LoginCheckbox({super.key});

  @override
  State<LoginCheckbox> createState() => _LoginCheckboxState();
}

class _LoginCheckboxState extends State<LoginCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return AppColors.primary;
    }

    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      color: AppColors.background,
      child: Checkbox(
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}
