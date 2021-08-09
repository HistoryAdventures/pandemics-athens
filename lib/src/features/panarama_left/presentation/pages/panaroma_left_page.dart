import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';
import 'package:panorama/panorama.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../models/dialog_model.dart';

class PanaromaLeftPage extends StatefulWidget {
  @override
  _PanaromaLeftPageState createState() => _PanaromaLeftPageState();
}

class _PanaromaLeftPageState extends State<PanaromaLeftPage>
    with TickerProviderStateMixin {
  late AppLocalizations locals;
  late List<InfoDialogModel> infoList;
  List<String> contentImages = [
    AssetsPath.panaramaBackgroundImage,
    AssetsPath.panaramaImage6,
    AssetsPath.panaramaImage7,
    AssetsPath.panaramaImage8,
    AssetsPath.panaramaImage9,
    AssetsPath.panaramaImage10,
    AssetsPath.document
  ];

  bool isImageloaded = false;
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
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
        width: 60,
        height: 60,
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
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  final openInfoPlayer = AudioPlayer();
  dynamic backgroundSound;
  dynamic openInfoSoundFirst;
  int infoListIndex = 0;

  Future<void> init() async {
    final loadedAssets = await loadContent(contentImages);
    if (loadedAssets == true) {
      setState(() {
        isImageloaded = true;
        isSoundOn = true;
        backgroundplayer.play();
      });
    } else {
      setState(() {
        isSoundOn = false;
        isImageloaded = false;
      });
    }
  }

  // void setSounds() async {
  //   backgroundSound =
  //       await backgroundplayer.setAsset('assets/Luis_Ambience.m4a');
  //   openInfoSoundFirst =
  //       await openInfoPlayer.setAsset('assets/Luis_NativesWeak.m4a');
  //   await backgroundplayer.setLoopMode(LoopMode.one);
  // }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    backgroundplayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        endDrawer: const NavigationPage(),
        body: (isImageloaded || isSoundOn) ? _body() : const LoadingWidget());
  }

  Widget _body() {
    return Stack(
      children: [
        Panorama(
          //sanimSpeed: 0.0,
          //sensorControl: SensorControl.Orientation,
          // onViewChanged: onViewChanged,
          hotspots: infoList.map((info) {
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
                      openInfoPlayer.play();
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
                              builder: (context, constraints) => DialogWidget(
                                    animation: animation,
                                    tween: Offsets.tween,
                                    slectedInfoDialog: info,
                                    constraints: constraints,
                                    locals: locals,
                                    listDialogInfo: infoList,
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
          }).toList(),
          child: Image.asset('assets/panorama_image2.png'),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.06,
                top: MediaQuery.of(context).size.height * 0.25,
                bottom: MediaQuery.of(context).size.height * 0.4,
                right: MediaQuery.of(context).size.width * 0.6),
            child: Scaffold(
                backgroundColor: AppColors.blackG.withOpacity(0.75),
                body: Padding(
                    padding: const EdgeInsets.all(14),
                    child: ListView(
                      padding: const EdgeInsets.all(14),
                      children: [
                        Text(
                          locals.panaromaLeftInfoDialogText,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: AppColors.white),
                        )
                      ],
                    ))),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ArrowLeftTextWidget(
                color: AppColors.white,
                textSubTitle: locals.sourceAnalysis,
                textTitle: locals.medicalToolsKnowledge,
                onTap: () {
                  LeafDetails.visitedVertexes.add(3);
                  LeafDetails.currentVertex = 3;
                  context.router.push(const DocumentPageRoute());
                }),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ArrowRightTextWidget(
                color: AppColors.white,
                textSubTitle: locals.todoNoHarm,
                textTitle: locals.chapter1,
                onTap: () {
                  LeafDetails.currentVertex = 2;
                  context.router.pop();
                }),
          ),
        ),
        SoundAndMenuWidget(
          color: AppColors.white,
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
