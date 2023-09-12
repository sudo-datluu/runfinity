import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:runfinity/screens/store.dart';
import 'package:runfinity/widgets/loadRunningModal.dart';
import 'package:get/get.dart';
import 'package:runfinity/screens/lobby_screens/lobby_screen.dart';
import 'package:runfinity/screens/login.dart';
import 'package:runfinity/screens/navigationBar.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/lobby/create_lobby_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    return token;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: AppColors.background,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
      ),
      home: const LobbyScreen(),
//       home: StorePage(),//LoadRunningModal(isLoadRun:true,),
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//           iconTheme: IconThemeData(
//             color: Colors.white,
//           ),
//           backgroundColor: AppColors.background,
//           centerTitle: true,
//           titleTextStyle: TextStyle(
//               color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
//           elevation: 0,
//         ),
//       ),
      home: FutureBuilder<String?>(
          future: getAccessToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final token = snapshot.data;
              
              return token != null ? const MainPage() : const Login();
            }
          }),
    );
  }
}
