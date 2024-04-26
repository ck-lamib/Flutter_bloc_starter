String emailRegex =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String numberOnly = r'^[0-9]+$';

class Validators {
  static String? checkFieldEmpty(String? fieldContent) {
    var trimmedFieldContent = fieldContent!.trim();
    if (trimmedFieldContent.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? checkPhoneField(String? fieldContent) {
    var trimmedFieldContent = fieldContent!.trim();
    if (trimmedFieldContent.isEmpty) {
      return 'This field is required';
    } else if (!(RegExp(numberOnly).hasMatch(trimmedFieldContent) &&
            trimmedFieldContent.length <= 15 ||
        trimmedFieldContent.length >= 10)) {
      return 'Invalid phone number';
    }

    return null;
  }

  static String? checkPasswordField(String? fieldContent) {
    var trimmedFieldContent = fieldContent!.trim();
    if (trimmedFieldContent.isEmpty) {
      return 'This field is required';
    } else if (trimmedFieldContent.length < 8) {
      return 'The password should be at least 8 digits';
    }

    return null;
  }

  static String? checkConfirmPassword(String? password, String? fieldContent) {
    var checkPassword = checkPasswordField(fieldContent);
    if (checkPassword != null) {
      return checkPassword;
    }

    if (password != fieldContent!) {
      return "Password does not match";
    }
    return null;
  }

  static String? checkEmailField(String? fieldContent) {
    var trimmedFieldContent = fieldContent!.trim();
    if (trimmedFieldContent.isEmpty) {
      return 'This field is required';
    } else if (!RegExp(emailRegex).hasMatch(trimmedFieldContent)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? checkPinField(String? fieldContent) {
    var trimmedFieldContent = fieldContent!.trim();
    if (trimmedFieldContent.isEmpty) {
      return 'This field is required';
    } else if (!(trimmedFieldContent.length == 4)) {
      return 'Invalid OTP';
    }
    return null;
  }
}
