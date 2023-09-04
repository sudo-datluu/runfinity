import 'package:flutter/material.dart';
import 'package:runfinity/widgets/lobby/single_lobby_screen.dart';
import '../../../styles/app_colors.dart';

class FindingLobbyScreen extends StatefulWidget {
  const FindingLobbyScreen({
    super.key,
    required this.onClicked,
    });

  final VoidCallback onClicked;

  @override
  State<FindingLobbyScreen> createState() => _FindingLobbyScreenState();
}

class _FindingLobbyScreenState extends State<FindingLobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.6,

        builder: (BuildContext context, ScrollController scrollController){
          return Container(
            color: AppColors.neutral800,
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5,),
                  const Center(
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const Text(
                    "Lobby",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20,),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 30,
                      children: [
                        SingleLobbyScreen(),
                        SingleLobbyScreen(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: widget.onClicked,
                      child: const Text(
                        "Create a new lobby",
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
    );
  }
}
