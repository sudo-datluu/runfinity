import 'package:flutter/material.dart';

class Message_Card extends StatelessWidget {
  const Message_Card({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage('images/onboardingscreen1.png'),
      ),
      title: Text(
        "Hooman 1",
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "Hi, I'm back",
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      trailing: Text("18:00"),
    );
  }
}
