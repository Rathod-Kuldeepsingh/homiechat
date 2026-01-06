import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiechat/config/theme/app_theme.dart';
import 'package:homiechat/core/common/custome_button.dart';
import 'package:homiechat/core/common/custome_textfield.dart';
import 'package:homiechat/data/repositories/auth_repository.dart';
import 'package:homiechat/data/services/service_locator.dart';
import 'package:homiechat/logic/cubits/auth/auth_cubit.dart';
import 'package:homiechat/presentation/screens/auth/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isPasswordVisible = false;
  final _nameFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _phoneFocus = FocusNode();

  @override
  void dispose() {
    fullname.dispose();
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    _nameFocus.dispose();
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();

    super.dispose();
  }

  String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    if (value.trim().length < 6) {
      return "Name must be at least 6 characters";
    }
    return null;
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

  String? isphone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Enter valid 10-digit phone number";
    }
    return null;
  }

  String? isusername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Username is required";
    }

    final username = value.trim();

    if (username.length < 3 || username.length > 20) {
      return "Username must be 3–20 characters long";
    }

    // Allowed characters
    if (!RegExp(r'^[a-zA-Z0-9._]+$').hasMatch(username)) {
      return "Only letters, numbers, . and _ allowed";
    }

    // Cannot start or end with . or _
    if (username.startsWith('.') ||
        username.startsWith('_') ||
        username.endsWith('.') ||
        username.endsWith('_')) {
      return "Username cannot start or end with . or _";
    }

    // No consecutive symbols
    if (username.contains('..') || username.contains('__')) {
      return "Username cannot contain consecutive dots or underscores";
    }

    return null;
  }

  Future<void> handlesignUp() async {
    FocusScope.of(context).unfocus();
    if (_formkey.currentState!.validate()) {
      name;
      emailvalidator;
      isphone;
      ispassword;
      isusername;
      debugPrint("Signup data valid");
      try {
        getIt<AuthCubit>().signUp(
          fullName: fullname.text,
          username: username.text,
          email: email.text,
          phoneNumber: phone.text,
          password: password.text,
        );
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(
          backgroundColor: AppTheme.primaryColor,
          content: Text(e.toString())));
      }
    }
    else{
      print("form validation falied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0, elevation: 0),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  "Create to your Account ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Please fill in the details to continue",
                  style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomeTextfield(
                  Validator: name,
                  controller: fullname,
                  HintText: "Enter the fullname",
                  focusnode: _nameFocus,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        "assets/Icons/user.png",
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomeTextfield(
                  controller: username,
                  Validator: isusername,
                  HintText: "Enter the username",
                  focusnode: _usernameFocus,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        "assets/Icons/id-card.png",
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomeTextfield(
                  controller: email,
                  focusnode: _emailFocus,
                  Validator: emailvalidator,
                  HintText: "Enter the email",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        "assets/Icons/mail.png",
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomeTextfield(
                  keyboardType: TextInputType.number,
                  controller: phone,
                  focusnode: _phoneFocus,
                  Validator: isphone,
                  HintText: "Enter the phone number",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        "assets/Icons/phone-call.png",
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomeTextfield(
                  controller: password,
                  Validator: ispassword,
                  focusnode: _passwordFocus,
                  ObscureText: !isPasswordVisible,
                  HintText: "Enter the password",
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
              SizedBox(height: 20),
              CustomeButton(text: "Create Account", onPressed: handlesignUp),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreen(),
                      //   ),
                      // );
                      Navigator.pop(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        children: [
                          TextSpan(text: "Already have an account?"),
                          TextSpan(
                            text: ' Login',
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
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
