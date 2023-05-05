import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:restaurant_app/app/modules/auth/controllers/auth_controller.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final RxBool isLoading = false.obs;
  String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'Enter phone number';
    }
    if (value.length != 10) {
      return 'Enter valid phone number';
    }
    return null;
  }

  signIn() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await AuthController.instance
        .verifyPhone('+91${phoneNumberController.text}');
    isLoading.value = false;
  }
}
