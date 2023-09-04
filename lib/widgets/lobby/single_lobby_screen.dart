import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';

class SingleLobbyScreen extends StatefulWidget {
  const SingleLobbyScreen({super.key});

  @override
  State<SingleLobbyScreen> createState() => _SingleLobbyScreenState();
}

class _SingleLobbyScreenState extends State<SingleLobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Text(
                  "Darling harbour",
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
                "Members: 3/4",
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
                  onPressed: (){},
                  child: const Text(
                    "Create",
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
    );
  }
}
