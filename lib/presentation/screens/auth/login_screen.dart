// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiechat/config/theme/app_theme.dart';
import 'package:homiechat/core/common/custome_button.dart';
import 'package:homiechat/core/common/custome_textfield.dart';
import 'package:homiechat/data/services/service_locator.dart';
import 'package:homiechat/logic/cubits/auth/auth_cubit.dart';
import 'package:homiechat/logic/cubits/auth/auth_state.dart';
import 'package:homiechat/main.dart';
import 'package:homiechat/presentation/screens/auth/Signup_screen.dart';
import 'package:homiechat/presentation/screens/home/home.dart';
import 'package:homiechat/router/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isPasswordVisible = false;

  final _emailfocus = FocusNode();
  final _passwordfocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    _emailfocus.dispose();
    _passwordfocus.dispose();
  }

  // Email Validator
  String? emailvalidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email";
    }
    return null;
  }

  String? ispassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Add at least one uppercase letter";
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Add at least one number";
    }
    return null;
  }

  Future<void> handlesignIn() async {
    FocusScope.of(context).unfocus();
    if (_formkey.currentState!.validate()) {
      emailvalidator;
      ispassword;
      debugPrint("Signup data valid");
      try {
        getIt<AuthCubit>().signIn(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppTheme.primaryColor,
            content: Text(e.toString()),
          ),
        );
      }
    } else {
      print("form validation falied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        bloc: getIt<AuthCubit>(),
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            getIt<AppRouter>().pushAndRemoveUntil(
              const Home(),
            );
          } 
          //else if (state.status == AuthStatus.error && state.error != null) {
            //UiUtils.showSnackBar(context, message: state.error!);
          //}
        },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Center(
                  child: Image.asset(
                    'assets/logo/homie.png',
                    height: 170,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Login to your Account ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomeTextfield(
                    controller: emailcontroller,
                    Validator: emailvalidator,
                    focusnode: _emailfocus,
                    HintText: 'Enter the email',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          color: Colors.grey.shade800,
                          "assets/Icons/mail.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomeTextfield(
                    controller: passwordcontroller,
                    focusnode: _passwordfocus,
                    Validator: ispassword,
                    HintText: "Enter the Password",
                    ObscureText: !isPasswordVisible,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/Icons/password.png",
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey.shade800,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        log("Forget Screen");
                      },
                      child: Text(
                        "Forget Password?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomeButton(onPressed: handlesignIn, text: "Login"),

                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SignupScreen(),
                        //   ),
                        // );

                        getIt<AppRouter>().push(
                          SignupScreen(),
                        ); // getit use here
                      },
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          children: [
                            TextSpan(text: "Don't have an account?"),
                            TextSpan(
                              text: ' Signup',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
