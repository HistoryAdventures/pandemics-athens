import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/widgets/app_up_button.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/features/pandemic_info/presentation/models/animated_particle_model.dart';
import 'package:history_of_adventures/src/features/practice_medicine/presentation/pages/practice_medicine_page.dart';
import 'package:rxdart/rxdart.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/animated_background/animated_particles_2.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class PathogenProfilePage extends StatefulWidget {
  bool? needJumpToPracticeMedicinePart;
  PathogenProfilePage({
    Key? key,
    this.needJumpToPracticeMedicinePart = false,
  }) : super(key: key);

  @override
  _PathogenProfilePageState createState() => _PathogenProfilePageState();
}

class _PathogenProfilePageState extends State<PathogenProfilePage> {
  late AppLocalizations locals;
  Offset offset = const Offset(0, 0);
  late ScrollController _scrollController;
  final ScrollController _textPanelScrollController = ScrollController();
  Color soundAndMewnuColor = AppColors.black100;

  double objWave = 0;
  int direction = 1;
  double mouseX = 100;
  double mouseY = 100;

  late BehaviorSubject<AnimatedParticleModel> animatedParticlesBS;

  @override
  void initState() {
    _scrollController = ScrollController();
    // if (widget.needJumpToPracticeMedicinePart! == true) {
    // } else {
    //   AudioPlayerUtil().playSoundWithLoop(AssetsPath.storyBackgroundSound);
    //   AudioPlayerUtil.audioPlayerLoop.state = PlayerState.PLAYING;
    // }

    _scrollController.addListener(() {
      print("SCROLL LISTENER");
      if (_scrollController.offset ==
              _scrollController.position.maxScrollExtent ||
          widget.needJumpToPracticeMedicinePart!) {
        LeafDetails.currentVertex = 14;
        LeafDetails.visitedVertexes.add(14);
        NavigationSharedPreferences.upDateShatedPreferences();
        soundAndMewnuColor = AppColors.white;
        playSound();
        AudioPlayerUtil.audioPlayerLoop.release();
        setState(() {});
      } else {
        LeafDetails.currentVertex = 10;
        NavigationSharedPreferences.upDateShatedPreferences();
        soundAndMewnuColor = AppColors.black100;
        setState(() {});
        // bgPlayer.dispose();
      }
    });
    NavigationSharedPreferences.getNavigationListFromSF();

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
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animatedParticlesBS.close();
    pauseSound();
    super.dispose();
  }

  AudioPlayer bgPlayer = AudioPlayer();
  Future<void> playSound() async {
    if (AudioPlayerUtil.isSoundOn) {
      if (bgPlayer.state == PlayerState.PAUSED) {
        bgPlayer.resume();
      } else {
        int result = await bgPlayer.play(AssetsPath.nikoCries);
        bgPlayer.setReleaseMode(ReleaseMode.LOOP);
      }
    } else {
      bgPlayer.pause();
    }
  }

  Future<void> pauseSound() async {
    bgPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (widget.needJumpToPracticeMedicinePart!) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        widget.needJumpToPracticeMedicinePart = false;
        playSound();
      }

