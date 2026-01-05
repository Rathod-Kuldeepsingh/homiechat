import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homiechat/config/theme/app_theme.dart';
import 'package:homiechat/core/common/custome_button.dart';
import 'package:homiechat/core/common/custome_textfield.dart';
import 'package:homiechat/presentation/screens/auth/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    fullname.dispose();
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
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
                  controller: fullname,
                  HintText: "Enter the fullname",
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
                  HintText: "Enter the username",
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
                  ObscureText: true,
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
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomeButton(text: "Create Account"),
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
            ],
          ),
        ),
      ),
    );
  }
}
