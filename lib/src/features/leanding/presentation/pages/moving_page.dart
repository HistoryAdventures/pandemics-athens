import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:history_of_adventures/src/core/widgets/mouse_movement/mouse_muve.dart';

import 'leanding_page.dart';

class MovingPage extends StatefulWidget {
  const MovingPage({Key? key}) : super(key: key);

  @override
  _MovingPageState createState() => _MovingPageState();
}

class _MovingPageState extends State<MovingPage> {
  late ui.Image image;
  
  bool isImageloaded = false;
  Future<Null> init() async {
    final ByteData data = await rootBundle.load('images/white0000.png');
    image = await loadImage(Uint8List.view(data.buffer));
  }

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      if (mounted) {
        setState(() {
          isImageloaded = true;
        });
      }
      return completer.complete(img);
    });
    return completer.future;
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: isImageloaded == true
                    ? GameWidget(
                        backgroundBuilder: (context) => const LeandingPage(),
                        game: MouseMovementGame(image: image))
                    : const Center(
                        child: Text("Loading"),
                      )),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                color: AppColors.blackB,
                iconSize: 40,
                icon: const Icon(Icons.south),
                onPressed: () {
                  context.router.push(const GlossaryPageRoute());
                },
              ),
            ),
          ],
        );
      }),
      // BlobAnimation(
      //   height: constraints.maxHeight * 0.35,
      //   width: constraints.maxWidth * 0.35,
      // ),
    );
  }
}
