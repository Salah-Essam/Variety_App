import 'package:flutter/material.dart';
import 'package:variety_app/presentation/features/Home/view/HomeScreen.dart';
import 'package:variety_app/presentation/features/auth/view/SignUpScreen.dart';
import 'package:variety_app/presentation/widgets/AppButton.dart';
import 'package:variety_app/presentation/widgets/AppTextField.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static String name = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
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
                  type: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                AppTextField(
                  controller: passController,
                  onChange: (v) {},
                  labelText: "Password",
                  hint: "Enter your Password",
                  type: TextInputType.visiblePassword,

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  isObscure: _isObscure,
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
