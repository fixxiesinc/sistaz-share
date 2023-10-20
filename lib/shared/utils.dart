import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:sistaz_share_web/exports.dart';

class Utils {
  static String generateHash(String value) {
    return BCrypt.hashpw(value, BCrypt.gensalt());
  }

  static showToast(BuildContext context, String message) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
      messageColor: Colors.black,
      messageSize: 16,
      backgroundColor: Colors.white,
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }
}
