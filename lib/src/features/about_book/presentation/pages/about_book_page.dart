import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class AboutBookPage extends StatefulWidget {
  const AboutBookPage({Key? key}) : super(key: key);

  @override
  _AboutBookPageState createState() => _AboutBookPageState();
}

class _AboutBookPageState extends State<AboutBookPage> {
  late AppLocalizations locale;

  final backgroundplayer = AudioPlayer();
  bool isSoundOn = false;

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.charactersBackgroundImage),
              fit: BoxFit.cover),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: constraints.maxHeight * 0.15,
                    margin: EdgeInsets.only(top: constraints.maxHeight * 0.2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            locale.aboutTheBook.toUpperCase(),
                            maxLines: 1,
                            style: DefaultTheme.standard.textTheme.headline2,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: constraints.maxWidth * 0.01),
                            child: AutoSizeText(
                              locale.meetTheTeamText.toLowerCase(),
                              maxLines: 1,
                              style: DefaultTheme.standard.textTheme.subtitle2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: constraints.maxHeight * 0.2,
                    ),
                    width: constraints.maxWidth * 0.9,
                    height: constraints.maxHeight * 0.5,
                    child: Image.asset(
                      AssetsPath.aboutBookMap,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 24, right: 24),
                    child: ArrowRightTextWidget(
                        textSubTitle: locale.credits,
                        textTitle: locale.aboutTheBook,
                        onTap: () {
                          LeafDetails.currentVertex = 20;
                          LeafDetails.visitedVertexes.add(20);
                          context.router.push(const CreditsPageRoute());
                        }),
                  ),
                ),
                SoundAndMenuWidget(
                  widget: IconButton(
                      onPressed: () {
                        LeafDetails.currentVertex = 18;
                        if (kIsWeb) {
                          html.window.history.back();
                          context.router.pop();
                        } else {
                          context.router.pop();
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_upward_sharp,
                        //size: 40,
                        color: AppColors.blackB,
                      )),
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
              ],
            );
          },
        ),
      ),
    );
  }
}
