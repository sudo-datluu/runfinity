import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runfinity/controllers/auth/lobby_controller.dart';
import 'package:runfinity/controllers/auth/login_controller.dart';
import 'package:runfinity/utils/lobby_validation.dart';
import '../../../styles/app_colors.dart';

class CreateLobbyScreen extends StatefulWidget {
  const CreateLobbyScreen({super.key});

  @override
  State<CreateLobbyScreen> createState() => _CreateLobbyScreenState();
}

class _CreateLobbyScreenState extends State<CreateLobbyScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _lobbyController = Get.put(LobbyController());
  final _lobbyValidation = CreateLobbyValidation();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.85,

          builder: (BuildContext context, ScrollController scrollController){
            return GetBuilder<LobbyController>(
              builder: (controller) {
                return Container(
                  color: AppColors.neutral850,
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
                          "Darling Harbour",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              'images/darling_harbour.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text(
                          "Distance Range",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Text(
                              "From",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppColors.neutral700,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Text(
                              "To",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                color: AppColors.neutral700,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "Limit member",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: AppColors.neutral700,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: controller.limitMemberEditingController,
                            validator: _lobbyValidation.validateLimit,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              elevation: 0,
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                _lobbyController.CreateLobbyService();
                              }
                            },
                            child: const Text(
                              "Create",
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
      ),
    );
  }
}
