abstract class AppRegex{

  static bool isPhoneValid(String phone) {
    return RegExp(r'^(\+201|01|00201)[0-2,5]{1}[0-9]{8}$')
        .hasMatch(phone);
  }

  static bool isPasswordValid(String password) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(password);
  }

}