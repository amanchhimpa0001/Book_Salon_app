class TextValidatioinController {
  static isPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 8) {
      return "Please enter atleast 8 characters as password";
    } else {
      return null;
    }
  }

  static isTextValid(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid input";
    } else {
      return null;
    }
  }

  static isEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Please enter your email address";
    } else if (!email.contains("@") &&
        (!email.contains(".com") ||
            !email.contains(".co") ||
            !email.contains(".co.in"))) {
      return "please enter a valid email address";
    } else {
      return null;
    }
  }
}
