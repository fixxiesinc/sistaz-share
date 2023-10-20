import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class FormController extends GetxController {
  static String username = '';
  static String pincode = '';
  static String ageGroup = '';
  static String country = '';
  static String education = '';
  static String gender = '';
  static Rx<String> preferredCounsellor = ''.obs;

  static String secret = '';

  static Map toMap() {
    return {
      'id': DatabaseService.generateID,
      'username': username.trim(),
      'secret': secret,
      'age_group': ageGroup,
      'country': country,
      'education': education,
      'gender': gender,
      'preferred_counsellor': preferredCounsellor.value,
      'created_at': DateTime.now().toIso8601String(),
    };
  }

  final pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  static bool formValidated() {
    return username.isNotEmpty &&
        pincode.isNotEmpty &&
        ageGroup.isNotEmpty &&
        country.isNotEmpty &&
        education.isNotEmpty &&
        gender.isNotEmpty;
  }
}
