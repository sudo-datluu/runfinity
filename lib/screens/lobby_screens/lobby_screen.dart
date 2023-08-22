import 'package:flutter/material.dart';
import 'package:runfinity/screens/lobby_screens/lobby_header_screen.dart';
import 'package:runfinity/screens/widgets/lobby_widgets/create_lobby_screen.dart';

import '../../../styles/app_colors.dart';
import '../widgets/lobby_widgets/find_lobby_screen.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {

  final TextEditingController searchTextEditingController = new TextEditingController();
  bool isCreatingLobby = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.neutral700,
      appBar: LobbyHeaderScreen(
        textEditingController: searchTextEditingController,
        onPressedBackButton: (){
          if (isCreatingLobby) {
            setState(() {
              isCreatingLobby = false;
            });
          }
        },
      ),
      body: SizedBox.expand(
        child: isCreatingLobby
          ? CreateLobbyScreen()
          : FindingLobbyScreen(
              onClicked: () {
                setState(() {
                  isCreatingLobby = true;
                });
              },
          ),
      ),
    );
  }
}
