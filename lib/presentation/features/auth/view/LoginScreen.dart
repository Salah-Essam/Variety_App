import 'package:flutter/material.dart';
import 'package:variety_app/presentation/features/Home/view/HomeScreen.dart';
import 'package:variety_app/presentation/features/auth/view/SignUpScreen.dart';
import 'package:variety_app/presentation/widgets/AppButton.dart';
import 'package:variety_app/presentation/widgets/AppTextField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String name = "login";

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final color_scheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: Center(
            child: Column(
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
                Text("dont've an account?"),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.name);
                  },
                  child: Text("Sign up now."),
                ),
                SizedBox(height: 32),
                AppButton(
                  title: "Login",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.name,
                      (r) => false,
                    );
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

//   ElevatedButton AppButton(ColorScheme color_scheme) {
//     return ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: WidgetStateProperty.all(
//                       color_scheme.primary,
//                     ),
//                     foregroundColor: WidgetStateProperty.all(
//                       color_scheme.onPrimary,
//                     ),
//                     textStyle: WidgetStateProperty.all(
//                       TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   onPressed: () {
//                     // Navigator.popAndPushNamed(context, HomeScreen.name);
//                     // Navigator.pushNamed(context, HomeScreen.name);
//                   },
//                   child: Text("Login"),
//                 );
//   }
