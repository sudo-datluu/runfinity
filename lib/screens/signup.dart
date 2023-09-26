import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:runfinity/controllers/auth/signup_controller.dart';
import 'package:runfinity/screens/login.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';
import 'package:runfinity/utils/form_validation.dart';
import 'package:runfinity/widgets/custom_back_arrow.dart';
import 'package:runfinity/widgets/login/login_input.dart';
import 'package:runfinity/widgets/login/login_password_input.dart';
import 'package:runfinity/widgets/login/other_login_options.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  final FormValidation _formValidation = FormValidation();

  final _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: AppColors.background,
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
              children: [
                const CustomBackArrow(),
                Container(
                  padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
                  child: Column(
                    children: [
                      AppText(
                        text: "Sign Up",
                        size: 25,
                        fontWeight: FontWeight.w800,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            LoginInput(
                              inputController: _signupController.usernameController,
                              hintText: 'Username',
                              validate: _formValidation.validateEmpty,
                            ),
                            LoginInput(
                              inputController: _signupController.nameController,
                              hintText: "Full name",
                              validate: _formValidation.validateFullName,
                            ),
                            LoginInput(
                              inputController: _signupController.mailController,
                              hintText: "Email",
                              // validate: _formValidation.validateMail,
                            ),
                            LoginInput(
                              inputController: _signupController.phoneController,
                              hintText: "Phone number",
                              // validate: _formValidation.validatePhone,
                            ),
                            LoginPasswordInput(
                              passwordController: _signupController.passwordController,
                              hintText: "Password",
                              validate: _formValidation.validatePassword,
                            ),
                            LoginPasswordInput(
                              passwordController: _signupController.confirmPasswordController,
                              hintText: "Confirm Password",
                              validate: _formValidation.validateCfPassword,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: 56,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          elevation: 0,
                                        ),
                                        onPressed: () {
                                          final isValidForm =
                                              _formKey.currentState!.validate();
                                          if (isValidForm) {
                                            _signupController.signupService();
                                          }
                                        },
                                        child: AppText(
                                          text: "Sign Up",
                                          size: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const OtherLoginOptions(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(text: 'Already have an account?'),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const Login(),
                                    type: PageTransitionType.fade));
                          },
                            child: AppText(
                              text: 'Log In',
                              color: AppColors.primary,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
