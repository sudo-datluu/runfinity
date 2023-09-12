// ignore_for_file: file_names
class FormValidation {
  String password = '';

  String? validateEmpty(value) {
    if (value.isEmpty) {
      return 'Please enter your user name';
    } else {
      return null;
    }
  }

  String? validateUserName(value) {
    if (value.isEmpty) {
      return 'Please enter your user name';
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return 'Invalid name.';
    } else {
      return null;
    }
  }

  String? validateFullName(value) {
    if (value.isEmpty) {
      return 'Please enter your full name';
    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
      return 'Invalid name.';
    } else {
      return null;
    }
  }

  String? validatePhone(value) {
    if (value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r'^[0-9 ()-]+$').hasMatch(value)) {
      return 'Phone number not found!';
    } else {
      return null;
    }
  }

  String? validateMail(value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail.com$').hasMatch(value)) {
      return 'Email not found!';
    } else {
      return null;
    }
  }

  String? validatePassword(value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else {
      password = value;
      return null;
    }
  }

  String? validateCfPassword(value) {
    if (value.isEmpty) {
      return 'Please confirm your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    } else if(value != password) {
      return 'Please confirm the right password';
    } else {
      return null;
    }
  }
}
