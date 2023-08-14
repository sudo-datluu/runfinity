import 'package:flutter/material.dart';
import 'package:runfinity/screens/header_screen.dart';
import 'package:runfinity/screens/lobby_screens/color.dart';

class CreateLobbyScreen extends StatefulWidget {
  const CreateLobbyScreen({super.key});

  @override
  State<CreateLobbyScreen> createState() => _CreateLobbyScreenState();
}

class _CreateLobbyScreenState extends State<CreateLobbyScreen> {

  final TextEditingController searchTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: LobbyColor.BackgroundColor,
      appBar: HeaderScreen(
        textEditingController: searchTextEditingController,
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.85,

          builder: (BuildContext context, ScrollController scrollController){
            return Container(
              color: LobbyColor.CreateBackgroundColor,
              child: SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Center(
                      child: Icon(
                        Icons.maximize_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    Text(
                      "Darling Harbour",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                        width: double.infinity,
                        child: Image.asset(
                          'images/darling_harbour.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      "Distance Range",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          "From",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: LobbyColor.BackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "To",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: LobbyColor.BackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Limit member",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: LobbyColor.BackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LobbyColor.ButtonColor,
                          elevation: 0,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: (){},
                        child: Text(
                          "Create",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
