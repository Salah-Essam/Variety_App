import 'package:variety_app/core/validators/app_reg_ex.dart';
import 'package:variety_app/core/validators/app_validator.dart';

class PasswordAppValidator extends AppValidator {
  PasswordAppValidator({super.initValue});

  @override
  List<String> check() {
    List<String> reasons = [];

    if (value.isEmpty) {
      reasons.add("Password is required");
    }
    if (value.length < 6) {
      reasons.add("Password must be at least 6 characters");
    }
    if (!AppRegEx.passwordUppercaseLetter.hasMatch(value)) {
      reasons.add("Password must contain at least one uppercase letter");
    }
    if (!AppRegEx.passwordAtLeastOneNumber.hasMatch(value)) {
      reasons.add("Password must contain at least one number");
    }
    return reasons;
  }
}
