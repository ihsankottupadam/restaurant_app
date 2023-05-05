import 'package:get/get.dart';

import '../../../data/models/table_menu_model.dart';
import '../../../widgets/order_success_dialog.dart';

class CartController extends GetxController {
  final List<CategoryDish> items = [];
  int totalItems = 0;
  double totalPrice = 0;
  addItem(CategoryDish item) {
    if (!items.contains(item)) {
      items.add(item);
    }
    item.quanity++;
    totalPrice += item.dishPrice;
    totalItems++;
    update();
  }

  removeItem(CategoryDish item) {
    item.quanity--;
    totalPrice -= item.dishPrice;
    totalItems--;
    if (item.quanity <= 0) {
      items.remove(item);
    }
    update();
  }

  placeOrder() async {
    for (var item in items) {
      item.quanity = 0;
    }
    items.clear();
    totalItems = 0;
    totalPrice = 0;
    update();
    Get.back();
    Future.delayed(const Duration(milliseconds: 300));
    Get.dialog(const OrderSuccessDialog());
  }
}
