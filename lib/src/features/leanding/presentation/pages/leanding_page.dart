import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/services.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/models/animated_particle_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';

import 'package:universal_html/html.dart';

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

class _LeandingPageState extends State<LeandingPage> {
  late AppLocalizations locales;
  bool isImageloaded = true;
  Offset offset = const Offset(0, 0);
  String? loadingCount = '0';

  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;

  late BehaviorSubject<AnimatedParticleModel> animatedParticlesBS;

  // PlayerState audioPlayerState = PlayerState.PAUSED;

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    LeafDetails.currentVertex = 0;
    NavigationSharedPreferences.addCurrentVertexToSF(0);

    animatedParticlesBS = BehaviorSubject<AnimatedParticleModel>.seeded(
      AnimatedParticleModel(
        x: mouseX,
        y: mouseY,
        objWave: objWave,
      ),
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    if (widget.navigateFromNavigatorPage != null) {
      print(widget.navigateFromNavigatorPage);
      print("-----");
      AudioPlayerUtil().playLeandingPageSound(AssetsPath.leandingBgSound);
      AudioPlayerUtil.audioPlayerLoopLeanding.setVolume(1.0);
    } else if (loadingCount == '0') {
      precacheImages();
    }
    firebaseScreenTracking();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animatedParticlesBS.close();
    // leandingBgSound.dispose();
    super.dispose();
  }

  Future<void> firebaseScreenTracking() async {
    // await FirebaseAnalytics.instance.setCurrentScreen(screenName: '/glossary-pageeeee');
    await FirebaseAnalytics.instance.logEvent(name: "home", parameters: {
      "page_url": "https://pandemics.historyadventures.app/home"
    });
    await FirebaseAnalytics.instance.logScreenView(screenName: "home");
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
                onHover: (e) {
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

                  animatedParticlesBS.sink.add(AnimatedParticleModel(
                    x: mouseX,
                    y: mouseY,
                    objWave: objWave,
                  ));
                },
                child: Stack(
                  children: [
                    StreamBuilder<AnimatedParticleModel>(
                      stream: animatedParticlesBS.stream,
                      builder: (context, snapshot) {
                        return AnimatedParticlesFirst(
                          constraints: constraints,
                          mouseX: snapshot.data!.x,
                          mouseY: snapshot.data!.y,
                          objWave: snapshot.data!.objWave,
                        );
                      },
                    ),
                    Positioned(
                      top: HW.getHeight(354, context),
                      left: HW.getWidth(275, context),
                      child: SizedBox(
                        height: HW.getHeight(400, context),
                        width: HW.getWidth(789, context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              locales.spencerStrikerName.toUpperCase(),
                              maxLines: 1,
                              style: DefaultTheme.standard.textTheme.headline1
                                  ?.copyWith(
                                fontSize: TextFontSize.getHeight(24, context),
                              ),
                            ),
                            Text(
                              locales.historyAdventures.toUpperCase(),
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(
                                      fontSize:
                                          TextFontSize.getHeight(120, context),
                                      height: 1),
                            ),
                            Text(
                              locales.globalPandemicsName.toUpperCase(),
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .overline
                                  ?.copyWith(
                                      fontSize:
                                          TextFontSize.getHeight(100, context),
                                      height: 1),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: AppColors.red,
                                    width: 10,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "  Plague of Athens",
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      ?.copyWith(
                                        fontSize:
                                            TextFontSize.getHeight(60, context),
                                        height: 1,
                                      ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButtonWidget(
                        color: AppColors.blackB,
                        iconSize: HW.getHeight(37, context),
                        icon: const Icon(Icons.arrow_downward),
                        onPressed: () {
                          LeafDetails.visitedVertexes.add(1);
                          LeafDetails.currentVertex = 1;
                          // print(LeafDetails.visitedVertexes);
                          NavigationSharedPreferences.upDateShatedPreferences();
                          turnMiddle(AudioPlayerUtil.audioPlayerLoopLeanding);
                          // AudioPlayerUtil().leandingBgSound.setVolume(0.5);
                          context.router.push(const GlossaryPageRoute());
                        },
                      ),
                    ),
                    SoundAndMenuWidget(
                      icons: AudioPlayerUtil.isSoundOn
                          ? AssetsPath.iconVolumeOn
                          : AssetsPath.iconVolumeOff,
                      onTapVolume: () {
                        setState(() {
                          AudioPlayerUtil.isSoundOn =
                              !AudioPlayerUtil.isSoundOn;
                          AudioPlayerUtil().soundPlayingControll(
                              isSoundOn: AudioPlayerUtil.isSoundOn,
                              routeName: 'Leanding');
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
        if (ShowLoadingSharedPreferences.userClickedOnLeandingPage == false &&
            widget.navigateFromNavigatorPage == null)
          AbsorbPointer(
            absorbing: loadingCount != "99",
            child: Clickable(
              onPressed: () {
                setState(() {
                  ShowLoadingSharedPreferences.userClickedOnLeandingPage = true;
                  AudioPlayerUtil()
                      .playLeandingPageSound(AssetsPath.leandingBgSound);
                  AudioPlayerUtil.audioPlayerLoopLeanding.state =
                      PlayerState.PLAYING;
                });
              },
              child: LoadingWidget(loadingCound: loadingCount),
            ),
          )
      ],
    );
  }

  Future<void> precacheImages() async {
    print(widget.navigateFromNavigatorPage);
    print("  +++++");
    if (window.sessionStorage.containsKey('allImagesAreCached')) {
      setState(() {
        if (widget.navigateFromNavigatorPage == null) {
          showLoading(refreshedPage: true);
        } else {
          ShowLoadingSharedPreferences.userClickedOnLeandingPage = true;
          AudioPlayerUtil().playLeandingPageSound(AssetsPath.leandingBgSound);
          AudioPlayerUtil.audioPlayerLoopLeanding.state = PlayerState.PLAYING;
        }

        // playSound();
      });

      return;
    }

    showLoading(refreshedPage: false);
  }

  Future<void> showLoading({bool? refreshedPage}) async {
    setState(() {
      isImageloaded = false;
    });

    for (int i = 0; i < AssetsPath.allImages.length; i++) {
      await precacheImage(AssetImage(AssetsPath.allImages[i]), context);

      setState(() {
        loadingCount = refreshedPage!
            ? ((i * 100).toDouble() / AssetsPath.allImages.length)
                .toStringAsFixed(0)
            : ((i * 100).toDouble() / AssetsPath.allImages.length)
                .toStringAsFixed(0);
      });
    }

    rootBundle.loadString(AssetsPath.paralaxHtml);

    window.sessionStorage.putIfAbsent('allImagesAreCached', () => 'true');

    setState(() {
      isImageloaded = true;
      // playSound();
    });
  }

  Future<void> turnMiddle(AudioPlayer player) async {
    if (!AudioPlayerUtil.isSoundOn) {
      player.setVolume(0);
    } else {
      await player.setVolume(0.9);
      await Future.delayed(const Duration(milliseconds: 500));
      await player.setVolume(0.7);
      await Future.delayed(const Duration(milliseconds: 500));
      await player.setVolume(0.5);
    }
  }
}
