import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:runfinity/screens/login.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/appText.dart';
import 'package:runfinity/utils/form_validation.dart';
import 'package:runfinity/widgets/login/loginInput.dart';
import 'package:runfinity/widgets/login/loginPasswordInput.dart';
import 'package:runfinity/widgets/login/otherLoginOptions.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final FormValidation _formValidation = FormValidation();

  @override
  void dispose() {
    super.dispose();
    _nameController.clear();
    _usernameController.clear();
    _phoneController.clear();
    _mailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
            color: AppColors.background,
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
              children: [
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
                              inputController: _usernameController,
                              hintText: 'Username',
                              validate: _formValidation.validateFullName,
                            ),
                            LoginInput(
                              inputController: _nameController,
                              hintText: "Full name",
                              validate: _formValidation.validateUserName,
                            ),
                            LoginInput(
                              inputController: _mailController,
                              hintText: "Email",
                              validate: _formValidation.validateMail,
                            ),
                            LoginInput(
                              inputController: _phoneController,
                              hintText: "Phone number",
                              validate: _formValidation.validatePhone,
                            ),
                            LoginPasswordInput(
                              passwordController: _passwordController,
                              hintText: "Password",
                              validate: _formValidation.validatePassword,
                            ),
                            LoginPasswordInput(
                              passwordController: _confirmPasswordController,
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
                                          if (isValidForm) {}
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
