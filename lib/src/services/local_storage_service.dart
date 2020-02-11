import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taclia_app/src/models/user.dart';

class LocalStorageService {
  static const String UserKey = 'user';
  static LocalStorageService _instance;
  static SharedPreferences _preferences;
  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }
  User  getUser() {
    var userJson = getFromDisk(UserKey);
    if (userJson == null) {
      return null;
    }
    return User.fromJson(json.decode(userJson));
  }
  setUser(User userToSave) {
    saveStringToDisk(UserKey, json.encode(userToSave.toJson()));
  }

  dynamic getFromDisk(String key) {
    var value  = _preferences.get(key);
    return value;
  }
  void saveStringToDisk(String key, String content){
    _preferences.setString(key, content);
  }
}