import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/background_widget.dart';
import 'package:history_of_adventures/src/core/widgets/mouse_movement/mouse_muve.dart';
import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/widgets/animated_widgets/blob_animation.dart';

import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

class LeandingPage extends StatefulWidget {
  const LeandingPage({Key? key}) : super(key: key);

  @override
  _LeandingPageState createState() => _LeandingPageState();
}

class _LeandingPageState extends State<LeandingPage> {
  late AppLocalizations locales;
  late ui.Image image;
  bool isImageloaded = false;
  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  Future<Null> init() async {
    final ByteData data = await rootBundle.load('images/white0000.png');
    image = await loadImage(Uint8List.view(data.buffer));
  }

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded = true;
      });
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
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            const BackgroundWidget(),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: AutoSizeText(locales.spencerStrikerName,
                                style:
                                    DefaultTheme.standard.textTheme.headline1)),
                        Flexible(
                          child: AutoSizeText(
                            locales.historyAdventures.toUpperCase(),
                            style: Theme.of(context).textTheme.overline,
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            locales.worldOfCharacters.toUpperCase(),
                            style: Theme.of(context).textTheme.overline,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: AppColors.red, width: 8))),
                            child: AutoSizeText(
                              locales.globalPandemicName,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
            Positioned(
              top: 60,
              right: 60,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 45,
                ),
                onPressed: () {},
              ),
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //       height: constraints.maxHeight * 0.35,
            //       width: constraints.maxWidth * 0.35,
            //       child: isImageloaded == true
            //           ? GameWidget(
            //               backgroundBuilder: (context) => Container(
            //                   decoration:
            //                       BoxDecoration(color: Colors.transparent)),
            //               game: MouseMovementGame(image: image))
            //           : Center(
            //               child: Text("Loading"),
            //             )),
            //   // BlobAnimation(
            //   //   height: constraints.maxHeight * 0.35,
            //   //   width: constraints.maxWidth * 0.35,
            //   // ),
            // ),
          ],
        );
      },
    ));
  }
}
