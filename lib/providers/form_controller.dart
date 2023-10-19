import 'package:sistaz_share_web/exports.dart';

class FormController extends GetxController {
  Rx<int> currentStep = 0.obs;

  static String username = '';
  static String pincode = '';
  static String ageGroup = '';
  static String country = '';
  static String education = '';
  static String gender = '';
  static String counsellor = '';

  static Map toMap() {
    return {
      'username': username.trim(),
      'secret': pincode,
      'age_group': ageGroup,
      'country': country,
      'education': education,
      'gender': gender,
      'counsellor': counsellor,
    };
  }
}
