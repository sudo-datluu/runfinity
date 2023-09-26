import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/screens/lobby_screens/lobby_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentStep = 14000;
  int neededStep = 15000;
  int level = 6;
  @override
  Widget build(BuildContext context) {
    double percentage = currentStep / neededStep;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 51, 63).withOpacity(1),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                bottom: 4,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Rectangle32.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                //color: Color.fromARGB(255, 84, 75, 167).withOpacity(0),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 0),
                  child: Column(
                    children: [
                      //top bar
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.horizontal_split_outlined,
                                  color: Colors.white60,
                                  size: 32,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage: AssetImage(
                                      'images/onboardingscreen1.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'HELLO!',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Daniela',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.list,
                                  color: Colors.white60,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.mark_email_unread,
                                  color: Colors.white60,
                                  size: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //level
                      Container(
                        width: 370,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:
                                  300, // Adjust the width of the experience bar
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "14,000 / 15,000 steps",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        "Level " + level.toString(),
                                        style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  LinearProgressIndicator(
                                    value: percentage,
                                    backgroundColor: Colors.grey[300],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.blue),
                                  ),
                                  const SizedBox(
                                      height:
                                          4), // Add spacing between progress bar and separator
                                ],
                              ),
                            ),
                            Image(image: AssetImage("images/Level badge.png")),
                          ],
                        ),
                      ),

                      //daily stat
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 15),
                        child: Container(
                          width: 374,
                          padding: const EdgeInsets.fromLTRB(16, 18, 18, 18),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.17),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 28,
                                backgroundImage:
                                    AssetImage('images/onboardingscreen1.png'),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '26 May',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Today',
                                    style: TextStyle(
                                      color: Colors.green[400],
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Text(
                                    '01 : 09 : 44',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      //total footsteps and points earned
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 82,
                              width: 177,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.17),
                                  width: 1,
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '53,524',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 35,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.ice_skating_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Text(
                                        'Steps',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 82,
                              width: 177,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.17),
                                  width: 1,
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1000',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 35,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.confirmation_num,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Text(
                                        'Earned Points',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //add_new_run button
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
                        child: InkWell(
                          splashFactory:
                              InkSparkle.constantTurbulenceSeedSplashFactory,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LobbyScreen()));
                            // Get.off(const LobbyScreen());
                            print('Button clicked');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 162, 90, 215),
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.17),
                                width: 1,
                              ),
                            ),
                            height: 48,
                            width: 380,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Add a new run',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //share and get
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 15, 17, 5),
              child: GestureDetector(
                onTap: () {
                  print('Shared!');
                },
                child: Container(
                  width: 380,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                    image: DecorationImage(
                      image: AssetImage('images/Share.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            //history
            const Padding(
              padding: EdgeInsets.fromLTRB(17, 15, 17, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Color.fromARGB(255, 123, 97, 255),
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),

            //history entities
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 8, 17, 8),
              child: Container(
                  width: 374,
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.17),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '27 May: Darling Harbour',
                            style: TextStyle(
                              color: Color.fromARGB(255, 123, 97, 255),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            '100 pt  -  12,4 km  -  1222 kcal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '10,120 Steps',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
