import 'package:flutter/material.dart';
import 'package:runfinity/widgets/message/messageCard.dart';

class Message_Page extends StatefulWidget {
  const Message_Page({super.key});

  @override
  State<Message_Page> createState() => _Message_PageState();
}

class _Message_PageState extends State<Message_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 51, 63).withOpacity(1),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 0),
            child: Column(
              children: [
                //top bar

                //search widget

                //like and share card
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 15, 17, 5),
                  child: GestureDetector(
                    onTap: () {
                      print('Shared!');
                    },
                    child: Container(
                      width: 380,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5),
                        image: const DecorationImage(
                          image: AssetImage('images/Share.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                //list
                ListView(
                  children: [
                    Message_Card(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
