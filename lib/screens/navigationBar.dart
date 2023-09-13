import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/controllers/auth/profile_controller.dart';
import 'package:runfinity/screens/home_page.dart';
import 'package:runfinity/screens/lobby_screens/lobby_chat_screen.dart';
import 'package:runfinity/screens/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const HomePage(),
    const LobbyChatScreen(),
    const HomePage(),
    const ProfilePage(),
  ];

  final profileController = Get.put(ProfileController());

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 51, 63).withOpacity(1),
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 47, 60, 80),
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                        onTap: () {
                          if (currentIndex != index) {
                            setState(() {
                              currentIndex = index;
                            });
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              margin: EdgeInsets.only(bottom: 2),
                              height: 4,
                              width: currentIndex == index ? 20 : 0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                            Opacity(
                              opacity: currentIndex == index ? 1 : 0.5,
                              child: SizedBox(
                                width: 36,
                                height: 36,
                                child: bottomNavs[index],
                              ),
                            ),
                          ],
                        ),
                      ))
            ],
          ),
        ),
      ),
      body: pages[currentIndex],
    );
  }
}

List<Icon> bottomNavs = [
  Icon(
    Icons.home,
    size: 30,
    color: Color.fromARGB(255, 205, 205, 205),
  ),
  Icon(
    Icons.leaderboard,
    size: 30,
    color: Color.fromARGB(255, 205, 205, 205),
  ),
  Icon(
    Icons.message,
    size: 30,
    color: Color.fromARGB(255, 205, 205, 205),
  ),
  Icon(
    Icons.storage,
    size: 30,
    color: Color.fromARGB(255, 205, 205, 205),
  ),
  Icon(
    Icons.person,
    size: 30,
    color: Color.fromARGB(255, 205, 205, 205),
  ),
];
