abstract class AppValidator {
  bool _isValid = false;
  bool get isValid => _isValid;
  String _value = "";
  String get value => _value;

  List<String> reasons = [];

  AppValidator({String? initValue}) {
    if (initValue != null) {}
  }
  void setValue(String value) {
    _value = value.trim();
    if (value.isEmpty) {
      _isValid = false;
      reasons.clear();
      return;
    }
    reasons = check();
    if (reasons.isEmpty) {
      _isValid = true;
    } else {
      _isValid = false;
    }
  }

  List<String> check();
}
