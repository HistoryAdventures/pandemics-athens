import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/animated_background/animated_particles_1.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class LeandingPage extends StatefulWidget {
  bool? navigateFromNavigatorPage;
  LeandingPage({this.navigateFromNavigatorPage});

  @override
  _LeandingPageState createState() => _LeandingPageState();
}

class _LeandingPageState extends State<LeandingPage>
    with SingleTickerProviderStateMixin {
  late AppLocalizations locales;
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  bool isImageloaded = true;
  Offset offset = const Offset(0, 0);
  String loadingCount = '0';

  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;

  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    if (widget.navigateFromNavigatorPage != null) {
      isImageloaded = widget.navigateFromNavigatorPage!;
    } else {
      init();
    }
    super.didChangeDependencies();
  }

  Future<void> init() async {
    setState(() {
      isImageloaded = false;
    });
    for (int i = 0; i < AssetsPath.contentImages.length; i++) {
      await precacheImage(AssetImage(AssetsPath.contentImages[i]), context);

      precacheImage(const AssetImage(AssetsPath.lottieAssetsTube), context);
      precacheImage(const AssetImage(AssetsPath.lottieAssetsCrowd), context);

      setState(() {
        loadingCount = ((i * 100).toDouble() / AssetsPath.contentImages.length)
            .toStringAsFixed(0);
      });
    }

    setState(() {
      isImageloaded = true;
    });
  }

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    LeafDetails.currentVertex = 0;
    NavigationSharedPreferences.addCurrentVertexToSF(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          endDrawer: const NavigationPage(),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return MouseRegion(
                onHover: (e) => setState(() {
                  if (objWave < 50 && direction == 1) {
                    objWave += .2;
                  } else if (objWave == 50 && direction == 1) {
                    direction = 0;
                  } else if (objWave > -50 && direction == 0) {
                    objWave -= .2;
                  } else if (objWave == -50 && direction == 0) {
                    direction = 1;
                  }
                  mouseX = (e.position.dx - width / 2) / 20;
                  mouseY = (e.position.dy - height / 2) / 20;
                  setState(() {});
                }),
                child: Stack(
                  children: [
                    AnimatedParticlesFirst(
                      constraints: constraints,
                      mouseX: mouseX,
                      mouseY: mouseY,
                      objWave: objWave,
                    ),
                    Align(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(constraints.maxWidth * 0.15,
                            0, constraints.maxWidth * 0.1, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Text(
                                          locales.spencerStrikerName
                                              .toUpperCase(),
                                          maxLines: 1,
                                          style: DefaultTheme
                                              .standard.textTheme.headline1
                                              ?.copyWith(
                                                  fontSize:
                                                      TextFontSize.getHeight(
                                                          24, context)))),
                                  Flexible(
                                    child: AutoSizeText(
                                      locales.historyAdventures.toUpperCase(),
                                      maxLines: 1,
                                      style:
                                          Theme.of(context).textTheme.overline,
                                    ),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      locales.worldOfCharacters.toUpperCase(),
                                      maxLines: 1,
                                      maxFontSize: 100,
                                      style: Theme.of(context)
                                          .textTheme
                                          .overline
                                          ?.copyWith(fontSize: 100),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  color: AppColors.red,
                                                  width: 10))),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: AutoSizeText(
                                          locales.globalPandemicsName,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                        color: AppColors.blackB,
                        iconSize: 40,
                        icon: const Icon(Icons.south),
                        onPressed: () async {
                          LeafDetails.visitedVertexes.add(1);
                          LeafDetails.currentVertex = 1;
                          // print(LeafDetails.visitedVertexes);
                          NavigationSharedPreferences.upDateShatedPreferences();
                          context.router.push(const GlossaryPageRoute());
                        },
                      ),
                    ),
                    SoundAndMenuWidget(
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
                ),
              );
            },
          ),
        ),
        if (isImageloaded == false)
          LoadingWidget(
            loadingCound: loadingCount,
          ),
      ],
    );
  }
}
