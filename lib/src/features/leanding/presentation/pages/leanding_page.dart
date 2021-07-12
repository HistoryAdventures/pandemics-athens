import 'dart:async';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/background_widget.dart';

import '../../../../core/colors.dart';
import '../../../../core/theme.dart';

class LeandingPage extends StatefulWidget {
  const LeandingPage({Key? key}) : super(key: key);

  @override
  _LeandingPageState createState() => _LeandingPageState();
}

class _LeandingPageState extends State<LeandingPage>
    with SingleTickerProviderStateMixin {
  late AppLocalizations locales;
  ImageProvider? image;
  bool isImageloaded = false;
  late AnimationController controller;
  Offset offset = Offset(0, 0);

  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  Future<Null> init() async {
    final ByteData data = await rootBundle.load('images/white0000.png');
    image = MemoryImage(Uint8List.view(data.buffer));
    setState(() {});
  }

  // Future<ui.Image> loadImage(Uint8List img) async {
  //   final Completer<ui.Image> completer = Completer();
  //   ui.decodeImageFromList(img, (ui.Image img) {
  //     setState(() {
  //       isImageloaded = true;
  //     });
  //     return completer.complete(img);
  //   });
  //   return completer.future;
  // }

  @override
  void initState() {
    init();
    super.initState();
    controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (image == null) {
          return const Center(
            child: Text('Loading'),
          );
        }
        return MouseRegion(
          onHover: (e) => setState(() => offset = e.position),
          child: Stack(
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
                                  style: DefaultTheme
                                      .standard.textTheme.headline1)),
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
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: constraints.maxHeight * 0.35,
                  width: constraints.maxWidth * 0.35,
                  child: Transform.rotate(
                    angle: -offset.direction,
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: image!),
                      ),
                    ),
                  ),
                ),
                //   // BlobAnimation(
                //   //   height: constraints.maxHeight * 0.35,
                //   //   width: constraints.maxWidth * 0.35,
                //   // ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
