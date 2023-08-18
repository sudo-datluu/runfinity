import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';

class LobbyMessageInput extends StatefulWidget {
  LobbyMessageInput({super.key});

  @override
  State<LobbyMessageInput> createState() => _LobbyMessageInputState();
}

class _LobbyMessageInputState extends State<LobbyMessageInput> with SingleTickerProviderStateMixin {

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColors.neutral600,
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(

                ),
                onPressed: (){},
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.white54,
                ),
              ),
              Flexible(
                child: TextFormField(
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.text,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "This is an example message...",
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    )
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white54,
                  ),
                  onFieldSubmitted: (value){

                  },
                ),
              ),
              Container(
                child: IconButton(
                  style: IconButton.styleFrom(

                  ),
                  onPressed: (){},
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
