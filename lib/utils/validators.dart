import 'package:flutter/foundation.dart';

class FormValidator {
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final _phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');

  String? validateRequired(String value, String fieldName) {
    if (value.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!_emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password should be at least 6 characters long';
    }
    return null;
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!_phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  bool submitForm({
    required String email,
    required String password,
    required String phoneNumber,
  }) {
    final emailError = validateEmail(email);
    final passwordError = validatePassword(password);
    final phoneNumberError = validatePhoneNumber(phoneNumber);

    if (emailError != null ||
        passwordError != null ||
        phoneNumberError != null) {
      if (kDebugMode) {
        print('Form validation failed!');
      }
      return false;
    }
    return true;
  }
}
