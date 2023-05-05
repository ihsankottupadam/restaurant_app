import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/app/modules/cart/controllers/cart_controller.dart';

import '../../core/values/colors.dart';
import '../data/models/table_menu_model.dart';

class ItemButton extends GetWidget<CartController> {
  const ItemButton(this.dish, {super.key});
  final CategoryDish dish;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [BoxShadow(blurRadius: 2)]),
      child: GetBuilder<CartController>(builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: dish.quanity > 0
                    ? () {
                        controller.removeItem(dish);
                      }
                    : null,
                icon: const Icon(
                  Icons.remove,
                  color: kwhite,
                )),
            Text(dish.quanity.toString(),
                style: const TextStyle(color: kwhite, fontSize: 18)),
            IconButton(
                onPressed: () {
                  controller.addItem(dish);
                },
                icon: const Icon(
                  Icons.add,
                  color: kwhite,
                ))
          ],
        );
      }),
    );
  }
}
