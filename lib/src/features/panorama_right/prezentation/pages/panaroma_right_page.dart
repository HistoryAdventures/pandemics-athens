import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';
import 'package:panorama/panorama.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../panarama_left/presentation/models/dialog_model.dart';

class PanaromaRightPage extends StatefulWidget {
  @override
  _PanaromaRightPageState createState() => _PanaromaRightPageState();
}

class _PanaromaRightPageState extends State<PanaromaRightPage>
    with TickerProviderStateMixin {
  late AppLocalizations locals;
  late List<InfoDialogModel> infoList;

  final begin = const Offset(0.0, -1.0);
  final end = Offset.zero;
  final curve = Curves.easeInBack;
  final backgroundplayer = AudioPlayer();
  final openInfoPlayer = AudioPlayer();

  bool onButtonInfoPressed = false;
  bool isSoundOn = false;
  String image = 'assets/panorama_image2.png';

  dynamic backgroundSound;
  dynamic openInfoSoundFirst;
  int infoListIndex = 0;

  bool isImageloaded = false;

  List<String> contentImages = [
    AssetsPath.panaramaBackgroundImage,
    AssetsPath.panaramaImage1,
    AssetsPath.panaramaImage2,
    AssetsPath.panaramaImage3,
    AssetsPath.panaramaImage4,
    AssetsPath.panaramaImage5,
  ];

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    infoList = [
      InfoDialogModel(
        imageDescription: locals.demokratiaImageText,
        description: locals.demokrataText,
        title: locals.demokratia,
        image: AssetsPath.panaramaImage1,
        latitude: -10.0,
        longitude: 60.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.plagueImageText,
        description: locals.plagueText,
        title: locals.plaguePoliticalUpheaval,
        image: AssetsPath.panaramaImage2,
        latitude: -45.0,
        longitude: 15.0,
        width: 60,
        height: 60,
      ),
      InfoDialogModel(
        imageDescription: locals.athenianOstracismImageText,
        description: locals.athenianText,
        title: locals.athenianOstracism,
        image: AssetsPath.panaramaImage3,
        latitude: 10.0,
        longitude: 15.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.disposingOfTheDeadImageText,
        description: locals.disposingText,
        title: locals.disposingOfTheDead,
        image: AssetsPath.panaramaImage4,
        latitude: -20.0,
        longitude: 160.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.abandondedImageText,
        description: locals.abandondedText,
        title: locals.abandonedByTheGods,
        image: AssetsPath.panaramaImage5,
        latitude: 20.0,
        longitude: 120.0,
        width: 90,
        height: 75,
      ),
    ];
    super.didChangeDependencies();
  }

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
      body: (isImageloaded || isSoundOn)
          ? _body()
          : Scaffold(
              body: Container(
              color: Colors.black,
              child: Center(
                child: PulsingWidget(
                  duration: const Duration(milliseconds: 500),
                  tween: Tween(end: 0.25, begin: 1.5),
                  child: const Text(
                    "Loading...",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            )),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Panorama(
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
                          const begin = Offset(-1.0, -1.0);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end);

                          return LayoutBuilder(
                              builder: (context, constraints) => DialogWidget(
                                    animation: animation,
                                    tween: tween,
                                    slectedInfoDialog: info,
                                    constraints: constraints,
                                    locals: locals,
                                    listDialogInfo: infoList,
                                  ));
                        },
                        transitionDuration: const Duration(milliseconds: 200),
                        barrierDismissible: true,
                        barrierLabel: '',
                        pageBuilder: (context, animation1, animation2) {
                          return Container();
                        });
                  }),
            );
          }).toList(),
          child: Image.asset(image),
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
                          locals.panaromaInfoDialogText,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: AppColors.white),
                        )
                      ],
                    ))),
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
          onTapMenu: () {},
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ArrowLeftTextWidget(
                color: AppColors.white,
                textSubTitle: locals.chapter1,
                textTitle: locals.chapter1,
                onTap: () {
                  context.router.pop();
                }),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Clickable(
              onPressed: () {
                context.router.push(const PathogenProfilePageRoute());
              },
              child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(
                    AssetsPath.arrowDounImage,
                    color: AppColors.white,
                  )),
            ),
          ),
        )
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
