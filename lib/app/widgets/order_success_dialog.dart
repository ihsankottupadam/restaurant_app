import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/app/widgets/primary_button.dart';

class OrderSuccessDialog extends StatelessWidget {
  const OrderSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/lottie/succes_done.json',
            width: 100,
            fit: BoxFit.contain,
            repeat: false,
          ),
          const SizedBox(height: 25),
          const Text(
            'Order successfully placed',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 15),
          PrimaryButton(
            text: 'OK',
            height: 35,
            width: 110,
            onPressed: () => Get.back(),
          )
        ],
      ),
    );
  }
}
