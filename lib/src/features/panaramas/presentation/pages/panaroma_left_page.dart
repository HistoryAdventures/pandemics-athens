import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/packages/panorama-0.4.1/lib/panorama.dart';
import 'package:history_of_adventures/src/features/panaramas/presentation/widgets/panarama_panel.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:panorama/panorama.dart';

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

  //   Visibility(
  //   visible: panelVisibility,
  //   child: Positioned(
  //     top: HW.getHeight(348, context),
  //     left: HW.getWidth(180, context),
  //     child: Container(
  //         color: AppColors.blackG.withOpacity(0.75),
  //         width: HW.getWidth(772, context),
  //         height: HW.getHeight(384, context),
  //         child: Padding(
  //             padding: const EdgeInsets.all(14),
  //             child: ListView(
  //               padding: const EdgeInsets.all(14),
  //               children: [
  //                 Text(
  //                   locals.panaromaLeftInfoDialogText,
  //                   strutStyle: const StrutStyle(
  //                     fontSize: 16.0,
  //                     height: 2,
  //                   ),
  //                   style: Theme.of(context)
  //                       .textTheme
  //                       .bodyText2
  //                       ?.copyWith(color: AppColors.white),
  //                 )
  //               ],
  //             ))),
  //   ),
  // ),

  //         Visibility(
  //   visible: panelVisibility,
  //   child: Positioned(
  //     top: HW.getHeight(335, context),
  //     left: HW.getWidth(180, context),
  //     child: Container(
  //         color: AppColors.blackG.withOpacity(0.75),
  //         width: HW.getWidth(772, context),
  //         height: HW.getHeight(410, context),
  //         child: Padding(
  //             padding: const EdgeInsets.all(14),
  //             child: ListView(
  //               padding: const EdgeInsets.all(14),
  //               children: [
  //                 Text(
  //                   locals.panaromaRightInfoDialogText,
  //                   strutStyle: const StrutStyle(
  //                     fontSize: 16.0,
  //                     height: 2,
  //                   ),
  //                   style: Theme.of(context)
  //                       .textTheme
  //                       .bodyText2
  //                       ?.copyWith(color: AppColors.white),
  //                 )
  //               ],
  //             ))),
  //   ),
  // ),

  bool onButtonInfoPressed = false;
  bool isSoundOn = false;
  //final backgroundplayer = AudioPlayer();
  //final openInfoPlayer = AudioPlayer();
  dynamic backgroundSound;
  dynamic openInfoSoundFirst;
  int infoListIndex = 0;

  // Future<void> init() async {
  //   final loadedAssets = await loadContent(contentImages);
  //   if (loadedAssets == true) {
  //     setState(() {
  //       isImageloaded = true;
  //       isSoundOn = true;
  //       //backgroundplayer.play();
  //     });
  //   } else {
  //     setState(() {
  //       isSoundOn = false;
  //       isImageloaded = false;
  //     });
  //   }
  // }

  // void setSounds() async {
  //   backgroundSound =
  //       await backgroundplayer.setAsset('assets/Luis_Ambience.m4a');
  //   openInfoSoundFirst =
  //       await openInfoPlayer.setAsset('assets/Luis_NativesWeak.m4a');
  //   await backgroundplayer.setLoopMode(LoopMode.one);
  // }

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
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  void dispose() {
    //backgroundplayer.stop();
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
                    onPressed: () {
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
                LeafDetails.visitedVertexes.add(3);
                LeafDetails.currentVertex = 3;
                NavigationSharedPreferences.upDateShatedPreferences();
                context.router.push(const DocumentPageRoute());
              }),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ArrowRightTextWidget(
              color: AppColors.white,
              textSubTitle: locals.todoNoHarm,
              textTitle: locals.chapter1,
              onTap: () {
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
          icons: isSoundOn ? AssetsPath.iconVolumeOn : AssetsPath.iconVolumeOff,
          onTapVolume: isSoundOn
              ? () {
                  setState(() {
                    isSoundOn = !isSoundOn;
                    // backgroundplayer.pause();
                  });
                }
              : () {
                  setState(() {
                    isSoundOn = !isSoundOn;
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
