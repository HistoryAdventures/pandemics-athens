import 'dart:html' as htm;
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/widget/loading_video.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/widget/paralax_text_widget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import "package:universal_html/html.dart" as html;
import 'package:video_player/video_player.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class ParalaxHistoryPage extends StatefulWidget {
  @override
  _ParalaxHistoryPageState createState() => _ParalaxHistoryPageState();
}

class _ParalaxHistoryPageState extends State<ParalaxHistoryPage>
    with TickerProviderStateMixin {
  late double rateFire;
  late double rateBuilding;
  late double rateCharactersNikosGif;
  late double rateCrows;
  late double rateCharactersNikosClouds;
  // late double rateFour;
  late double rateSmoke;
  late double rateLeftCrowd;
  late double rateParalaxCrowdLottie;
  late double rateParalaxYoungManLottie;
  late double rateParalaxWalker;
  late double rateParalaxHotTubLottie;
  late double rateBottomClouds;

  late double _scrollParalaxText1;
  late double _scrollParalaxText2;
  late double _scrollParalaxText5;
  late double _scrollParalaxText3;
  late double _scrollLearnMoreText;
  late double _scrollParalaxText4;
  late double _scrollParalaxText4_4;

  late AnimationController _animationControllerForCharacterNikos;
  Animation<double>? animationForCharacterNikos;

  late AnimationController _animationControllerForMovingLeftAndRightCrows;
  Animation<double>? animationForMovingLeftAndRightCrows;

  late AnimationController _animationControllerForMovingTopCrows;
  Animation<double>? animationForMovingTopCrows;

  late AnimationController _animationControllerForProgressLeftFighters;
  Animation<double>? animationForProgressLeftFighters;

  late AnimationController _animationControllerForCloudsTop;
  Animation<double>? animationForCloudsTop;

  late AnimationController _animationControllerForProgressRightFighters;
  Animation<double>? animationForProgressRightFighters;

  late AnimationController _animationControllerForWalker;
  Animation<double>? animationForWalker;

  late AnimationController _animationControllerForHotTubeRight;
  Animation<double>? animationForHotTubeRight;

  double _progressCaracterNikos = -200;
  double _progressLeftFighters = -200;
  double _progressRightFighters = -200;
  double _progressTopClouds = -200;
  double _progressRightHotTube = -200;
  double _progressWeightWalker = 0;
  double _progressCrows = 100;
  double _topTextOpasyty = 1;
  double _progressTopCrows = 0;

  double _bottomFieldOpasity = 0;
  double youngManOpacity = 0;

  double _lernMoreOpasyty = 0;

  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();

  late AppLocalizations locals;

  late VideoPlayerController _videoController;
  bool isImageloaded = false;
  bool _lernMoreVisibility = false;
  bool _bottomFieldVizibility = false;

  final ScrollController _scrollController = ScrollController();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    height = MediaQuery.of(context).size.height;
    rateBuilding = height;
    rateFire = height * 1.9;
    rateCharactersNikosGif = height * 1.7;
    rateCrows = height * 2.5;

    rateCharactersNikosClouds = height * 1.7;
    rateLeftCrowd = height * 3.5;
    rateParalaxCrowdLottie = height * 4.15;
    rateParalaxYoungManLottie = height * 6;
    rateParalaxWalker = height * 6.5;
    rateParalaxHotTubLottie = height * 7.5;

    _scrollParalaxText2 = height * 2.3;
    _scrollParalaxText1 = height * 1.7;
    _scrollParalaxText3 = height * 3.5;
    _scrollLearnMoreText = height * 3.8;
    _scrollParalaxText4 = height * 5;
    _scrollParalaxText4_4 = height * 5.8;
    _scrollParalaxText5 = height * 7.5;

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _videoController = VideoPlayerController.asset('assets/paralax_video.mp4')
      ..initialize().then((_) => setState(() {}));
    _videoController.setVolume(0.0);
    _videoController.play();
    NavigationSharedPreferences.getNavigationListFromSF();
    _animationControllerForMovingLeftAndRightCrows =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _animationControllerForMovingTopCrows =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));

    _animationControllerForCharacterNikos =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationControllerForProgressLeftFighters =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationControllerForProgressRightFighters =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationControllerForHotTubeRight =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationControllerForWalker = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _animationControllerForCloudsTop =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));

    animationForCloudsTop = Tween<double>(begin: -width, end: width)
        .animate(_animationControllerForCloudsTop)
          ..addListener(() {
            if (mounted) {
              setState(() {
                _progressTopClouds = animationForCloudsTop!.value;
              });
            }
          });

    animationForCloudsTop?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationControllerForCloudsTop.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _animationControllerForCloudsTop.forward();
      }
    });

    _animationControllerForCloudsTop.forward();

    animationForMovingLeftAndRightCrows = Tween<double>(begin: 0, end: width)
        .animate(_animationControllerForMovingLeftAndRightCrows)
          ..addListener(() {
            if (mounted) {
              setState(() {
                _progressCrows = animationForMovingLeftAndRightCrows!.value;
              });
            }
          });

    animationForMovingLeftAndRightCrows?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationControllerForMovingLeftAndRightCrows.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _animationControllerForMovingLeftAndRightCrows.forward();
      }
    });
    _animationControllerForMovingLeftAndRightCrows.forward();

    animationForMovingTopCrows =
        Tween<double>(begin: height * 2.5, end: height * 1.5)
            .animate(_animationControllerForMovingTopCrows)
              ..addListener(() {
                if (mounted) {
                  setState(() {
                    _progressTopCrows = animationForMovingTopCrows!.value;
                  });
                }
              });

    animationForMovingTopCrows?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationControllerForMovingTopCrows.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _animationControllerForMovingTopCrows.forward();
      }
    });
    _animationControllerForMovingTopCrows.forward();

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

      if (_scrollController.offset > _scrollLearnMoreText &&
          _scrollController.offset < _scrollLearnMoreText + 500) {
        _lernMoreOpasyty = 1;
        _lernMoreVisibility = true;
      } else {
        _lernMoreOpasyty = 0;
        _lernMoreVisibility = false;
      }

      if (_scrollController.offset > _scrollParalaxText1) {
        animationForCharacterNikos = Tween<double>(begin: -200, end: 0)
            .animate(_animationControllerForCharacterNikos)
              ..addListener(() {
                if (mounted) {
                  setState(() {
                    _progressCaracterNikos = animationForCharacterNikos!.value;
                  });
                }
              });

        _animationControllerForCharacterNikos.forward();
      } else {
        _animationControllerForCharacterNikos.reverse();
      }
      if (_scrollController.offset > _scrollParalaxText2 + 800) {
        animationForProgressLeftFighters = Tween<double>(begin: -200, end: 0)
            .animate(_animationControllerForProgressLeftFighters)
              ..addListener(() {
                if (mounted) {
                  setState(() {
                    _progressLeftFighters =
                        animationForProgressLeftFighters!.value;
                  });
                }
              });

        _animationControllerForProgressLeftFighters.forward();

        animationForProgressRightFighters = Tween<double>(begin: -200, end: 0)
            .animate(_animationControllerForProgressRightFighters)
              ..addListener(() {
                if (mounted) {
                  setState(() {
                    _progressRightFighters =
                        animationForProgressRightFighters!.value;
                  });
                }
              });

        _animationControllerForProgressRightFighters.forward();
      } else {
        _animationControllerForProgressLeftFighters.reverse();
        _animationControllerForProgressRightFighters.reverse();
      }

      if (_scrollController.offset > _scrollParalaxText4 + 700) {
        animationForWalker = Tween<double>(begin: 0, end: width * 0.1)
            .animate(_animationControllerForWalker)
              ..addListener(() {
                if (mounted) {
                  setState(() {
                    _progressWeightWalker = animationForWalker!.value;
                  });
                }
              });
        _animationControllerForWalker.forward();
        youngManOpacity = 1;
      } else {
        youngManOpacity = 0;
        _animationControllerForWalker.reverse();
      }

      if (_scrollController.offset > _scrollParalaxText5 - 300) {
        animationForHotTubeRight = Tween<double>(begin: -200, end: 0)
            .animate(_animationControllerForHotTubeRight)
              ..addListener(() {
                if (mounted) {
                  setState(() {
                    _progressRightHotTube = animationForHotTubeRight!.value;
                  });
                }
              });
        _animationControllerForHotTubeRight.forward();
      } else {
        _animationControllerForHotTubeRight.reverse();
      }
    });

    super.initState();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'paralax',
        (int viewId) => html.IFrameElement()
          ..width = '1921'
          ..height = '8838'
          ..src = AssetsPath.paralaxHtml
          ..style.border = 'none');
    htm.window.onMessage.listen((event) {
      if (event.data["scroll"] == true) {
        _scrollController.jumpTo((event.data["y"] as num).toDouble());
      }
    });
  }

  @override
  void dispose() {
    _animationControllerForCharacterNikos.dispose();
    _animationControllerForCloudsTop.dispose();
    _animationControllerForMovingLeftAndRightCrows.dispose();
    _animationControllerForProgressLeftFighters.dispose();
    _animationControllerForProgressRightFighters.dispose();
    _animationControllerForWalker.dispose();
    _animationControllerForMovingTopCrows.dispose();
    _videoController.dispose();

    super.dispose();
  }

  Widget get _paralax {
    return HtmlElementView(viewType: "paralax");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: SizedBox(
        child: Stack(
          children: <Widget>[
            if (_videoController.value.isPlaying)
              _videoController.value.isInitialized
                  ? SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController.value.size.width,
                          height: _videoController.value.size.height,
                          child: VideoPlayer(_videoController),
                        ),
                      ),
                    )
                  : const LoadingVideoWidget()
            else
              Stack(
                children: [
                  _paralax,
                  Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 8838,
                    child: PointerInterceptor(
                      child: NotificationListener(
                        onNotification: (event) {
                          if (event is ScrollUpdateNotification) {
                            double value = _scrollController.position.pixels;
                            print("Value $value");
                            htm.window.postMessage(
                                {"scroll": false, "y": value}, "*");
                          }

                          return false;
                        },
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          controller: _scrollController,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 24,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                _topBar,
                                _title,
                                const SizedBox(
                                  height: 3700,
                                ),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerRight,
                                  right: HW.getWidth(238, context),
                                  top: rateCharactersNikosClouds + 100,
                                  text: locals.paralaxText1,
                                  size: Size(HW.getWidth(700, context),
                                      HW.getHeight(216, context)),
                                ),
                                SizedBox(
                                  height: 3000,
                                ),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerLeft,
                                  top: rateLeftCrowd - 300,
                                  size: Size(HW.getWidth(557, context),
                                      HW.getHeight(230, context)),
                                  left: HW.getWidth(157, context),
                                  text: locals.paralaxText2,
                                ),
                                SizedBox(
                                  height: 2500,
                                ),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerRight,
                                  top: rateParalaxCrowdLottie + 200,
                                  right: HW.getWidth(150, context),
                                  size: Size(HW.getWidth(600, context),
                                      HW.getHeight(264, context)),
                                  text: locals.paralaxText3,
                                ),
                                SizedBox(
                                  height: 1000,
                                ),
                                _athens5th(),
                                SizedBox(height: 3000),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerLeft,
                                  top: rateParalaxWalker - 1000,
                                  left: HW.getWidth(250, context),
                                  text: locals.paralaxText4,
                                  size: Size(HW.getWidth(605, context),
                                      HW.getHeight(330, context)),
                                ),
                                SizedBox(height: 6200),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerLeft,
                                  top: rateParalaxHotTubLottie + 850,
                                  left: HW.getWidth(220, context),
                                  text: locals.paralaxText5,
                                  size: Size(HW.getWidth(616, context),
                                      HW.getHeight(268, context)),
                                ),
                                Spacer(),
                                _bottomBar,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            Visibility(
              visible: _videoController.value.isPlaying,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IconButtonWidget(
                  iconSize: HW.getHeight(40, context),
                  onPressed: () {
                    setState(() {
                      _videoController.pause();
                    });
                  },
                  icon: Icon(Icons.arrow_downward),
                ),
              ),
            ),
            Opacity(
              opacity: _topTextOpasyty,
              child: Visibility(
                  visible: !_videoController.value.isPlaying,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin:
                            EdgeInsets.only(bottom: HW.getHeight(48, context)),
                        height: HW.getHeight(52, context),
                        width: HW.getWidth(24, context),
                        child: Image.asset(AssetsPath.scrollIcon)),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget get _bottomBar {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      padding: EdgeInsets.symmetric(horizontal: HW.getWidth(64, context)),
      height: HW.getHeight(161, context),
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
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.push(const PanaromaLeftPageRoute());
                }),
          ),
          Flexible(
            flex: 3,
            child: Text(
              locals.whatNikosDo.toUpperCase(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: TextFontSize.getHeight(36, context),
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
                  LeafDetails.currentVertex = 9;
                  LeafDetails.visitedVertexes.add(9);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.push(const PanaromaRightPageRoute());
                }),
          ),
        ],
      ),
    );
  }

  Widget get _topBar {
    return SoundAndMenuWidget(
      widget: IconButtonWidget(
        color: AppColors.black100,
        iconSize: HW.getHeight(40, context),
        icon: const Icon(Icons.arrow_upward_sharp),
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
      ),
      icons: isSoundOn ? AssetsPath.iconVolumeOn : AssetsPath.iconVolumeOff,
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
    );
  }

  Widget get _title {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.4,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.25,
        left: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(locals.chapter1.toUpperCase()),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(locals.todoNoHarm.toUpperCase(),
                maxLines: 1,
                // minFontSize: 8,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: TextFontSize.getHeight(80, context),
                    fontStyle: FontStyle.italic)),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(color: AppColors.orange, width: 8))),
            child: Text(
              locals.athens429Bc,
              maxLines: 1,
              // minFontSize: 8,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: TextFontSize.getHeight(80, context),
                    fontWeight: FontWeight.w100,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _athens5th() {
    return Container(
      padding: EdgeInsets.only(right: HW.getWidth(115, context)),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Clickable(
        onPressed: () {
          LeafDetails.currentVertex = 4;
          LeafDetails.visitedVertexes.add(4);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.push(const MapPageRoute());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 3,
              child: Text(
                locals.athens5thCentury.toUpperCase(),
                textAlign: TextAlign.end,
                maxLines: 1,
                // minFontSize: 5,
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    fontSize: TextFontSize.getHeight(26, context),
                    color: AppColors.white),
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 37,
                width: 37,
                child: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                  size: 37,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
