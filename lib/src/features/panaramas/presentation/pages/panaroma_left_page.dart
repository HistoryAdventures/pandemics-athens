import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/packages/panorama-0.4.1/lib/panorama.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/parallax_backgroud_sound.dart';
import 'package:history_of_adventures/src/features/panaramas/presentation/widgets/panarama_panel.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../models/dialog_model.dart';

class PanaromaLeftPage extends StatefulWidget {
  @override
  _PanaromaLeftPageState createState() => _PanaromaLeftPageState();
}

class _PanaromaLeftPageState extends State<PanaromaLeftPage> {
  late AppLocalizations locals;
  late List<dynamic> infoListHotspots;
  late List<InfoDialogModel> infoList;
  List<String> contentImages = [
    AssetsPath.panaramaBackgroundImageLeft,
    AssetsPath.panaramaImage6,
    AssetsPath.panaramaImage7,
    AssetsPath.panaramaImage8,
    AssetsPath.panaramaImage9,
    AssetsPath.panaramaImage10,
    AssetsPath.document
  ];

  bool isImageloaded = false;
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool panelVisibility = true;

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    infoListHotspots = [
      InfoDialogModel(
        imageDescription:
            "${locals.hippocratesImageText} this is some dummy text to test scroll if text is logn",
        description: locals.hippocratesText,
        title: locals.hippocrates,
        subTitle: locals.hippocrates,
        image: AssetsPath.panaramaImage10,
        latitude: 20.0,
        longitude: 120.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.asclepiusTextImage,
        description: locals.asclepiusText,
        title: locals.asclepius,
        subTitle: 'Legacy - Galen, the Romans, and the Renaissance',
        image: AssetsPath.panaramaImage9,
        latitude: -20.0,
        longitude: 160.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.asklepionImageText,
        description: locals.asklepionText,
        title: locals.asklepion,
        subTitle: locals.asklepion,
        image: AssetsPath.panaramaImage8,
        latitude: 10.0,
        longitude: 15.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.fourHumorsImageText,
        description: locals.fourHumorsText,
        title: locals.fourHumours,
        subTitle: locals.fourHumours,
        image: AssetsPath.panaramaImage7,
        latitude: -45.0,
        longitude: 15.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.legasyImageText,
        description: locals.legacyText,
        title: locals.legacy,
        subTitle: locals.legacy,
        image: AssetsPath.panaramaImage6,
        latitude: -10.0,
        longitude: 60.0,
        width: 90,
        height: 75,
      ),
      locals.panaromaLeftInfoDialogText,
    ];
    infoList = [
      InfoDialogModel(
        imageDescription: locals.hippocratesImageText,
        description: locals.hippocratesText,
        title: locals.hippocrates,
        subTitle: locals.hippocrates,
        image: AssetsPath.panaramaImage10,
        latitude: 20.0,
        longitude: 120.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.asclepiusTextImage,
        description: locals.asclepiusText,
        title: locals.asclepius,
        subTitle: 'Legacy - Galen, the Romans, and the Renaissance',
        image: AssetsPath.panaramaImage9,
        latitude: -20.0,
        longitude: 160.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.asklepionImageText,
        description: locals.asklepionText,
        title: locals.asklepion,
        subTitle: locals.asklepion,
        image: AssetsPath.panaramaImage8,
        latitude: 10.0,
        longitude: 15.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.fourHumorsImageText,
        description: locals.fourHumorsText,
        title: locals.fourHumours,
        subTitle: locals.fourHumours,
        image: AssetsPath.panaramaImage7,
        latitude: -45.0,
        longitude: 15.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.legasyImageText,
        description: locals.legacyText,
        title: locals.legacy,
        subTitle: locals.legacy,
        image: AssetsPath.panaramaImage6,
        latitude: -10.0,
        longitude: 60.0,
        width: 90,
        height: 75,
      ),
    ];
    super.didChangeDependencies();
  }

  bool onButtonInfoPressed = false;
  dynamic backgroundSound;
  dynamic openInfoSoundFirst;
  int infoListIndex = 0;

  AudioPlayer bgPlayer = AudioPlayer();

  Future<void> playSound() async {
    if (AudioPlayerUtil.isSoundOn) {
      if (bgPlayer.state == PlayerState.PAUSED) {
        bgPlayer.resume();
      } else {
        int result = await bgPlayer.play(AssetsPath.panaramaLeftSound);
        bgPlayer.setReleaseMode(ReleaseMode.LOOP);
      }
    } else {
      bgPlayer.pause();
    }
  }

  void onChangeView() {
    setState(() {
      panelVisibility = false;
    });
    Future.delayed(const Duration(milliseconds: 1)).then((value) {
      setState(() {
        panelVisibility = true;
      });
    });
  }

  @override
  void initState() {
    // init();
    playSound();

    BackgroundSound(
      assetName: AssetsPath.parallaxBgSound,
      pageName: 'panorama_left',
    );

    BackgroundSound.doAction(
      PlayerAction.play,
    );

    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  void dispose() {
    bgPlayer.dispose();

    print('dispose + panorama_left');

    BackgroundSound.doAction(
      PlayerAction.pause,
      pageName: 'panorama_left',
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Panorama(
          deformHotspots: false,
          onViewChanged: (a, b, c) {
            onChangeView();
          },
          hotspots: infoListHotspots.map((info) {
            if (info is InfoDialogModel) {
              return Hotspot(
                height: info.height,
                width: info.width,
                latitude: info.latitude,
                longitude: info.longitude,
                widget: hotspotButton(
                    icon: const AnimatedPulse(
                      pulseDuration: Duration(seconds: 3),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        // openInfoPlayer.play();
                        //print("object");
                      });

                      showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation,
                              Widget child) {
                            return LayoutBuilder(
                                builder: (context, constraints) =>
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 3, sigmaY: 3),
                                      child: DialogWidget(
                                        titleText: locals.chapter1,
                                        subTitleText:
                                            locals.medicalToolsKnowledge,
                                        animation: animation,
                                        slectedInfoDialog: info,
                                        constraints: constraints,
                                        listDialogInfo: infoList,
                                      ),
                                    ));
                          },
                          transitionDuration: Times.fast,
                          barrierDismissible: true,
                          barrierLabel: '',
                          pageBuilder: (context, animation1, animation2) {
                            return Container();
                          });
                    }),
              );
            } else {
              return Hotspot(
                  width: HW.getWidth(772, context),
                  height: HW.getHeight(384, context),
                  latitude: 0,
                  longitude: -30,
                  widget: PanelWidget(text: info as String));
            }
          }).toList(),
          child: Image.asset(AssetsPath.panaramaBackgroundImageLeft),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ArrowLeftTextWidget(
              color: AppColors.white,
              textSubTitle: locals.sourceAnalysis,
              textTitle: locals.medicalToolsKnowledge,
              onTap: () {
                AudioPlayerUtil().playSound(AssetsPath.screenTransitionSound);
                LeafDetails.visitedVertexes.add(3);
                LeafDetails.currentVertex = 3;
                NavigationSharedPreferences.upDateShatedPreferences();
                context.router.replace(const DocumentPageRoute());
              }),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ArrowRightTextWidget(
              color: AppColors.white,
              textSubTitle: locals.todoNoHarm,
              textTitle: locals.chapter1,
              onTap: () {
                AudioPlayerUtil().playSound(AssetsPath.screenTransitionSound);
                LeafDetails.currentVertex = 2;
                LeafDetails.visitedVertexes.add(2);
                NavigationSharedPreferences.upDateShatedPreferences();
                context.router.replace(ParalaxHistoryPageToLeft(
                  mustScrollToEnd: true,
                ));
              }),
        ),
        SoundAndMenuWidget(
          color: AppColors.white,
          icons: AudioPlayerUtil.isSoundOn
              ? AssetsPath.iconVolumeOn
              : AssetsPath.iconVolumeOff,
          onTapVolume: AudioPlayerUtil.isSoundOn
              ? () {
                  BackgroundSound.doAction(PlayerAction.mute);
                  setState(() {
                    AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                    playSound();
                    // backgroundplayer.pause();
                  });
                }
              : () {
                  BackgroundSound.doAction(PlayerAction.unmute);
                  setState(() {
                    AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                    bgPlayer.state = PlayerState.PAUSED;
                    playSound();
                    // backgroundplayer.play();
                  });
                },
          onTapMenu: () {
            scaffoldkey.currentState!.openEndDrawer();
          },
        ),
      ],
    );
  }

  Widget hotspotButton(
      {String? text, required Widget icon, required Function onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Clickable(
          onPressed: () {
            onPressed();
          },
          child: icon,
        ),
        if (text != null)
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: const BoxDecoration(
                //color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(child: Text(text)),
          )
        else
          Container(),
      ],
    );
  }
}
