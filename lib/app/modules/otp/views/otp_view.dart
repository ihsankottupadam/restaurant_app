import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restaurant_app/app/widgets/primary_button.dart';

import '../../auth/controllers/auth_controller.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Lottie.asset(
                  'assets/lottie/109224-otp-sent.json',
                  width: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Verification',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                            "We've sent an SMS with an verification code to your phone ",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        children: [
                          TextSpan(
                              text: AuthController.instance.phoneNumber
                                  .replaceRange(6, 10, '** ***'),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ]),
                  ),
                ),
                const SizedBox(height: 20),
                GetBuilder<OtpController>(builder: (controller) {
                  return Column(
                    children: [
                      OTPTextField(
                        controller: controller.otpController,
                        length: 6,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        fieldWidth: 35,
                        fieldStyle: FieldStyle.box,
                        otpFieldStyle: OtpFieldStyle(),
                        outlineBorderRadius: 5,
                        spaceBetween: 0,
                        hasError: controller.otpError,
                        style: const TextStyle(fontSize: 17),
                        onChanged: controller.otpChaned,
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        isLoading: controller.isLoading,
                        text: 'Verify',
                        backgroundColor: Colors.black,
                        isEnabled: controller.otpValue.length == 6,
                        onPressed: controller.verify,
                      )
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
