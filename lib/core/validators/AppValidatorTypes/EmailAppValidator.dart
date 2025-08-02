import 'package:variety_app/core/validators/AppRegEx.dart';
import 'package:variety_app/core/validators/AppValidator.dart';

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
