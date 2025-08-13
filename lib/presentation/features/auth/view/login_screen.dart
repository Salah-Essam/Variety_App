import 'package:flutter/material.dart';
import 'package:variety_app/core/app_assets.dart';
import 'package:variety_app/core/app_strings.dart';
import 'package:variety_app/presentation/features/Home/view/home_screen.dart';
import 'package:variety_app/presentation/features/auth/view/sing_up_screen.dart';
import 'package:variety_app/presentation/widgets/app_button.dart';
import 'package:variety_app/presentation/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
                  AppAssets.login,
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                ),
                Text(
                  AppStrings.login,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.05,
                  ),
                ),
                const SizedBox(height: 32),
                AppTextField(
                  controller: emailController,
                  onChange: (v) {},
                  labelText: AppStrings.email,
                  hint: AppStrings.enterYourEmail,
                  type: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: passController,
                  onChange: (v) {},
                  labelText: AppStrings.password,
                  hint: AppStrings.enterYourPassword,
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
                const Text(AppStrings.dontHaveAnAccount),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.name);
                  },
                  child: const Text(AppStrings.signUpNow),
                ),
                const SizedBox(height: 32),
                AppButton(
                  title: AppStrings.login,
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
