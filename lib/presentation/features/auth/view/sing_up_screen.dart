import 'package:flutter/material.dart';
import 'package:variety_app/core/app_assets.dart';
import 'package:variety_app/core/app_colors.dart';
import 'package:variety_app/core/app_strings.dart';
import 'package:variety_app/core/managers/Firebase/firebase_auth_manager.dart';
import 'package:variety_app/core/validators/AppValidatorTypes/confirm_pass_validator.dart';
import 'package:variety_app/core/validators/AppValidatorTypes/email_app_validator.dart';
import 'package:variety_app/core/validators/AppValidatorTypes/password_app_validator.dart';
import 'package:variety_app/presentation/features/Home/view/home_screen.dart';
import 'package:variety_app/presentation/widgets/app_button.dart';
import 'package:variety_app/presentation/widgets/app_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
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
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Image.asset(
                  AppAssets.signup,
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                ),
                Text(
                  AppStrings.signUp,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.05,
                  ),
                ),
                const SizedBox(height: 32),
                AppTextField(
                  controller: nameController,
                  onChange: (v) {},
                  labelText: AppStrings.name,
                  hint: AppStrings.enterYourName,
                  type: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  validator: emailValidator,
                  controller: emailController,
                  onChange: (v) {
                    setState(() {
                      emailValidator.setValue(v);
                    });
                  },
                  labelText: AppStrings.email,
                  hint: AppStrings.enterYourEmail,
                  type: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  validator: passwordValidator,
                  controller: passController,
                  onChange: (v) {
                    setState(() {
                      passwordValidator.setValue(v);
                      confirmPassValidator.originalPassword = v;
                    });
                  },
                  labelText: AppStrings.password,
                  hint: AppStrings.enterYourPassword,
                  type: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,

                  isObscure: _isObscure,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  validator: confirmPassValidator,
                  controller: confirmPassController,
                  onChange: (v) {
                    setState(() {
                      confirmPassValidator.setValue(v);
                    });
                  },
                  labelText: AppStrings.confirmPassowrd,
                  hint: AppStrings.confirmYourPassword,
                  type: TextInputType.visiblePassword,
                  isObscure: _isObscure,
                ),
                const SizedBox(height: 8),
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
                    const Text(AppStrings.showThePassword),
                  ],
                ),
                const SizedBox(height: 32),
                AppButton(
                  title: AppStrings.signUp,

                  onPressed:
                      ((emailValidator.reasons.isEmpty &&
                                  passwordValidator.reasons.isEmpty &&
                                  confirmPassValidator.reasons.isEmpty) &&
                              nameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              passController.text.isNotEmpty)
                          ? () async {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              barrierColor: AppColors.black.withAlpha(100),
                              builder:
                                  (_) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                            );
                            try {
                              await FirebaseManager.instance.signUpWithEmail(
                                name: nameController.text,
                                email: emailController.text,
                                password: passController.text,
                              );
                              if (!context.mounted) return;
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                HomeScreen.name,
                                (r) => false,
                              );
                            } catch (e) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login failed: $e")),
                              );
                            }
                          }
                          : () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
