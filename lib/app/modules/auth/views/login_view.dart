import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:restaurant_app/app/modules/auth/views/phine_number_view.dart';
import 'package:restaurant_app/app/modules/auth/views/widgets/login_button.dart';
import 'package:restaurant_app/core/values/colors.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/firebase.png',
              width: size.width * .8,
            ),
            const SizedBox(height: 50),
            LoginButton(
              icon: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/google-icon.png'),
                backgroundColor: kwhite,
                radius: 15,
              ),
              text: 'Google',
              color: Colors.blue,
              onPress: AuthController.instance.signInWithGoogle,
            ),
            const SizedBox(height: 20),
            LoginButton(
              icon: const Icon(Icons.phone),
              text: 'Phone',
              color: Colors.green,
              onPress: () => Get.to(() => const PhoneNumberView()),
            )
          ],
        ),
      ),
    );
  }
}
