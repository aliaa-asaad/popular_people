import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedKeys {
  String isLogin = "IS_LOGIN";
  String popularPeople = "POPULAR_PEOPLE";
  String imageBaseUrl = "IMAGE_BASE_URL";
  String user = "USER";
  String token = "TOKEN";
  String rememberMe = "REMEMBER_ME";
  String lang = "LANG";
  String theme = "THEME";
  String isNotFirstTime = "Is_NOT_FIRST_TIME";
  String driver = 'DRIVER';
  String userType = "USER_TYPE";
}

enum ValueType { int, string, bool, double, map }

class SharedHandler {
  /* static SharedHandler? instance; */
  final SharedPreferences sharedPreferences;

  SharedHandler({required this.sharedPreferences});

  Future<void> setData(String key, {dynamic value}) async {
    if (value is String) {
      sharedPreferences.setString(key, value);
    } else if (value is bool) {
      sharedPreferences.setBool(key, value);
    } else if (value is int) {
      sharedPreferences.setInt(key, value);
    } else if (value is double) {
      sharedPreferences.setDouble(key, value);
    } else if (value is Map) {
      String json = jsonEncode(value);
      sharedPreferences.setString(key, json);
    } else {
      throw TypeError();
    }
  }

  dynamic getData({required String key, required ValueType valueType}) {
    switch (valueType) {
      case ValueType.string:
        return sharedPreferences.getString(key) ?? "";
      case ValueType.int:
        return sharedPreferences.getInt(key) ?? 0;
      case ValueType.double:
        return sharedPreferences.getDouble(key) ?? 0.0;
      case ValueType.bool:
        return sharedPreferences.getBool(key) ?? false;
      case ValueType.map:
        String? value = sharedPreferences.getString(key);
        Map<String, dynamic> data = value != null ? jsonDecode(value) : {};
        return data;
      default:
        return "";
    }
  }

  void clear({required List<String> keys}) {
    for (String key in keys) {
      sharedPreferences.remove(key);
    }
  }
}
//SharedHandler.instance!.getData(key: SharedKeys().user , valueType: ValueType.map)
