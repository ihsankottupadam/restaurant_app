import 'package:get/get.dart';
import 'package:restaurant_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:restaurant_app/app/modules/cart/controllers/cart_controller.dart';

class InitialBindins extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(CartController(), permanent: true);
  }
}
