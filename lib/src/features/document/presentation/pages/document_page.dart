import 'package:flutter/material.dart';

import '../../../../core/utils/assets_path.dart';
import '../widgets/scrapboard.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Scrapboard<String>(
              child: Image.asset(AssetsPath.mapImage),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
