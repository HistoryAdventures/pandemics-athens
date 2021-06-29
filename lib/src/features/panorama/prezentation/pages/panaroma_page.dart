import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_left.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:auto_route/auto_route.dart';
import "package:history_of_adventures/src/core/widgets/clickable_widget.dart";
import 'package:history_of_adventures/src/features/panorama/prezentation/pages/widgets/pulsing_animaation.dart';
import 'package:history_of_adventures/src/features/panorama/prezentation/pages/widgets/pulsing_widget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:panorama/panorama.dart';

class PanaromaPage extends StatefulWidget {
  @override
  _PanaromaPageState createState() => _PanaromaPageState();
}

class _PanaromaPageState extends State<PanaromaPage>
    with TickerProviderStateMixin {
  late AppLocalizations locals;
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  bool isLoading = false;
  bool onButtonInfoPressed = false;
  bool isSoundOn = false;
  final begin = const Offset(0.0, -1.0);
  final end = Offset.zero;
  final curve = Curves.easeInBack;
  final backgroundplayer = AudioPlayer();
  final openInfoPlayer = AudioPlayer();
  dynamic backgroundSound;
  dynamic openInfoSoundFirst;
  int infoListIndex = 0;
  List<InfoDialogModel> infoList = [
    InfoDialogModel(
      latitude: -15.0,
      longitude: 55.0,
      width: 90,
      height: 75,
    ),
    // InfoDialogModel(
    //   title: "asset_29.svg",
    //   image: "assets/info_image2.jpeg",
    //   latitude: -1.0,
    //   longitude: -100.0,
    //   width: 60,
    //   height: 60,
    // ),
    // InfoDialogModel(
    //   title: "asset_30.svg",
    //   image: "assets/info_image3.jpg",
    //   latitude: -13.0,
    //   longitude: 163.0,
    //   width: 90,
    //   height: 75,
    // ),
    // InfoDialogModel(
    //   title: "asset_31.svg",
    //   image: "assets/info_image4.jpg",
    //   latitude: -30.0,
    //   longitude: 225.0,
    //   width: 90,
    //   height: 75,
    // ),
  ];

  void openLoading() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = true;
        isSoundOn = true;
        backgroundplayer.play();
      });
    });
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
    // setSounds();
    openLoading();
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
      body: (isLoading || isSoundOn)
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
                          const begin = Offset(-1.0, -1.0);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end);

                          return LayoutBuilder(
                            builder: (context, constraints) => Align(
                              child: SlideTransition(
                                position: animation.drive(tween),
                                child: Container(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: constraints.maxWidth * 0.15,
                                      vertical: constraints.maxHeight * 0.2),
                                  child: Scaffold(
                                      backgroundColor:
                                          AppColors.white.withOpacity(0.75),
                                      body: Container(
                                        margin: const EdgeInsets.all(24),
                                        // height: constraints.maxHeight * 0.6,
                                        // width: constraints.maxWidth * 0.6,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: SizedBox(
                                              height: constraints.maxHeight,
                                              child: Image.asset(
                                                'assets/image_back/image_71.png',
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                            Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 4,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        AutoSizeText(
                                                                      locals
                                                                          .chapter1Name
                                                                          .toUpperCase(),
                                                                      maxLines:
                                                                          1,
                                                                      minFontSize:
                                                                          5,
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .headline2,
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child: AutoSizeText(
                                                                        locals
                                                                            .chapter1Name,
                                                                        minFontSize:
                                                                            5,
                                                                        maxLines:
                                                                            1,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .subtitle2),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  icon: Icon(Icons
                                                                      .clear)),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 3,
                                                        child: Scrollbar(
                                                          child: ListView(
                                                              shrinkWrap: true,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 8.0,
                                                                      right:
                                                                          30),
                                                                  child:
                                                                      RichText(
                                                                          text: TextSpan(
                                                                              children: [
                                                                        TextSpan(
                                                                            text:
                                                                                locals.battleOfThermopylae,
                                                                            style: Theme.of(context).textTheme.headline3),
                                                                        TextSpan(
                                                                          text:
                                                                              locals.bodyText,
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyText1,
                                                                        ),
                                                                      ])),
                                                                )
                                                              ]),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          );
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
                bottom: MediaQuery.of(context).size.height * 0.25,
                right: MediaQuery.of(context).size.width * 0.4),
            child: Scaffold(
                backgroundColor: AppColors.blackG.withOpacity(0.75),
                body: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ListView(
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
        GestureDetector(
          onTap: isSoundOn
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
          child: Container(
              margin: const EdgeInsets.only(left: 50, top: 50),
              child: Icon(
                isSoundOn ? Icons.volume_up : Icons.volume_mute,
                size: 40,
                color: Colors.white,
              )),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ArrowLeftTextWidget(
                textSubTitle: locals.chapter1,
                textTitle: locals.chapter1,
                onTap: () {
                  context.router.pop();
                }),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Clickable(
            onPressed: () {
              context.router.push(const PathogenProfilePageRoute());
            },
            child: Image.asset(AssetsPath.arrowDounImage),
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

class InfoDialogModel {
  double latitude;
  double longitude;
  double height;
  double width;

  InfoDialogModel(
      {required this.latitude,
      required this.longitude,
      required this.height,
      required this.width});
}
