import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
  final height = window.physicalSize.height / window.devicePixelRatio;
  final width = window.physicalSize.width / window.devicePixelRatio;

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

  double _topTextOpasyty = 1;

  double _bottomFieldOpasity = 0;
  double _paralaxTextOpasyty1 = 0;
  double _paralaxTextOpasyty2 = 0;
  double _paralaxTextOpasyty3 = 0;
  double _paralaxTextOpasyty4 = 0;
  double _paralaxTextOpasyty5 = 0;

  double _paralaxImageOpasyty = 1;

  bool _lernMoreButtonVisibility = false;

  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();

  late AppLocalizations locals;
  bool isImageloaded = false;

  final ScrollController _scrollController = ScrollController();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  List<String> contentImages = [AssetsPath.paralaxBackground];

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    rateOne = width * 0;
    rateTwo = height * 2;
    rateThree = height * 3;
    rateFour = height * 3.5;
    rateFive = height * 5.2;
    rateSix = height * 5.5;
    rateSeven = height * 6;
    rateEight = height * 9;
    rateNine = height * 9.3;
    rateTen = height * 11;
    rateEleven = height * 13.5;
    rateTwelv = height * 14;

    _scrollFour = height * 2.3;
    _scrollFive = height * 2;
    _scrollrateSix = height * 3.3;
    _scrollrateSeven = height * 3.8;
    _scrollrateNine = height * 5;
    _scrollrateTen = height * 5.8;
    _scrollrateEleven = height * 7.3;

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
        _paralaxImageOpasyty = 0;
        setState(() {
          _lernMoreButtonVisibility = true;
        });
      } else {
        _paralaxTextOpasyty2 = 0;
        _paralaxImageOpasyty = 1;
        setState(() {
          _lernMoreButtonVisibility = false;
        });
      }
      if (_scrollController.offset > _scrollrateNine &&
          _scrollController.offset < _scrollrateTen) {
        _paralaxTextOpasyty3 = 1;
      } else {
        _paralaxTextOpasyty3 = 0;
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
    });
    init();
    super.initState();
  }

  Future<void> init() async {
    final loadedAssets = await loadContent(contentImages);
    if (loadedAssets == true) {
      setState(() {
        isImageloaded = true;
      });
    } else {
      setState(() {
        isImageloaded = false;
      });
    }
  }

  @override
  void dispose() {
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
                //only if scroll update notification is triggered
                setState(() {
                  rateOne += v.scrollDelta! * 0.19;
                  //print(rateOne);

                  rateEleven -= v.scrollDelta! / 2;
                  rateTwelv -= v.scrollDelta! / 2;
                  rateTen -= v.scrollDelta! / 2;
                  rateNine -= v.scrollDelta! / 2;
                  rateEight -= v.scrollDelta! / 1.8;
                  rateSeven -= v.scrollDelta! / 1.5;
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
                            width: MediaQuery.of(context).size.width,
                            boxFit: BoxFit.contain,
                            top: rateZero,
                            asset: "clouds",
                          ),
                          ParallaxWidget(
                            width: MediaQuery.of(context).size.width,
                            boxFit: BoxFit.contain,
                            top: rateTwo,
                            asset: "building",
                          ),
                          ParallaxWidget(
                            paralaxText: locals.paralaxText1,
                            width: MediaQuery.of(context).size.width / 2.2,
                            boxFit: BoxFit.contain,
                            top: rateThree,
                            left: 0,
                            asset: "character_nkos",
                          ),
                          ParallaxWidget(
                            paralaxText: locals.paralaxText1,
                            width: MediaQuery.of(context).size.width / 2.2,
                            boxFit: BoxFit.contain,
                            top: rateFour,
                            left: MediaQuery.of(context).size.width / 2.2,
                            right: 0,
                            asset: "dead_bodies",
                          ),
                          ParallaxWidget(
                              width: MediaQuery.of(context).size.width,
                              boxFit: BoxFit.contain,
                              top: rateFive,
                              opacity: _paralaxImageOpasyty,
                              asset: "left_crowd"),
                          ParallaxWidget(
                              width: MediaQuery.of(context).size.width,
                              boxFit: BoxFit.cover,
                              top: rateSix,
                              asset: "characters_2"),
                          ParallaxWidget(
                            width: MediaQuery.of(context).size.width / 3,
                            top: rateSeven,
                            left: constraints.maxWidth * 0.13,
                            asset: "character_12",
                            boxFit: BoxFit.contain,
                          ),
                          ParallaxWidget(
                            width: MediaQuery.of(context).size.width / 3,
                            top: rateEight,
                            left: MediaQuery.of(context).size.width / 2,
                            asset: "character_11",
                            boxFit: BoxFit.cover,
                          ),
                          ParallaxWidget(
                              width: rateOne.clamp(0, 2000),
                              top: rateNine,
                              left: -100,
                              asset: "character_1",
                              boxFit: BoxFit.contain),
                          ParallaxWidget(
                              width: constraints.maxWidth * 0.6,
                              top: rateTen,
                              left: constraints.maxWidth * 0.3,
                              right: 0,
                              asset: "hand",
                              boxFit: BoxFit.contain),
                          ParallaxWidget(
                              width: MediaQuery.of(context).size.width,
                              top: rateEleven,
                              left: constraints.maxWidth * 0.2,
                              right: constraints.maxWidth * 0.2,
                              asset: "character_2",
                              boxFit: BoxFit.contain),
                          ParallaxWidget(
                              width: MediaQuery.of(context).size.width,
                              top: rateTwelv,
                              asset: "cloud",
                              boxFit: BoxFit.contain),
                        ],
                      )
                    ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    duration: Times.slower,
                    opacity: _bottomFieldOpasity,
                    child: Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: constraints.maxHeight * 0.1,
                      decoration:
                          BoxDecoration(color: AppColors.grey.withOpacity(0.9)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
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
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: AutoSizeText(
                                locals.whatNikosDo,
                                maxLines: 1,
                                minFontSize: 5,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontSize: 36,
                                        fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
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
                Visibility(
                  visible: _lernMoreButtonVisibility,
                  child: AnimatedOpacity(
                      duration: Times.medium,
                      opacity: _paralaxTextOpasyty2,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Clickable(
                            onPressed: () {
                              LeafDetails.visitedVertexes.add(4);
                              LeafDetails.currentVertex = 4;
                              context.router.push(const MapPageRoute());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              decoration: BoxDecoration(
                                  color: AppColors.blackG.withOpacity(0.75),
                                  border: Border.all(
                                    color: AppColors.white,
                                  )),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0, vertical: 5),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            locals.learnMore.toUpperCase(),
                                            minFontSize: 5,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                ?.copyWith(
                                                    color: AppColors.white,
                                                    fontSize: 10),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                locals.athens5thCentury
                                                    .toUpperCase(),
                                                minFontSize: 5,
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2
                                                    ?.copyWith(
                                                        color: AppColors.white),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                                width: 10,
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  color: AppColors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.3,
                  left: constraints.maxWidth * 0.01,
                  child: Container(
                    width: constraints.maxWidth * 0.4,
                    padding: EdgeInsets.only(left: constraints.maxWidth * 0.01),
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
                            child: AutoSizeText(
                              locals.todoNoHarm.toUpperCase(),
                              maxLines: 1,
                              minFontSize: 8,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(fontSize: 80),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: AppColors.red, width: 3))),
                            child: AutoSizeText(
                              locals.athens429Bc,
                              maxLines: 1,
                              minFontSize: 8,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
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
                              minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context).textTheme.bodyText2,
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
                              minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context).textTheme.bodyText2,
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
                              minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context).textTheme.bodyText2,
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
                              minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context).textTheme.bodyText2,
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
                            minFontSize: 5,
                            // maxLines: 20,
                            style: Theme.of(context).textTheme.bodyText2,
                          )),
                    ),
                  ),
                ),
                SoundAndMenuWidget(
                  widget: Clickable(
                    onPressed: () {
                      LeafDetails.currentVertex = 1;
                      context.router.pop();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.arrow_upward_sharp,
                          color: AppColors.black54,
                        ),
                        AutoSizeText("BOOK INTO"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
