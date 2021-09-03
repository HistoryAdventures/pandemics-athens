import 'dart:ui';

import 'package:history_of_adventures/src/core/utils/shared_preferenses.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/widget/paralax_text_widget.dart';
import "package:universal_html/html.dart" as html;
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../widget/paralax_widget.dart';

class ParalaxHistoryPage extends StatefulWidget {
  @override
  _ParalaxHistoryPageState createState() => _ParalaxHistoryPageState();
}

class _ParalaxHistoryPageState extends State<ParalaxHistoryPage>
    with TickerProviderStateMixin {
  late double height = window.physicalSize.height / window.devicePixelRatio;
  late double width = window.physicalSize.width / window.devicePixelRatio;

  double rateZero = 0;
  late double rate;
  late double rateOne;
  late double rateTwo;
  late double rateThree;
  late double rateFour;
  late double rateFive;
  late double rateSix;
  late double rateSeven;
  late double rateEight;
  late double rateNine;
  late double rateTen;
  late double rateEleven;
  late double rateTwelv;

  late double _scrollFive;
  late double _scrollFour;
  late double _scrollrateEleven;

  late double _scrollrateSix;
  late double _scrollrateSeven;

  late double _scrollrateNine;
  late double _scrollrateTen;

  AnimationController? _animationControllerForCharacterNikos;
  Animation<double>? animationForCharacterNikos;
  AnimationController? _animationControllerForClouds;
  Animation<double>? animationForClouds;
  double _progressCaracterNikos = -200;
  double _progress2 = -200;
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
    AssetsPath.paralaxCharacter_11,
    AssetsPath.paralaxCharacters_2,
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
    init();
    _animationControllerForClouds =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    animationForClouds = Tween<double>(begin: -500, end: 0)
        .animate(_animationControllerForClouds!)
          ..addListener(() {
            if (mounted) {
              setState(() {
                _progress2 = animationForClouds!.value;
              });
            }
          });
    _animationControllerForClouds?.forward();
    rateOne = width * 0;
    rateTwo = height * 2;
    rate = height * 1.5;
    rateThree = height * 3;
    rateFour = height * 3.5;
    rateFive = height * 5.2;
    rateSix = height * 6.6;
    rateSeven = height * 6.5;
    rateEight = height * 9;
    rateNine = height * 9.3;
    rateTen = height * 11;
    rateEleven = height * 13.5;
    rateTwelv = height * 14;

    _scrollFour = height * 2.3;
    _scrollFive = height * 1.7;
    _scrollrateSix = height * 3.5;
    _scrollrateSeven = height * 3.8;
    _scrollrateNine = height * 5;
    _scrollrateTen = height * 5.8;
    _scrollrateEleven = height * 7.5;

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

      if (_scrollController.offset > _scrollFour &&
          _scrollController.offset < _scrollFour + 400) {
        _paralaxText2Opacity = 1;
      } else {
        _paralaxText2Opacity = 0;
      }
      if (_scrollController.offset > _scrollrateSix &&
          _scrollController.offset < _scrollrateSeven) {
        _paralaxText3Opacity = 1;
      } else {
        _paralaxText3Opacity = 0;
      }
      if (_scrollController.offset > _scrollrateNine + 400 &&
          _scrollController.offset < _scrollrateTen) {
        _paralaxText4Opacity = 1;
      } else {
        _paralaxText4Opacity = 0;
      }
      if (_scrollController.offset > _scrollrateSeven &&
          _scrollController.offset < _scrollrateSeven + 500) {
        _lernMoreOpasyty = 1;
        _lernMoreVisibility = true;
      } else {
        _lernMoreOpasyty = 0;
        _lernMoreVisibility = false;
      }
      if (_scrollController.offset > _scrollrateEleven &&
          _scrollController.offset < _scrollrateEleven + 350) {
        _paralaxText5Opacity = 1;
      } else {
        _paralaxText5Opacity = 0;
      }
      if (_scrollController.offset > _scrollFive &&
          _scrollController.offset < _scrollFive + 200) {
        _paralaxText1Opacity = 1;
      } else {
        _paralaxText1Opacity = 0;
      }
      if (_scrollController.offset > _scrollFive - 200) {
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
    if (isImageloaded == false) {
      return const LoadingWidget();
    }
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(
        builder: (constex, constraints) => SizedBox(
          child: NotificationListener(
            onNotification: (v) {
              if (v is ScrollUpdateNotification) {
                setState(() {
                  rateOne += v.scrollDelta! * 0.19;
                  rateEleven -= v.scrollDelta! / 2;
                  rateTwelv -= v.scrollDelta! / 2;
                  rateTen -= v.scrollDelta! / 2;
                  rateNine -= v.scrollDelta! / 2;
                  rateEight -= v.scrollDelta! / 1.8;
                  rateSeven -= v.scrollDelta! / 2;
                  rateSix -= v.scrollDelta! / 2;
                  rateFive -= v.scrollDelta! / 2;
                  rateFour -= v.scrollDelta! / 2;
                  rateThree -= v.scrollDelta! / 2;
                  rateTwo -= v.scrollDelta! / 0.85;
                  rateZero -= v.scrollDelta! / 2.5;
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
                              width: MediaQuery.of(context).size.width,
                              boxFit: BoxFit.contain,
                              top: rateZero,
                              left: _progress2,
                              asset: AssetsPath.paralaxClouds,
                            ),
                            ParallaxWidget(
                              isImage: true,
                              width: MediaQuery.of(context).size.width,
                              boxFit: BoxFit.contain,
                              top: rateTwo,
                              asset: AssetsPath.paralaxBuilding,
                            ),
                            ParallaxWidget(
                              isImage: false,
                              paralaxText: locals.paralaxText1,
                              width: MediaQuery.of(context).size.width / 3,
                              boxFit: BoxFit.contain,
                              top: rateThree,
                              left: _progressCaracterNikos,
                              asset: AssetsPath.paralaxCharacterNikosGif,
                            ),
                            ParallaxWidget(
                              isImage: false,
                              paralaxText: locals.paralaxText1,
                              width: MediaQuery.of(context).size.width / 3,
                              left: MediaQuery.of(context).size.width / 3,
                              boxFit: BoxFit.contain,
                              // color: Colors.red,
                              top: rate,
                              right: 0,
                              asset: AssetsPath.paralaxFireLottie,
                            ),
                            ParallaxWidget(
                                isImage: true,
                                width: MediaQuery.of(context).size.width,
                                boxFit: BoxFit.contain,
                                top: rateFive,
                                asset: AssetsPath.paralaxLeftCrowd),
                            ParallaxWidget(
                                isImage: true,
                                width: MediaQuery.of(context).size.width,
                                boxFit: BoxFit.cover,
                                top: rateSix,
                                asset: AssetsPath.paralaxCharacters_2),
                            ParallaxWidget(
                              isImage: true,
                              width: MediaQuery.of(context).size.width / 3,
                              top: rateSeven,
                              left: constraints.maxWidth * 0.13,
                              asset: AssetsPath.paralaxCharacter_12,
                              boxFit: BoxFit.contain,
                            ),
                            ParallaxWidget(
                              isImage: true,
                              width: MediaQuery.of(context).size.width / 3,
                              top: rateEight,
                              left: MediaQuery.of(context).size.width / 2,
                              asset: AssetsPath.paralaxCharacter_11,
                              boxFit: BoxFit.cover,
                            ),
                            ParallaxWidget(
                                isImage: true,
                                width: rateOne.clamp(0, 2000),
                                top: rateNine,
                                left: -100,
                                asset: AssetsPath.paralaxCharacter_1,
                                boxFit: BoxFit.contain),
                            ParallaxWidget(
                                isImage: true,
                                //gifController: gifControllerHand,
                                width: constraints.maxWidth * 0.6,
                                top: rateTen,
                                left: constraints.maxWidth * 0.3,
                                right: 0,
                                //imageInfo: imageInfoHand,
                                asset: AssetsPath.gifHand,
                                boxFit: BoxFit.contain),
                            ParallaxWidget(
                                isImage: true,
                                // gifController: gifControllerCharacter_2,
                                width: MediaQuery.of(context).size.width,
                                top: rateEleven,
                                left: 200,
                                right: 200,
                                // imageInfo: imageInfoCharacter_2,
                                asset: AssetsPath.gifCharacterNikos_2,
                                boxFit: BoxFit.cover),
                            ParallaxWidget(
                                isImage: true,
                                width: MediaQuery.of(context).size.width,
                                top: rateTwelv,
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
                                LeafDetails.currentVertex = 9;
                                LeafDetails.visitedVertexes.add(9);
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
