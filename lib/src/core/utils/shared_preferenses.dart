import 'package:shared_preferences/shared_preferences.dart';

class NavigationSharedPreferences {
  static const keyNavigationList = "userEmail";

  static Future<void> addListToSF(List<String> navigationList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyNavigationList, navigationList);
  }

  static Future<List<String>?> getListSF() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? stringValue = prefs.getStringList(keyNavigationList);
    return stringValue;
  }
}
