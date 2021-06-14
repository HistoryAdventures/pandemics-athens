import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/character/presentation/pages/characters_page.dart';
import 'package:history_of_adventures/src/features/leanding/presentation/pages/leanding_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: CharacrterPage());
  }
}
