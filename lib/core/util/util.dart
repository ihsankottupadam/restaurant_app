import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Util {
  Util._();
  static showError(String error) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
