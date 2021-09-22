import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../widget/paralax_text_widget.dart';
import '../widget/paralax_widget.dart';

class ParalaxHistoryPage extends StatefulWidget {
  @override
  _ParalaxHistoryPageState createState() => _ParalaxHistoryPageState();
}

class _ParalaxHistoryPageState extends State<ParalaxHistoryPage>
    with TickerProviderStateMixin {
  double rateTopClouds = 0;
  late double rateFire;
  late double rateBuilding;
  late double rateCharactersNikosGif;
  late double rateFour;
  late double rateSmoke;
  late double rateLeftCrowd;
  late double rateCharacters_2;
  late double rateCharacter_12;
  late double rateCharacter_11;
  late double rateCharacter_1;
  late double rateHand;
  late double rateCharacter_2;
  late double rateBottomClouds;

  late double _scrollParalaxText1;
  late double _scrollParalaxText2;
  late double _scrollParalaxText5;
  late double _scrollParalaxText3;
  late double _scrollLearnMoreText;
  late double _scrollParalaxText4;
  late double _scrollParalaxText4_4;

  AnimationController? _animationControllerForCharacterNikos;
  Animation<double>? animationForCharacterNikos;

  AnimationController? _animationControllerForProgressLeftFighters;
  Animation<double>? animationForProgressLeftFighters;

  AnimationController? _animationControllerForClouds;
  Animation<double>? animationForClouds;

  AnimationController? _animationControllerForProgressRightFighters;
  Animation<double>? animationForProgressRightFighters;

  AnimationController? _animationControllerForWalker;
  Animation<double>? animationForWalker;

  double _progressCaracterNikos = -200;
  double _progressLeftFighters = -200;
  double _progressRightFighters = -200;
  double _progressTopClouds = -200;
  double _progressWeightWalker = 0;
  double _topTextOpasyty = 1;

  double _bottomFieldOpasity = 0;
  double _paralaxText2Opacity = 0;
  double _paralaxText3Opacity = 0;
  double _paralaxText4Opacity = 0;
  double _paralaxText5Opacity = 0;
  double _paralaxText1Opacity = 0;
  double _lernMoreOpasyty = 0;

  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();

  late AppLocalizations locals;
  bool isImageloaded = false;
  bool _lernMoreVisibility = false;
  bool _bottomFieldVizibility = false;

  final ScrollController _scrollController = ScrollController();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  List<String> contentImages = [
    AssetsPath.paralaxBackground,
    AssetsPath.paralaxBuilding,
    AssetsPath.paralaxCharacter_1,
  ];

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  Future<void> init() async {
    final loadedAssets = await loadContent(contentImages);

    if (loadedAssets == true) {
      isImageloaded = true;
    } else {
      isImageloaded = false;
    }
  }

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    // init();
    _animationControllerForClouds =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    animationForClouds = Tween<double>(begin: -500, end: 0)
        .animate(_animationControllerForClouds!)
          ..addListener(() {
            if (mounted) {
              setState(() {
                _progressTopClouds = animationForClouds!.value;
              });
            }
          });
    _animationControllerForClouds?.forward();
    rateBuilding = height * 2;
    rateFire = height * 1.9;
    rateSmoke = height * 3.1;
    rateCharactersNikosGif = height * 3;
    rateFour = height * 3.5;
    rateLeftCrowd = height * 5.2;
    rateCharacters_2 = height * 6.6;
    rateCharacter_12 = height * 6.5;
    rateCharacter_11 = height * 9;
    rateCharacter_1 = height * 9.5;
    rateHand = height * 11;
    rateCharacter_2 = height * 13.5;
    rateBottomClouds = height * 14;

    _scrollParalaxText2 = height * 2.3;
    _scrollParalaxText1 = height * 1.7;
    _scrollParalaxText3 = height * 3.5;
    _scrollLearnMoreText = height * 3.8;
    _scrollParalaxText4 = height * 5;
    _scrollParalaxText4_4 = height * 5.8;
    _scrollParalaxText5 = height * 7.5;

    _scrollController.addListener(() {
      if (_scrollController.offset > 10) {
        _topTextOpasyty = 0;
      } else {
        _topTextOpasyty = 1;
      }
      if (_scrollController.offset <=
              _scrollController.position.maxScrollExtent &&
          _scrollController.offset >=
              _scrollController.position.maxScrollExtent - 100) {
        _bottomFieldOpasity = 1;

        _bottomFieldVizibility = true;
      } else {
        _bottomFieldVizibility = false;

        _bottomFieldOpasity = 0;
      }

      if (_scrollController.offset > _scrollParalaxText2 &&
          _scrollController.offset < _scrollParalaxText2 + 400) {
        _paralaxText2Opacity = 1;
      } else {
        _paralaxText2Opacity = 0;
      }
      if (_scrollController.offset > _scrollParalaxText3 &&
          _scrollController.offset < _scrollLearnMoreText) {
        _paralaxText3Opacity = 1;
      } else {
        _paralaxText3Opacity = 0;
      }
      if (_scrollController.offset > _scrollParalaxText4 + 400 &&
          _scrollController.offset < _scrollParalaxText4_4) {
        _paralaxText4Opacity = 1;
      } else {
        _paralaxText4Opacity = 0;
      }
      if (_scrollController.offset > _scrollLearnMoreText &&
          _scrollController.offset < _scrollLearnMoreText + 500) {
        _lernMoreOpasyty = 1;
        _lernMoreVisibility = true;
      } else {
        _lernMoreOpasyty = 0;
        _lernMoreVisibility = false;
      }
      if (_scrollController.offset > _scrollParalaxText5 &&
          _scrollController.offset < _scrollParalaxText5 + 350) {
        _paralaxText5Opacity = 1;
      } else {
        _paralaxText5Opacity = 0;
      }

      if (_scrollController.offset > _scrollParalaxText1 &&
          _scrollController.offset < _scrollParalaxText1 + 200) {
        _paralaxText1Opacity = 1;
      } else {
        _paralaxText1Opacity = 0;
      }
      if (_scrollController.offset > _scrollParalaxText1 - 200) {
        if (_animationControllerForCharacterNikos == null) {
          _animationControllerForCharacterNikos = AnimationController(
              vsync: this, duration: const Duration(seconds: 3));
          animationForCharacterNikos = Tween<double>(begin: -200, end: 0)
              .animate(_animationControllerForCharacterNikos!)
                ..addListener(() {
                  if (mounted) {
                    setState(() {
                      _progressCaracterNikos =
                          animationForCharacterNikos!.value;
                    });
                  }
                });

          _animationControllerForCharacterNikos?.forward();
        }
      } else {
        _animationControllerForCharacterNikos?.stop();
      }
      if (_scrollController.offset > _scrollParalaxText2 + 400) {
        if (_animationControllerForProgressLeftFighters == null &&
            _animationControllerForProgressRightFighters == null) {
          _animationControllerForProgressLeftFighters = AnimationController(
              vsync: this, duration: const Duration(seconds: 3));
          animationForProgressLeftFighters = Tween<double>(begin: -200, end: 0)
              .animate(_animationControllerForProgressLeftFighters!)
                ..addListener(() {
                  if (mounted) {
                    setState(() {
                      _progressLeftFighters =
                          animationForProgressLeftFighters!.value;
                    });
                  }
                });

          _animationControllerForProgressLeftFighters?.forward();

          _animationControllerForProgressRightFighters = AnimationController(
              vsync: this, duration: const Duration(seconds: 3));
          animationForProgressRightFighters = Tween<double>(begin: -200, end: 0)
              .animate(_animationControllerForProgressRightFighters!)
                ..addListener(() {
                  if (mounted) {
                    setState(() {
                      _progressRightFighters =
                          animationForProgressRightFighters!.value;
                    });
                  }
                });

          _animationControllerForProgressRightFighters?.forward();
        }
      } else {
        _animationControllerForProgressLeftFighters?.stop();
        _animationControllerForProgressRightFighters?.stop();
      }

      if (_scrollController.offset > _scrollParalaxText4 + 200) {
        if (_animationControllerForWalker == null) {
          _animationControllerForWalker = AnimationController(
              vsync: this, duration: const Duration(seconds: 5));
          animationForWalker = Tween<double>(begin: 0, end: width * 0.17)
              .animate(_animationControllerForWalker!)
                ..addListener(() {
                  if (mounted) {
                    setState(() {
                      _progressWeightWalker = animationForWalker!.value;
                    });
                  }
                });

          _animationControllerForWalker?.forward();
        }
      } else {
        _animationControllerForWalker?.stop();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationControllerForCharacterNikos?.dispose();
    _animationControllerForClouds?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (isImageloaded == false) {
    //   return LoadingWidget();
    // }

    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(
        builder: (constex, constraints) => SizedBox(
          child: NotificationListener(
            onNotification: (v) {
              if (v is ScrollUpdateNotification) {
                setState(() {
                  rateCharacter_2 -= v.scrollDelta! / 2;
                  rateBottomClouds -= v.scrollDelta! / 2;
                  rateHand -= v.scrollDelta! / 2;
                  rateCharacter_1 -= v.scrollDelta! / 2;
                  rateCharacter_11 -= v.scrollDelta! / 1.8;
                  rateCharacter_12 -= v.scrollDelta! / 2;
                  rateCharacters_2 -= v.scrollDelta! / 2;
                  rateLeftCrowd -= v.scrollDelta! / 2;
                  rateFour -= v.scrollDelta! / 2;
                  rateCharactersNikosGif -= v.scrollDelta! / 2;
                  rateBuilding -= v.scrollDelta! / 0.85;
                  rateTopClouds -= v.scrollDelta! / 2.5;
                });
              }
              return true;
            },
            child: Stack(
              children: <Widget>[
                ListView(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    controller: _scrollController,
                    children: <Widget>[
                      Container(
                        height: constraints.maxHeight * 10,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetsPath.paralaxBackground),
                              fit: BoxFit.cover),
                        ),
                        child: Stack(
                          children: [
                            ParallaxWidget(
                              isImage: true,
                              width: constraints.maxWidth,
                              boxFit: BoxFit.contain,
                              top: rateTopClouds,
                              left: _progressTopClouds,
                              asset: AssetsPath.paralaxClouds,
                            ),
                            ParallaxWidget(
                              isImage: true,
                              width: constraints.maxWidth,
                              boxFit: BoxFit.contain,
                              top: rateBuilding,
                              asset: AssetsPath.paralaxBuilding,
                            ),
                            ParallaxWidget(
                              isImage: false,
                              width: constraints.maxWidth / 3,
                              boxFit: BoxFit.contain,
                              top: rateCharactersNikosGif,
                              left: _progressCaracterNikos,
                              asset: AssetsPath.paralaxCharacterNikosLottie,
                            ),
                            ParallaxWidget(
                              isImage: false,
                              width: constraints.maxWidth / 3,
                              boxFit: BoxFit.contain,
                              top: rateFire,
                              right: constraints.maxWidth * 0.1,
                              asset: AssetsPath.paralaxFireLottie,
                            ),
                            // ParallaxWidget(
                            //   isImage: false,
                            //   width: constraints.maxWidth * 0.6,
                            //   boxFit: BoxFit.contain,
                            //   top: rateSmoke,
                            //   right: constraints.maxWidth * 0.2,
                            //   asset: AssetsPath.paralaxSmokeLottie,
                            // ),
                            ParallaxWidget(
                              isImage: false,
                              width: constraints.maxWidth,
                              boxFit: BoxFit.contain,
                              top: rateLeftCrowd,
                              right: _progressRightFighters,
                              asset: AssetsPath.paralaxFightersRightLottie,
                            ),
                            ParallaxWidget(
                              isImage: true,
                              width: constraints.maxWidth,
                              boxFit: BoxFit.contain,
                              left: _progressLeftFighters,
                              top: rateLeftCrowd,
                              asset: AssetsPath.paralaxFightersLeft,
                            ),
                            ParallaxWidget(
                              isImage: false,
                              width: constraints.maxWidth,
                              boxFit: BoxFit.contain,
                              top: rateLeftCrowd,
                              asset: AssetsPath.paralaxFightersLeftLottie,
                            ),
                            ParallaxWidget(
                                isImage: false,
                                width:constraints.maxWidth,
                                boxFit: BoxFit.cover,
                                top: rateCharacters_2,
                                asset: AssetsPath.paralaxCrowdLottie),
                            ParallaxWidget(
                              isImage: false,
                              width:constraints.maxWidth / 3,
                              top: rateCharacter_11,
                              left:constraints.maxWidth / 2,
                              asset: AssetsPath.paralaxYoungManLottie,
                              boxFit: BoxFit.cover,
                            ),
                            ParallaxWidget(
                                isImage: true,
                                width: _progressWeightWalker,
                                top: rateCharacter_1,
                                left: constraints.maxWidth * 0.2,
                                asset: AssetsPath.paralaxCharacter_1,
                                boxFit: BoxFit.contain),
                            ParallaxWidget(
                                isImage: false,
                                width: constraints.maxWidth * 0.5,
                                top: rateHand,
                                right: 0,
                                asset: AssetsPath.paralaxHotTubLottie,
                                boxFit: BoxFit.contain),
                            ParallaxWidget(
                                isImage: false,
                                width: constraints.maxWidth,
                                bottom: -constraints.maxWidth * 0.1,
                                left: constraints.maxWidth * 0.1,
                                right: constraints.maxWidth * 0.1,
                                asset: AssetsPath.paralaxTube2Lottie,
                                boxFit: BoxFit.cover),
                            ParallaxWidget(
                                isImage: true,
                                width:constraints.maxWidth,
                                bottom: -constraints.maxHeight * 0.3,
                                asset: AssetsPath.paralaxCloud,
                                boxFit: BoxFit.contain),
                          ],
                        ),
                      )
                    ]),
                Visibility(
                  visible: _bottomFieldVizibility,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedOpacity(
                      duration: Times.slower,
                      opacity: _bottomFieldOpasity,
                      child: SizedBox(
                        height: constraints.maxHeight * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: ArrowLeftWidget(
                                  arrowColor: Colors.black,
                                  textSubTitle: locals.stickToTheOath,
                                  textTitle: '',
                                  onTap: () {
                                    LeafDetails.currentVertex = 8;
                                    LeafDetails.visitedVertexes.add(8);
                                    NavigationSharedPreferences
                                        .upDateShatedPreferences();
                                    context.router
                                        .push(const PanaromaLeftPageRoute());
                                  }),
                            ),
                            Flexible(
                              flex: 3,
                              child: AutoSizeText(
                                locals.whatNikosDo,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w400),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ArrowRightWidget(
                                  textSubTitle: locals.helpTheSenator,
                                  textTitle: '',
                                  arrowColor: Colors.black,
                                  onTap: () {
                                    LeafDetails.currentVertex = 9;
                                    LeafDetails.visitedVertexes.add(9);
                                    NavigationSharedPreferences
                                        .upDateShatedPreferences();
                                    context.router
                                        .push(const PanaromaRightPageRoute());
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.3,
                  left: constraints.maxWidth * 0.05,
                  child: SizedBox(
                    width: constraints.maxWidth * 0.4,
                    child: AnimatedOpacity(
                      opacity: _topTextOpasyty,
                      duration: Times.fast,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: AutoSizeText(locals.chapter1.toUpperCase()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: AutoSizeText(locals.todoNoHarm.toUpperCase(),
                                maxLines: 1,
                                // minFontSize: 8,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontSize: 80,
                                        fontStyle: FontStyle.italic)),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: AppColors.red, width: 8))),
                            child: AutoSizeText(
                              locals.athens429Bc,
                              maxLines: 1,
                              // minFontSize: 8,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    fontSize: 80,
                                    fontWeight: FontWeight.w100,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ParalaxTextWidget(
                  text: locals.paralaxText1,
                  alignment: Alignment.topRight,
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  opacity: _paralaxText1Opacity,
                ),
                ParalaxTextWidget(
                  text: locals.paralaxText2,
                  alignment: Alignment.bottomLeft,
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  opacity: _paralaxText2Opacity,
                ),
                ParalaxTextWidget(
                  text: locals.paralaxText3,
                  alignment: Alignment.centerRight,
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  opacity: _paralaxText3Opacity,
                ),
                ParalaxTextWidget(
                  text: locals.paralaxText4,
                  alignment: Alignment.centerLeft,
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  opacity: _paralaxText4Opacity,
                ),
                ParalaxTextWidget(
                  text: locals.paralaxText5,
                  alignment: Alignment.bottomLeft,
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  opacity: _paralaxText5Opacity,
                ),
                SoundAndMenuWidget(
                  widget: Clickable(
                    onPressed: () {
                      LeafDetails.currentVertex = 1;
                      NavigationSharedPreferences.upDateShatedPreferences();
                      if (kIsWeb) {
                        html.window.history.back();
                        context.router.pop();
                      } else {
                        context.router.pop();
                      }
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.arrow_upward_sharp,
                          color: AppColors.black54,
                        ),
                        Text("BOOK INTO"),
                      ],
                    ),
                  ),
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
                Visibility(
                  visible: _lernMoreVisibility,
                  child: AnimatedOpacity(
                    duration: Times.medium,
                    opacity: _lernMoreOpasyty,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(boxShadow: Shadows.small),
                        // color: AppColors.black100,
                        height: constraints.maxHeight * 0.1,
                        width: MediaQuery.of(context).size.width,
                        child: Clickable(
                          onPressed: () {
                            LeafDetails.visitedVertexes.add(4);
                            LeafDetails.currentVertex = 4;
                            NavigationSharedPreferences
                                .upDateShatedPreferences();
                            context.router.push(const MapPageRoute());
                          },
                          child: ArrowRightWidget(
                              textSubTitle:
                                  locals.athens5thCentury.toUpperCase(),
                              textTitle: '',
                              textColor: AppColors.white,
                              onTap: () {
                                ////????????
                                LeafDetails.currentVertex = 4;
                                LeafDetails.visitedVertexes.add(4);

                                // LeafDetails.currentVertex = 9;
                                // LeafDetails.visitedVertexes.add(9);
                                NavigationSharedPreferences
                                    .upDateShatedPreferences();
                                context.router.push(const MapPageRoute());
                              }),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
