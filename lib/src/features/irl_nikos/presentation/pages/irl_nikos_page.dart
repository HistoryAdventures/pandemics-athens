import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class IrlNikosPage extends StatefulWidget {
  const IrlNikosPage({Key? key}) : super(key: key);

  @override
  _IrlNikosPageState createState() => _IrlNikosPageState();
}

class _IrlNikosPageState extends State<IrlNikosPage> {
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  late AppLocalizations locals;

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            SizedBox.expand(
                child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Image.asset(
                    AssetsPath.irlNikos,
                    fit: BoxFit.cover,
                  )),
            )),
            SoundAndMenuWidget(
              widget: Clickable(
                onPressed: () {
                  LeafDetails.currentVertex = 17;
                  if (kIsWeb) {
                    html.window.history.back();
                    context.router.pop();
                  } else {
                    context.router.pop();
                  }
                },
                child: const Icon(
                  Icons.arrow_upward_sharp,
                  size: 40,
                  color: AppColors.blackB,
                ),
              ),
              icons: isSoundOn ? Icons.volume_up : Icons.volume_mute,
              onTapVolume: isSoundOn
                  ? () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                        backgroundplayer.pause();
                      });
                    }
                  : () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                        backgroundplayer.play();
                      });
                    },
              onTapMenu: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: constraints.maxWidth * 0.2,
                padding: EdgeInsets.only(left: constraints.maxWidth * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      locals.irlNikos.toUpperCase(),
                      maxLines: 1,
                      minFontSize: 8,
                      style: Theme.of(context).textTheme.overline,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: AppColors.orange, width: 10))),
                      child: AutoSizeText(
                        ' ${locals.nikos.toLowerCase()}',
                        maxLines: 1,
                        minFontSize: 8,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 24, bottom: 24),
                child: ArrowRightTextWidget(
                  onTap: () {},
                  textSubTitle: locals.giana,
                  textTitle: locals.giana,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                padding: const EdgeInsets.only(bottom: 24),
                color: AppColors.blackB,
                iconSize: 40,
                icon: const Icon(Icons.arrow_downward),
                onPressed: () {
                  LeafDetails.currentVertex = 19;
                  LeafDetails.visitedVertexes.add(19);
                  context.router.push(const AboutBookPageRoute());
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
