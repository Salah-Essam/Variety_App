import 'package:flutter/material.dart';
import 'package:variety_app/presentation/features/auth/view/LoginScreen.dart';
import 'package:variety_app/presentation/widgets/AppButton.dart';
import 'package:variety_app/presentation/widgets/AppTextField.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static String name = "SignUp";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final color_scheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Image.asset(
                  "assets/Sign up.png",
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                ),
                Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.05,
                  ),
                ),
                SizedBox(height: 32),
                AppTextField(
                  controller: nameController,
                  onChange: (v) {},
                  labelText: "Name",
                  hint: "Enter your Name",
                ),
                SizedBox(height: 16),
                AppTextField(
                  controller: emailController,
                  onChange: (v) {},
                  labelText: "Email",
                  hint: "Enter your Email",
                ),
                SizedBox(height: 16),
                AppTextField(
                  controller: passController,
                  onChange: (v) {},
                  labelText: "Password",
                  hint: "Enter your Password",
                ),
                SizedBox(height: 16),
                AppTextField(
                  controller: confirmPassController,
                  onChange: (v) {},
                  labelText: "Confirm Password",
                  hint: "Confirm your Password",
                ),
                SizedBox(height: 32),
                AppButton(
                  title: "Sign up",
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.name);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
