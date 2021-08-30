import 'package:shared_preferences/shared_preferences.dart';

class UserSecureStorage {
  static const keyEmail = "userEmail";
  static const keyPassword = "userPassword";

  static Future<void> addStringToSF() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', "abc");
  }

  static Future<String?> getStringValuesSF() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? stringValue = prefs.getString('stringValue');
    return stringValue;
  }
}
