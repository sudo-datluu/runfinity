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
          child: Column(
            children: [
              //top bar
              Padding(
                padding: EdgeInsets.fromLTRB(17, 0, 17, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Messages',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.list,
                          color: Colors.white60,
                          size: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.mark_email_unread,
                          color: Colors.white60,
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //search widget

              //list
              Expanded(
                child: ListView(
                  children: [
                    //like and share card
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 17, vertical: 0),
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
                    SizedBox(
                      height: 15,
                    ),

                    ...List.generate(
                      20,
                      (index) => Message_Card(
                        title: "Hooman " + (index+1).toString(),
                        subtitle: "Hi there!",
                        time: "18:00",
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
