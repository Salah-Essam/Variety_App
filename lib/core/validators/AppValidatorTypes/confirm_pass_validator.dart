import 'package:variety_app/core/validators/app_validator.dart';

class ConfirmPassValidator extends AppValidator {
  String originalPassword;

  ConfirmPassValidator({required this.originalPassword, super.initValue});

  @override
  List<String> check() {
    List<String> reasons = [];

    if (value.isEmpty) {
      reasons.add("Confirmation is required");
    }
    if (value != originalPassword) {
      reasons.add("Passwords do not match");
    }

    return reasons;
  }
}
