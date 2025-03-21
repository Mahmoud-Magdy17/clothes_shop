import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

//! Here The Initialize of cache .
  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
//! Save Map<String, dynamic> as a JSON string
  Future<bool> saveMap( {
    required String key,
    required Map<String, dynamic> value,
  }) async {
    String jsonString = jsonEncode(value); // Convert map to JSON string
    return await sharedPreferences.setString(key, jsonString);
  }

  //! Retrieve Map<String, dynamic> from a saved JSON string
  Map<String, dynamic>? getMap({required String key}) {
    String? jsonString = sharedPreferences.getString(key); // Retrieve JSON string
    if (jsonString != null) {
      return jsonDecode(jsonString); // Convert JSON string back to Map
    }
    return null; // Return null if key doesn't exist
  }
  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

//! this method to put data in local database using key

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }

    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

//! this method to get data already saved in local database

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

//! remove data using specific key

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

//! this method to check if local database contains {key}
  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  Future<bool> clearData({required String key}) async {
    return sharedPreferences.clear();
  }

//! this fun to put data in local data base using key
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }
}
