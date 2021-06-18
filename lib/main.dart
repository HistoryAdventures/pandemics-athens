import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:history_of_adventures/src/core/theme.dart';
import 'package:history_of_adventures/src/features/map/presentation/pages/map_page.dart';

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
