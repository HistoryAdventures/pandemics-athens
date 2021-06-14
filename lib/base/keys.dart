import 'package:flutter/widgets.dart';

/// This class contains all app specific keys.
/// All Key objects should be created here as static final members.
class AppKeys {
  static final GlobalKey<NavigatorState> navigatorkey =
      GlobalKey<NavigatorState>();
}

class GlobalContext {
  static BuildContext get context =>
      AppKeys.navigatorkey.currentState!.overlay!.context;
}
