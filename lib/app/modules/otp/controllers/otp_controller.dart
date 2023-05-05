import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:restaurant_app/app/modules/auth/controllers/auth_controller.dart';

class OtpController extends GetxController {
  bool isLoading = false;
  final otpController = OtpFieldController();
  var otpValue = '';
  bool otpError = false;
  otpChaned(value) {
    otpValue = value;
  }

  verify() async {
    isLoading = true;
    update();
    otpError = await AuthController.instance.verifyOtp(otpValue);
    isLoading = false;
    update();
  }
}
