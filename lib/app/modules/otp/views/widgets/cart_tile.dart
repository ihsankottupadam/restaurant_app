import 'package:flutter/material.dart';

import '../../../../data/models/table_menu_model.dart';
import '../../../../widgets/box_icon.dart';
import '../../../../widgets/item_button.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.dish});
  final CategoryDish dish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BoxIcon(
          color: dish.dishType == 1 ? Colors.red : Colors.green,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dish.dishName,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('INR ${dish.dishPrice}',
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey)),
              const SizedBox(height: 10),
              Text('${dish.dishCalories} Calories',
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ItemButton(dish),
        ),
        Text('INR ${dish.dishPrice * dish.quanity}',
            style: const TextStyle(fontWeight: FontWeight.bold))
      ]),
    );
  }
}
