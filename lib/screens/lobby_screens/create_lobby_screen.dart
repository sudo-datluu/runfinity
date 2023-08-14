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
      body: Container(
        child: Text("Hello"),
      ),
    );
  }
}
