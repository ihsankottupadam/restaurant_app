import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:restaurant_app/app/data/models/table_menu_model.dart';

class CategoryService {
  Future<List<TableMenuModel>> getMenus() async {
    try {
      final response =
          await Dio().get('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad');
      if (response.statusCode == 200) {
        return tableMenuModelFromJson(response.data[0]["table_menu_list"]);
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      log(e.toString());
      throw 'Something went wrong';
    }
  }
}
