import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
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
  var begin = Offset(0.0, -1.0);
  var end = Offset.zero;
  var curve = Curves.easeInBack;
  var backgroundplayer = AudioPlayer();
  var openInfoPlayer = AudioPlayer();
  var backgroundSound;
  var openInfoSoundFirst;
  int infoListIndex = 0;
  List<InfoDialogModel> infoList = [
    InfoDialogModel(
      title: "locals.globalPandemicName",
      image: "assets/info_image1.jpg",
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
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = true;
        isSoundOn = true;
        backgroundplayer.play();
      });
    });
  }

  void setSounds() async {
    backgroundSound =
        await backgroundplayer.setAsset('assets/Luis_Ambience.m4a');
    openInfoSoundFirst =
        await openInfoPlayer.setAsset('assets/Luis_NativesWeak.m4a');
    await backgroundplayer.setLoopMode(LoopMode.one);
  }

  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  int _panoId = 0;

  // void onViewChanged(longitude, latitude, tilt) {
  //   setState(() {
  //     _lon = longitude;
  //     _lat = latitude;
  //     _tilt = tilt;

  //   });
  // }
  @override
  void initState() {
    setSounds();
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
    var begin = Offset(0.0, -1.0);
    var end = Offset.zero;
    var curve = Curves.easeInBack;

    var tween = Tween(begin: begin, end: end);
    // var curvedAnimation = CurvedAnimation(
    //   parent: animation,
    //   curve: curve,
    // );
    return Scaffold(
      body: (isLoading || isSoundOn)
          ? _body()
          : Scaffold(
              body: Container(
              color: Colors.black,
              child: Center(
                child: PulsingWidget(
                  duration: Duration(milliseconds: 500),
                  tween: Tween(end: 0.25, begin: 1.5),
                  child: Text(
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
          child: Image.asset('assets/panorama_image2.png'),
          hotspots: infoList.map((info) {
            return Hotspot(
              height: info.height,
              width: info.width,
              latitude: info.latitude,
              longitude: info.longitude,
              widget: hotspotButton(
                  icon: AnimatedPulse(
                    pulseDuration: Duration(seconds: 3),
                    child: Container(
                      height: 30,
                      width: 30,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      openInfoPlayer.play();
                      print("object");
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
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: SlideTransition(
                              position: animation.drive(tween),
                              //opacity: animation,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: MediaQuery.of(context).size.width * 0.3,
                                child: Scaffold(
                                    backgroundColor:
                                        AppColors.blackG.withOpacity(0.75),
                                    body: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                                child: Clickable(
                                                    onPressed: () {
                                                      setState(() {
                                                        openInfoPlayer.stop();
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    },
                                                    child: const Icon(
                                                      Icons.close,
                                                      size: 30,
                                                      color: Colors.white,
                                                    ))),
                                            Expanded(
                                              flex: 2,
                                              child: ListView(
                                                children: [
                                                  Text(
                                                    locals
                                                        .panaromaInfoDialogText,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2
                                                        ?.copyWith(
                                                            color: AppColors
                                                                .white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ))),
                              ),
                            ),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 200),
                        barrierDismissible: true,
                        barrierLabel: '',
                        pageBuilder: (context, animation1, animation2) {
                          return null!;
                        });
                  }),
            );
          }).toList(),
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
              margin: EdgeInsets.only(left: 50, top: 50),
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
            child: icon,
            onPressed: () {
              onPressed();
            }),
        text != null
            ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    //color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }
}

class InfoDialogModel {
  String image;
  String title;
  double latitude;
  double longitude;
  double height;
  double width;

  InfoDialogModel(
      {required this.image,
      required this.title,
      required this.latitude,
      required this.longitude,
      required this.height,
      required this.width});
}
