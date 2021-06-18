import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/theme.dart';
import 'package:history_of_adventures/src/features/map/presentation/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: DefaultTheme.standard,
        home: const MapPage());
  }
}
