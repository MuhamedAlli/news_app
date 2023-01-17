import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String KEY_PREFS_IS_Dark_Mode = "KEY_PREFS_IS_Dark_Mode";

class AppPreferences {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setDarkMode(String val) async {
    return await sharedPreferences.setString(KEY_PREFS_IS_Dark_Mode, val);
  }

  static String? isDarkMode() {
    //print(sharedPreferences.getString(KEY_PREFS_IS_Dark_Mode));
    return sharedPreferences.getString(KEY_PREFS_IS_Dark_Mode);
  }
}
