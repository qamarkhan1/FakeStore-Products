import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/products/products.dart';

class SharedPrefService {
  static late final SharedPreferences? prefs;

  static initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveList(List<Product> objects) async {
    final encodedList = objects.map((obj) => jsonEncode(obj.toJson())).toList();
    await prefs?.setStringList('my_object_list', encodedList);
  }

  Future<List<Product>> loadList() async {
    final encodedList = prefs?.getStringList('my_object_list') ?? [];
    final decodedList =
        encodedList.map((json) => Product.fromJson(jsonDecode(json)));
    return decodedList.toList();
  }
}
