import 'package:flutter/material.dart';

class Message_Card extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  Message_Card({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.7), width: 0.5),
          bottom: BorderSide(
              color: Colors.grey.withOpacity(0.7), width: 0.5), // Bottom border
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage('images/onboardingscreen1.png'),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
        trailing: Text(
          time,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
