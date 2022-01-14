import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/shared_preferances_managment.dart';
import 'src/core/router.gr.dart';
import 'src/core/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferancesManagment().init();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = FlutterRouter();
  bool deviceIsMobileForWeb = false;

  bool checkTargetPlatform() {
    if (kIsWeb) {
      if ((defaultTargetPlatform == TargetPlatform.iOS) ||
          (defaultTargetPlatform == TargetPlatform.android)) {
        deviceIsMobileForWeb = true;
      } else if ((defaultTargetPlatform == TargetPlatform.linux) ||
          (defaultTargetPlatform == TargetPlatform.macOS) ||
          (defaultTargetPlatform == TargetPlatform.windows)) {
        deviceIsMobileForWeb = false;
      } else {
        // Some web specific code there
        deviceIsMobileForWeb = false;
      }
    }
    return deviceIsMobileForWeb;
  }

  @override
  Widget build(BuildContext context) {
    return checkTargetPlatform()
        ? const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("OPEN IN MOBILE BROWSER"),
              ),
            ),
          )
        : MaterialApp.router(
            title: "History Adventures - Global Pandemics",
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            theme: DefaultTheme.standard,
            debugShowCheckedModeBanner: false,
          );
  }
}
