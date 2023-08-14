import 'package:flutter/material.dart';
import 'package:runfinity/screens/lobby_screens/color.dart';

class HeaderScreen extends StatefulWidget implements PreferredSizeWidget {
  HeaderScreen({
    super.key,
    required this.textEditingController
  });

  TextEditingController textEditingController;

  @override
  State<HeaderScreen> createState() => _HeaderScreenState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}

class _HeaderScreenState extends State<HeaderScreen> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      leading: Icon(Icons.arrow_back),
      title: TextFormField(
        controller: widget.textEditingController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: LobbyColor.ButtonColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
      actions: [
        SizedBox(width: 10,),
        ElevatedButton(
          onPressed: (){

          },
          child: Icon(Icons.more_horiz),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: LobbyColor.ButtonColor,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(200)),
            ),

          ),
        ),
        SizedBox(width: 10,),
      ],
    );
  }
}
