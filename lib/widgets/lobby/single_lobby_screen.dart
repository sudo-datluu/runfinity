import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/controllers/auth/lobby_controller.dart';
import 'package:runfinity/screens/lobby_screens/lobby_chat_screen.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/utils/lobby_validation.dart';

class SingleLobbyScreen extends StatefulWidget {
  int id;
  String targetLocationLat;
  String targetLocationLong;
  int limitedMembers;
  int currentMembers;
  String createdAt;
  String name;

  SingleLobbyScreen({
    super.key,
    required this.id,
    required this.targetLocationLat,
    required this.targetLocationLong,
    required this.limitedMembers,
    required this.currentMembers,
    required this.createdAt,
    required this.name
  });

  @override
  State<SingleLobbyScreen> createState() => _SingleLobbyScreenState();
}

class _SingleLobbyScreenState extends State<SingleLobbyScreen> {

  final _formKey = GlobalKey<FormState>();
  final _lobbyValidation = JoinLobbyValidation();
  final _lobbyController = Get.put(LobbyController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryDarker,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        height: 180,
        width: 300,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "images/darling_harbour.png",
                  fit: BoxFit.fill,
                ),
              )
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 60,
                  child: Text(
                    "${widget.name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  "Range",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  "Members: ${widget.currentMembers}/${widget.limitedMembers}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 0,
                    ),
                    onPressed: (){
                      if (_lobbyValidation.validateCurrentMember(widget.currentMembers, widget.limitedMembers)) {
                        _lobbyController.JoinLobbyService(widget.id);
                        Get.off(LobbyChatScreen()); //todo change later
                      }
                    },
                    child: const Text(
                      "Join",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
