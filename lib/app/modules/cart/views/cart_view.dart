import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurant_app/app/widgets/primary_button.dart';
import '../../otp/views/widgets/cart_tile.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Order Summary',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<CartController>(builder: (controller) {
              List items = controller.items;
              if (items.isEmpty) {
                return const Center(child: Text('No Items'));
              }
              return Column(
                children: [
                  Container(
                    color: Colors.green,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Text(
                        '${controller.items.length} Dishes - ${controller.totalItems} Items',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartTile(
                          dish: items[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(thickness: 2);
                      },
                      itemCount: items.length),
                  const Divider(thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'INR ${controller.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )
                    ],
                  )
                ],
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) {
          return controller.totalItems > 0
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PrimaryButton(
                      text: 'Place Order', onPressed: controller.placeOrder),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
