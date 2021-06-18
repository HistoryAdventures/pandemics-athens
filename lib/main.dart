import 'package:flutter/material.dart';
import 'package:history_of_adventures/router.gr.dart';
import 'src/core/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _appRouter = FlutterRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: DefaultTheme.standard,
      debugShowCheckedModeBanner: false,
    );
  }
}
