import 'package:variety_app/core/validators/app_reg_ex.dart';
import 'package:variety_app/core/validators/app_validator.dart';

class EmailAppValidator extends AppValidator {
  EmailAppValidator({super.initValue});
  @override
  List<String> check() {
    List<String> reasons = [];

    if (value.isEmpty) {
      reasons.add("Email is Required");
    }
    if (!AppRegEx.email.hasMatch(value)) {
      reasons.add("Email is Not Valid");
    }
    return reasons;
  }
}
