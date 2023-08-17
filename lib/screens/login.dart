import 'package:flutter/material.dart';
import 'package:runfinity/styles/app_colors.dart';
import 'package:runfinity/widgets/appText.dart';
import 'package:runfinity/widgets/formValidation.dart';
import 'package:runfinity/widgets/loginCheckBox.dart';
import 'package:runfinity/widgets/loginInput.dart';
import 'package:runfinity/widgets/loginPasswordInput.dart';
import 'package:runfinity/widgets/otherLoginOptions.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final FormValidation _formValidation = FormValidation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        padding: const EdgeInsets.only(top: 25),
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
                    Image.asset("images/login.png"),
                    const SizedBox(height: 50),
                    AppText(
                      text: "Log In",
                      size: 25,
                      fontWeight: FontWeight.w800,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            LoginInput(
                              inputController: _usernameController,
                              hintText: "Username",
                              validate: _formValidation.validateUserName,
                            ),
                            LoginPasswordInput(
                              passwordController: _passwordController,
                              hintText: "Password",
                              validate: _formValidation.validatePassword,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const LoginCheckbox(),
                                    AppText(text: 'Remember Me')
                                  ],
                                ),
                                AppText(
                                  text: 'Forgot Password ?',
                                  color: AppColors.primary,
                                )
                              ],
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
                                          final isValidForm = _formKey.currentState!.validate();
                                          if (isValidForm) {

                                          } 
                                        },
                                        child: AppText(
                                          text: "Log In",
                                          size: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    const OtherLoginOptions(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(text: 'New User?'),
                        const SizedBox(
                          width: 4,
                        ),
                        AppText(
                          text: 'Sign Up',
                          color: AppColors.primary,
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
