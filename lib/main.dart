// import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'src/core/router.gr.dart';
import 'src/core/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  bool deviceIsMobile = false;

  @override
  Widget build(BuildContext context) {
    if ((defaultTargetPlatform == TargetPlatform.iOS) ||
        (defaultTargetPlatform == TargetPlatform.android)) {
      print('android.ios');
      deviceIsMobile = true;
    } else if ((defaultTargetPlatform == TargetPlatform.linux) ||
        (defaultTargetPlatform == TargetPlatform.macOS) ||
        (defaultTargetPlatform == TargetPlatform.windows)) {
      print('desctop /////');
      deviceIsMobile = false;
    } else {
      // Some web specific code there
      print(' other ');
      deviceIsMobile = false;
    }
    return deviceIsMobile
        ? const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("MOBILE"),
              ),
            ),
          )
        : MaterialApp.router(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            theme: DefaultTheme.standard,
            debugShowCheckedModeBanner: false,
          );
  }
}
