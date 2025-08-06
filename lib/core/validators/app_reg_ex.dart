class AppRegEx {
  static RegExp email = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );
  static RegExp passwordUppercaseLetter = RegExp(r'[A-Z]');
  static RegExp passwordAtLeastOneNumber = RegExp(r'[0-9]');
}
