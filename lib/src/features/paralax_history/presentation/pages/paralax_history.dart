import 'dart:ui';

import 'package:history_of_adventures/src/core/widgets/animated_widgets/gif_animation.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/gif_contrrol.dart';
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

  late GifAnimationController gifControllerCharacter_2;
  late GifAnimationController gifControllerHand;
  double _topTextOpasyty = 1;

  double _bottomFieldOpasity = 0;
  double _paralaxTextOpasyty1 = 0;
  double _paralaxTextOpasyty2 = 0;
  double _paralaxTextOpasyty3 = 0;
  double _paralaxTextOpasyty4 = 0;
  double _paralaxTextOpasyty5 = 0;
  double _lernMoreOpasyty = 0;

  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();

  late AppLocalizations locals;
  bool isImageloaded = true;
  // bool _lernMoreVisibility = false;

  final ScrollController _scrollController = ScrollController();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  List<String> contentImages = [
    AssetsPath.paralaxBackground,
    AssetsPath.paralaxCharacterNikosGif,
    AssetsPath.paralaxBuilding,
    AssetsPath.paralaxCharacter_1,
    AssetsPath.paralaxCharacter_11,
    AssetsPath.paralaxCharacters_2,
  ];

  //List<ImageInfo> imageInfoCharacter_2 = [];

  // late List<ImageInfo> imageInfoHand;

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    // init();
    super.didChangeDependencies();
  }

  Future<void> init() async {
    final loadedAssets = await loadContent(contentImages);
    // imageInfoCharacter_2 = await preloadImage(
    //     context: context,
    //     frameCount: 254,
    //     provider: const AssetImage(AssetsPath.gifCharacterNikos_2));
    // imageInfoHand = await preloadImage(
    //   provider: const AssetImage(AssetsPath.gifHand),
    //   frameCount: 349,
    //   context: context,
    // );
    // preloadImage(
    //   provider: const AssetImage(AssetsPath.gifHand),
    //   frameCount: 349,
    //   context: context,
    // ).then((value) {
    if (loadedAssets == true) {
      isImageloaded = true;
    } else {
      isImageloaded = false;
    }
    // });
  }

  @override
  void initState() {
    // init();
    // gifControllerCharacter_2 = GifAnimationController(
    //   vsync: this,
    //   frameCount: 254,
    //   duration: const Duration(seconds: 10),
    // );
    gifControllerHand = GifAnimationController(
      vsync: this,
      frameCount: 349,
      duration: const Duration(seconds: 10),
    );

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
    _scrollFive = height * 2;
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

        //  WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        // gifControllerCharacter_2.repeat();
      } else {
        _bottomFieldOpasity = 0;
      }

      if (_scrollController.offset > _scrollFour &&
          _scrollController.offset < _scrollFour + 400) {
        _paralaxTextOpasyty1 = 1;
      } else {
        _paralaxTextOpasyty1 = 0;
      }
      if (_scrollController.offset > _scrollrateSix &&
          _scrollController.offset < _scrollrateSeven) {
        _paralaxTextOpasyty2 = 1;
      } else {
        _paralaxTextOpasyty2 = 0;
      }
      if (_scrollController.offset > _scrollrateNine + 400 &&
          _scrollController.offset < _scrollrateTen) {
        _paralaxTextOpasyty3 = 1;
        gifControllerHand.forward();
      } else {
        gifControllerHand.stop();
        _paralaxTextOpasyty3 = 0;
      }
      if (_scrollController.offset > _scrollrateNine &&
          _scrollController.offset < _scrollrateNine + 300) {
        _lernMoreOpasyty = 1;
      } else {
        _lernMoreOpasyty = 0;
      }
      if (_scrollController.offset > _scrollrateEleven &&
          _scrollController.offset < _scrollrateEleven + 350) {
        _paralaxTextOpasyty4 = 1;
      } else {
        _paralaxTextOpasyty4 = 0;
      }
      if (_scrollController.offset > _scrollFive &&
          _scrollController.offset < _scrollFive + 200) {
        _paralaxTextOpasyty5 = 1;
      } else {
        _paralaxTextOpasyty5 = 0;
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
    gifControllerCharacter_2.dispose();
    gifControllerHand.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     init();
    //   });
    // });
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
                      Stack(
                        children: [
                          Container(
                            height: constraints.maxHeight * 10,
                            //color: Colors.transparent,

                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        AssetsPath.paralaxBackground),
                                    fit: BoxFit.cover)),
                          ),
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
                            isImage: true,
                            paralaxText: locals.paralaxText1,
                            width: MediaQuery.of(context).size.width / 2.2,
                            boxFit: BoxFit.contain,
                            top: rateThree,
                            left: _progressCaracterNikos,
                            asset: AssetsPath.paralaxCharacterNikosGif,
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
                      )
                    ]),
                Align(
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
                            child: ArrowLeftWidget(
                                arrowColor: Colors.black,
                                textSubTitle: locals.stickToTheOath,
                                textTitle: '',
                                onTap: () {
                                  LeafDetails.currentVertex = 8;
                                  LeafDetails.visitedVertexes.add(8);
                                  context.router
                                      .push(const PanaromaLeftPageRoute());
                                }),
                          ),
                          Flexible(
                            flex: 3,
                            child: AutoSizeText(
                              locals.whatNikosDo,
                              maxLines: 1,
                              // minFontSize: 5,
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
                            child: ArrowRightWidget(
                                textSubTitle: locals.helpTheSenator,
                                textTitle: '',
                                arrowColor: Colors.black,
                                onTap: () {
                                  ////????????
                                  LeafDetails.currentVertex = 9;
                                  LeafDetails.visitedVertexes.add(9);
                                  context.router
                                      .push(const PanaromaRightPageRoute());
                                }),
                          ),
                        ],
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
                                        color: AppColors.red, width: 3))),
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
                AnimatedOpacity(
                  duration: Times.fast,
                  opacity: _paralaxTextOpasyty1,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        margin: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            bottom: constraints.maxHeight * 0.05),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText(
                              locals.paralaxText2,
                              // minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context).textTheme.headline1,
                            ))),
                  ),
                ),
                AnimatedOpacity(
                  duration: Times.fast,
                  opacity: _paralaxTextOpasyty2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        margin: EdgeInsets.only(
                            right: constraints.maxWidth * 0.05,
                            bottom: constraints.maxHeight * 0.05),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText(
                              locals.paralaxText3,
                              // minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context).textTheme.headline1,
                            ))),
                  ),
                ),
                AnimatedOpacity(
                  duration: Times.fast,
                  opacity: _paralaxTextOpasyty3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        margin: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            bottom: constraints.maxHeight * 0.05),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText(
                              locals.paralaxText4,
                              // minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context).textTheme.headline1,
                            ))),
                  ),
                ),
                AnimatedOpacity(
                  duration: Times.fast,
                  opacity: _paralaxTextOpasyty4,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        margin: EdgeInsets.only(
                            left: constraints.maxWidth * 0.05,
                            bottom: constraints.maxHeight * 0.05),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText(
                              locals.paralaxText5,
                              // minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context).textTheme.headline1,
                            ))),
                  ),
                ),
                AnimatedOpacity(
                  duration: Times.fast,
                  opacity: _paralaxTextOpasyty5,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(
                          right: constraints.maxWidth * 0.05,
                          top: constraints.maxHeight * 0.05),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: AutoSizeText(
                            locals.paralaxText1,
                            // minFontSize: 5,
                            // maxLines: 20,
                            style: Theme.of(context).textTheme.headline1,
                          )),
                    ),
                  ),
                ),
                SoundAndMenuWidget(
                  widget: Clickable(
                    onPressed: () {
                      LeafDetails.currentVertex = 1;
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
                AnimatedOpacity(
                  duration: Times.medium,
                  opacity: _lernMoreOpasyty,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(top: 100, right: 50),
                      child: Clickable(
                        onPressed: () {
                          LeafDetails.visitedVertexes.add(4);
                          LeafDetails.currentVertex = 4;
                          context.router.push(const MapPageRoute());
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0, vertical: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      locals.athens5thCentury.toUpperCase(),
                                      // minFontSize: 5,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                              color: AppColors.white,
                                              fontSize: 50),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 50,
                                        color: AppColors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
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
