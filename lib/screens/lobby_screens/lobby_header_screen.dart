import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';

class LobbyHeaderScreen extends StatefulWidget implements PreferredSizeWidget {
  LobbyHeaderScreen({
    super.key,
    required this.textEditingController,
    required this.onPressedBackButton,
  });

  TextEditingController textEditingController;
  VoidCallback onPressedBackButton;

  @override
  State<LobbyHeaderScreen> createState() => _LobbyHeaderScreenState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}

class _LobbyHeaderScreenState extends State<LobbyHeaderScreen> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: widget.onPressedBackButton,
      ),
      title: TextFormField(
        controller: widget.textEditingController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: AppColors.primary,
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
          child: Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.primary,
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