      // else {
      //   pauseSound();
      // }
    });
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (notification.direction == ScrollDirection.reverse) {}

        if (_scrollController.offset ==
            _scrollController.position.minScrollExtent) {
          AudioPlayerUtil().playSoundWithLoop(AssetsPath.storyBackgroundSound);
          AudioPlayerUtil.audioPlayerLoop.state = PlayerState.PLAYING;
          pauseSound();
        }

        return true;
      },
      child: Scaffold(
        endDrawer: const NavigationPage(),
        body: LayoutBuilder(builder: (context, constraints) {
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

              animatedParticlesBS.sink.add(
                AnimatedParticleModel(x: mouseX, y: mouseY, objWave: objWave),
              );
            },
            child: SizedBox(
              height: constraints.maxHeight * 2,
              child: Stack(
                children: [
                  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ListView(
                      controller: _scrollController,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight,
                          child: Stack(
                            children: [
                              StreamBuilder<AnimatedParticleModel>(
                                stream: animatedParticlesBS.stream,
                                builder: (context, snapshot) {
                                  return AnimatedParticlesSecond(
                                    constraints: constraints,
                                    mouseX: snapshot.data!.x,
                                    mouseY: snapshot.data!.y,
                                    objWave: snapshot.data!.objWave,
                                  );
                                },
                              ),
                              Positioned(
                                  top: HW.getHeight(255, context),
                                  left: HW.getWidth(200, context),
                                  child: Container(
                                    height: HW.getHeight(650, context),
                                    width: HW.getWidth(800, context),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            tileMode: TileMode.mirror,
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: Shadows.pathogenGradiend),
                                        boxShadow: Shadows.universal),
                                    child: Padding(
                                      padding: const EdgeInsets.all(24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: HW.getHeight(68, context),
                                            width: constraints.maxWidth,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Flexible(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: HW.getHeight(
                                                            8, context)),
                                                    child: Text(locals.chapter1,
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            ?.copyWith(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: TextFontSize
                                                                    .getHeight(
                                                                        17,
                                                                        context))),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    locals.pathogenProfile
                                                        .toUpperCase(),
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2
                                                        ?.copyWith(
                                                            fontSize: TextFontSize
                                                                .getHeight(34,
                                                                    context)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                              ),
                                              margin: EdgeInsets.only(
                                                top: HW.getHeight(16, context),
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  top: BorderSide(
                                                      color: Colors.grey,
                                                      width: HW.getHeight(
                                                          0.5, context)),
                                                ),
                                              ),
                                              child: HAScrollbar(
                                                controller:
                                                    _textPanelScrollController,
                                                child: ListView(
                                                    controller:
                                                        _textPanelScrollController,
                                                    shrinkWrap: true,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          right: 24,
                                                          top: HW.getHeight(
                                                              16, context),
                                                        ),
                                                        child: AutoSizeText(
                                                          locals
                                                              .pathogenProfileText,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText2!
                                                                  .copyWith(
                                                                    fontFamily:
                                                                        "OpenSans",
                                                                    height: 1.6,
                                                                    fontSize: HW
                                                                        .getHeight(
                                                                            17,
                                                                            context),
                                                                  ),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: ArrowRightTextWidget(
                                    textSubTitle: locals.whereDidItComeFrom,
                                    textTitle: locals.pathogenProfile,
                                    onTap: () {
                                      AudioPlayerUtil().playSound(
                                          AssetsPath.screenTransitionSound);
                                      LeafDetails.currentVertex = 11;
                                      LeafDetails.visitedVertexes.add(11);
                                      NavigationSharedPreferences
                                          .upDateShatedPreferences();
                                      context.router.replace(
                                          const VirusLocationPageRoute());
                                    }),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    margin: const EdgeInsets.all(24),
                                    child: Image.asset(AssetsPath.scrollIcon)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight,
                          child: const PracticeMedicine(),
                        ),
                      ],
                    ),
                  ),
                  SoundAndMenuWidget(
                    color: soundAndMewnuColor,
                    widget: Visibility(
                      visible: soundAndMewnuColor == AppColors.black100,
                      child: AppUpButton(
                        // iconSize: HW.getHeight(50, context),
                        // icon: const Icon(Icons.arrow_upward_sharp),
                        onTap: () {
                          AudioPlayerUtil.audioPlayerLoop.release();
                          LeafDetails.currentVertex = 9;
                          LeafDetails.visitedVertexes.add(9);

                          NavigationSharedPreferences.upDateShatedPreferences();
                          context.router
                              .replace(const PanaromaRightPageToBottom());
                        },

                        // color: soundAndMewnuColor,
                      ),
                    ),
                    icons: AudioPlayerUtil.isSoundOn
                        ? AssetsPath.iconVolumeOn
                        : AssetsPath.iconVolumeOff,
                    onTapVolume: AudioPlayerUtil.isSoundOn
                        ? () {
                            setState(() {
                              AudioPlayerUtil.isSoundOn =
                                  !AudioPlayerUtil.isSoundOn;
                              AudioPlayerUtil().playSoundWithLoop(
                                  AssetsPath.storyBackgroundSound);
                              playSound();

                              // backgroundplayer.pause();
                            });
                          }
                        : () {
                            setState(() {
                              AudioPlayerUtil.isSoundOn =
                                  !AudioPlayerUtil.isSoundOn;
                              AudioPlayerUtil().playSoundWithLoop(
                                  AssetsPath.storyBackgroundSound);
                              playSound();

                              // backgroundplayer.play();
                            });
                          },
                    onTapMenu: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
