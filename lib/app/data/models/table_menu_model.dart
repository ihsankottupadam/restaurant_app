List<TableMenuModel> tableMenuModelFromJson(List list) =>
    List<TableMenuModel>.from(list.map((x) => TableMenuModel.fromJson(x)));

class TableMenuModel {
  final String menuCategory;
  final String menuCategoryId;
  final String menuCategoryImage;
  final String nexturl;
  final List<CategoryDish> categoryDishes;

  TableMenuModel({
    required this.menuCategory,
    required this.menuCategoryId,
    required this.menuCategoryImage,
    required this.nexturl,
    required this.categoryDishes,
  });

  factory TableMenuModel.fromJson(Map<String, dynamic> json) => TableMenuModel(
        menuCategory: json["menu_category"],
        menuCategoryId: json["menu_category_id"],
        menuCategoryImage: json["menu_category_image"],
        nexturl: json["nexturl"],
        categoryDishes: List<CategoryDish>.from(
            json["category_dishes"].map((x) => CategoryDish.fromJson(x))),
      );
}

class AddonCat {
  final String addonCategory;
  final String addonCategoryId;
  final int addonSelection;
  final String nexturl;
  final List<CategoryDish> addons;

  AddonCat({
    required this.addonCategory,
    required this.addonCategoryId,
    required this.addonSelection,
    required this.nexturl,
    required this.addons,
  });

  factory AddonCat.fromJson(Map<String, dynamic> json) => AddonCat(
        addonCategory: json["addon_category"],
        addonCategoryId: json["addon_category_id"],
        addonSelection: json["addon_selection"],
        nexturl: json["nexturl"],
        addons: List<CategoryDish>.from(
            json["addons"].map((x) => CategoryDish.fromJson(x))),
      );
}

class CategoryDish {
  final String dishId;
  final String dishName;
  final double dishPrice;
  final String dishImage;
  final String dishCurrency;
  final double dishCalories;
  final String dishDescription;
  final bool dishAvailability;
  final int dishType;
  final String? nexturl;
  final List<AddonCat>? addonCat;
  int quanity = 0;
  CategoryDish({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishImage,
    required this.dishCurrency,
    required this.dishCalories,
    required this.dishDescription,
    required this.dishAvailability,
    required this.dishType,
    this.nexturl,
    this.addonCat,
  });

  factory CategoryDish.fromJson(Map<String, dynamic> json) => CategoryDish(
        dishId: json["dish_id"],
        dishName: json["dish_name"],
        dishPrice: json["dish_price"]?.toDouble(),
        dishImage: json["dish_image"],
        dishCurrency: json["dish_currency"],
        dishCalories: json["dish_calories"],
        dishDescription: json["dish_description"],
        dishAvailability: json["dish_Availability"],
        dishType: json["dish_Type"],
        nexturl: json["nexturl"],
        addonCat: json["addonCat"] == null
            ? []
            : List<AddonCat>.from(
                json["addonCat"]!.map((x) => AddonCat.fromJson(x))),
      );
}
