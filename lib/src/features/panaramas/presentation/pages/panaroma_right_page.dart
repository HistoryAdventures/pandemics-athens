import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/packages/panorama-0.4.1/lib/panorama.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
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

class PanaromaRightPage extends StatefulWidget {
  @override
  _PanaromaRightPageState createState() => _PanaromaRightPageState();
}

class _PanaromaRightPageState extends State<PanaromaRightPage> {
  late AppLocalizations locals;
  late List<dynamic> infoListHotspot;
  late List<InfoDialogModel> infoList;

  final scaffoldkey = GlobalKey<ScaffoldState>();

  bool onButtonInfoPressed = false;
  bool isSoundOn = false;

  dynamic backgroundSound;
  dynamic openInfoSoundFirst;
  int infoListIndex = 0;
  bool? onViewChanged;

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    infoList = [
      InfoDialogModel(
        imageDescription: locals.demokratiaImageText,
        description: locals.demokrataText,
        subTitle: locals.demokratia,
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
        subTitle: locals.plaguePoliticalUpheaval,
        image: AssetsPath.panaramaImage2,
        latitude: -45.0,
        longitude: 15.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.athenianOstracismImageText,
        description: locals.athenianText,
        title: locals.athenianOstracism,
        subTitle:
            'Removing Rivals, Saving the City, or Serving Yourself: Athenian Ostracism',
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
        subTitle: locals.disposingOfTheDead,
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
        subTitle: 'Abandoning the gods, abandoned by the gods?',
        image: AssetsPath.panaramaImage5,
        latitude: 20.0,
        longitude: 120.0,
        width: 90,
        height: 75,
      ),
    ];
    infoListHotspot = [
      InfoDialogModel(
        imageDescription: locals.demokratiaImageText,
        description: locals.demokrataText,
        subTitle: locals.demokratia,
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
        subTitle: locals.plaguePoliticalUpheaval,
        image: AssetsPath.panaramaImage2,
        latitude: -45.0,
        longitude: 15.0,
        width: 90,
        height: 75,
      ),
      InfoDialogModel(
        imageDescription: locals.athenianOstracismImageText,
        description: locals.athenianText,
        title: locals.athenianOstracism,
        subTitle:
            'Removing Rivals, Saving the City, or Serving Yourself: Athenian Ostracism',
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
        subTitle: locals.disposingOfTheDead,
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
        subTitle: 'Abandoning the gods, abandoned by the gods?',
        image: AssetsPath.panaramaImage5,
        latitude: 20.0,
        longitude: 120.0,
        width: 90,
        height: 75,
      ),
      locals.panaromaRightInfoDialogText
    ];
    super.didChangeDependencies();
  }

  Future<void> init() async {
    if (isSoundOn == true) {
      setState(() {
        isSoundOn = true;
        //backgroundplayer.play();
      });
    } else {
      setState(() {
        isSoundOn = false;
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
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: GestureDetector(
        child: Stack(
          children: [
            ClipRRect(
              child: Panorama(
                deformHotspots: false,
                hotspots: infoListHotspot.map((info) {
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
                                              subTitleText: locals
                                                  .plaguePoliticalInstability,
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
                child: Image.asset(AssetsPath.panaramaBackgroundImageRight),
              ),
            ),
            SoundAndMenuWidget(
              color: AppColors.white,
              icons: isSoundOn
                  ? AssetsPath.iconVolumeOn
                  : AssetsPath.iconVolumeOff,
              onTapVolume: isSoundOn
                  ? () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                        //backgroundplayer.pause();
                      });
                    }
                  : () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                        //backgroundplayer.play();
                      });
                    },
              onTapMenu: () {
                scaffoldkey.currentState!.openEndDrawer();
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ArrowLeftTextWidget(
                  color: AppColors.white,
                  textSubTitle: locals.todoNoHarm,
                  textTitle: locals.chapter1,
                  onTap: () {
                    LeafDetails.currentVertex = 2;
                    LeafDetails.visitedVertexes.add(2);
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.replace(ParalaxHistoryPageToRight(
                      mustScrollToEnd: true,
                    ));
                  }),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButtonWidget(
                color: AppColors.white,
                iconSize: HW.getHeight(37, context),
                icon: const Icon(Icons.arrow_downward),
                onPressed: () async {
                  LeafDetails.currentVertex = 10;
                  LeafDetails.visitedVertexes.add(10);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.push(PathogenProfilePageBottomRoute());
                },
              ),
            ),
          ],
        ),
      ),
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
