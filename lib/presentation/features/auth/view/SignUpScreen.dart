import 'package:flutter/material.dart';
import 'package:variety_app/core/validators/AppValidatorTypes/ConfirmPassValidator.dart';
import 'package:variety_app/core/validators/AppValidatorTypes/EmailAppValidator.dart';
import 'package:variety_app/core/validators/AppValidatorTypes/PasswordAppValidator.dart';
import 'package:variety_app/presentation/features/Home/view/HomeScreen.dart';
import 'package:variety_app/presentation/widgets/AppButton.dart';
import 'package:variety_app/presentation/widgets/AppTextField.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});
  static String name = "SignUp";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  final EmailAppValidator emailValidator = EmailAppValidator();
  final PasswordAppValidator passwordValidator = PasswordAppValidator();
  final ConfirmPassValidator confirmPassValidator = ConfirmPassValidator(
    originalPassword: "",
  );

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
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
                  type: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                AppTextField(
                  validator: emailValidator,
                  controller: emailController,
                  onChange: (v) {
                    setState(() {
                      emailValidator.setValue(v);
                    });
                  },
                  labelText: "Email",
                  hint: "Enter your Email",
                  type: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16),
                AppTextField(
                  validator: passwordValidator,
                  controller: passController,
                  onChange: (v) {
                    setState(() {
                      passwordValidator.setValue(v);
                      confirmPassValidator.originalPassword = v;
                    });
                  },
                  labelText: "Password",
                  hint: "Enter your Password",
                  type: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,

                  isObscure: _isObscure,
                ),
                SizedBox(height: 16),
                AppTextField(
                  validator: confirmPassValidator,
                  controller: confirmPassController,
                  onChange: (v) {
                    setState(() {
                      confirmPassValidator.setValue(v);
                    });
                  },
                  labelText: "Confirm Password",
                  hint: "Confirm your Password",
                  type: TextInputType.visiblePassword,
                  isObscure: _isObscure,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: !_isObscure,
                      onChanged: (v) {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    Text("Show the password."),
                  ],
                ),
                SizedBox(height: 32),
                AppButton(
                  title: "Sign up",
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
