import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:restaurant_app/app/data/models/table_menu_model.dart';
import 'package:restaurant_app/app/data/services/category_service.dart';
import 'package:restaurant_app/app/modules/cart/controllers/cart_controller.dart';
import 'package:restaurant_app/app/routes/app_pages.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../core/values/colors.dart';
import 'widgets/dish_tile.dart';
import 'widgets/drawer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: _buildAppBar(),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: CategoryService().getMenus(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final menuList = snapshot.data!;
            return DefaultTabController(
                length: menuList.length,
                child: Column(
                  children: [
                    TabBar(
                        indicatorColor: Colors.pink,
                        labelColor: Colors.pink,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        tabs: menuList
                            .map((item) => Tab(
                                  text: item.menuCategory,
                                ))
                            .toList()),
                    Expanded(
                        child: TabBarView(
                            children: menuList
                                .map((item) => CategoryScreen(
                                      dishes: item.categoryDishes,
                                    ))
                                .toList()))
                  ],
                ));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kwhite,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.green),
      iconTheme: const IconThemeData(color: kblack),
      leading: Builder(builder: (context) {
        return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu_rounded,
            ));
      }),
      actions: [
        GetBuilder<CartController>(builder: (controller) {
          return badges.Badge(
            badgeContent: Text(
              '${controller.totalItems}',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, color: kwhite),
            ),
            position: badges.BadgePosition.topEnd(top: 4, end: 0),
            child: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.CART);
                },
                icon: const Icon(
                  Icons.local_grocery_store,
                )),
          );
        })
      ],
    );
  }
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.dishes});
  final List<CategoryDish> dishes;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        return DishListTile(dish: dishes[index]);
      },
      separatorBuilder: (context, _) {
        return const Divider(thickness: 2);
      },
    );
  }
}
