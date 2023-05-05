import 'package:flutter/material.dart';

import '../../../../data/models/table_menu_model.dart';
import '../../../../widgets/box_icon.dart';
import '../../../../widgets/item_button.dart';

class DishListTile extends StatelessWidget {
  const DishListTile({super.key, required this.dish});
  final CategoryDish dish;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BoxIcon(
                      color: dish.dishType == 1 ? Colors.red : Colors.green,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        dish.dishName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('INR ${dish.dishPrice}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('${dish.dishCalories} Calories',
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(height: 10),
                Text(dish.dishDescription,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.blueGrey)),
                const SizedBox(height: 10),
                ItemButton(dish),
                const SizedBox(height: 10),
                if (dish.addonCat?.isNotEmpty ?? false)
                  const Text(
                    "Customization Available",
                    style: TextStyle(color: Colors.pink),
                  )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            'assets/images/img_soup.jpg',
            width: 60,
            height: 60,
          )
        ],
      ),
    );
  }
}
