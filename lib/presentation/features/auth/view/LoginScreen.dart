import 'package:flutter/material.dart';
import 'package:variety_app/presentation/features/Home/view/HomeScreen.dart';
import 'package:variety_app/presentation/widgets/AppTextField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String name = "login";

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
          child: Center(
            child: Column(
              spacing: 16,
              children: [
                Image.asset(
                  "assets/Login.png",
                  // width: size.width * 0.5,
                  // height: size.height * 0.3,
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                ),
                Text(
                  "Login",
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, HomeScreen.name);
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
