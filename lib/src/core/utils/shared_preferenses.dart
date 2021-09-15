import 'package:shared_preferences/shared_preferences.dart';

import '../../features/navigation/presentation/models/leaf_detail_model.dart';

class NavigationSharedPreferences {
  static const keyNavigationList = "navigationList";
  static const keyNavigationCurrentVertex = "navigationCurrentVertex";

  static Future<void> addCurrentVertexToSF(int currentVertex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyNavigationCurrentVertex, currentVertex);
  }

  static Future<int?> getCurrentVertexSF() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? stringValue = prefs.getInt(keyNavigationCurrentVertex);
    return stringValue;
  }

  static Future<void> addListToSF(List<String> navigationList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList(keyNavigationList, navigationList);
  }

  static Future<List<String>?> getListSF() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? stringValue = prefs.getStringList(keyNavigationList);
    return stringValue;
  }

  static void upDateShatedPreferences() {
    final List<String> navigationList =
        LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

    NavigationSharedPreferences.addListToSF(navigationList);
    NavigationSharedPreferences.addCurrentVertexToSF(LeafDetails.currentVertex);
  }

  static Future<void> getNavigationListFromSF() async {
    final List<String>? navigationList =
        await NavigationSharedPreferences.getListSF();
    final navigationCurrentVertex =
        await NavigationSharedPreferences.getCurrentVertexSF();
    if (navigationList != null) {
      final List<int> navigationListInteger =
          navigationList.map((e) => int.parse(e)).toList();
      LeafDetails.currentVertex = navigationCurrentVertex!;
      LeafDetails.visitedVertexes = navigationListInteger;
    }
  }

  static Future<void> clearSF() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
}
