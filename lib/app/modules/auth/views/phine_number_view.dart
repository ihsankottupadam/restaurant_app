import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:restaurant_app/app/modules/auth/controllers/login_controller.dart';

import '../../../widgets/input_field.dart';
import '../../../widgets/primary_button.dart';

class PhoneNumberView extends GetWidget<LoginController> {
  const PhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                    ),
                    const SizedBox(height: 50),
                    SvgPicture.asset(
                      'assets/svg/login.svg',
                      width: size.width * .6,
                    ),
                    const SizedBox(height: 24),
                    InputField(
                      controller: controller.phoneNumberController,
                      labelText: 'Mobile Number',
                      maxLength: 10,
                      showLabelOnTop: true,
                      inputType: TextInputType.phone,
                      validator: controller.phoneValidator,
                      prefix: const Text('+91'),
                    ),
                    const SizedBox(height: 32),
                    Obx(() => PrimaryButton(
                          text: 'Login',
                          onPressed: controller.signIn,
                          isLoading: controller.isLoading.value,
                          backgroundColor: Colors.black,
                        )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
