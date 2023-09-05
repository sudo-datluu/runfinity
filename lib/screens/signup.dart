import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/app_text.dart';
import 'package:runfinity/utils/form_validation.dart';
import 'package:runfinity/widgets/login/login_input.dart';
import 'package:runfinity/widgets/login/login_password_input.dart';
import 'package:runfinity/widgets/login/other_login_options.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: AppColors.primaryDarker,
            padding: const EdgeInsets.only(top: 25, bottom: 25),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    )),
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
                                          backgroundColor: AppColors.neutral750 ,
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
                          AppText(
                            text: 'Log In',
                            color: AppColors.primary,
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
