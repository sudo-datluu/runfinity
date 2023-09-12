import 'package:flutter/material.dart';

class CustomBackArrow extends StatelessWidget {
  final VoidCallback? onBack;

  const CustomBackArrow({this.onBack, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 13, top: 25, right: 16),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 27,
            ),
            onPressed: () {
              if (onBack != null) {
                onBack!();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}
