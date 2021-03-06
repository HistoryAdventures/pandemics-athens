import 'dart:async';
import 'dart:html' as htm;

import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/parallax_backgroud_sound.dart';
import 'package:history_of_adventures/src/core/utils/shared_preferances_managment.dart';
import 'package:history_of_adventures/src/core/widgets/app_up_button.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/widget/loading_video.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/widget/paralax_text_widget.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:universal_html/html.dart" as html;
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';

class ParalaxHistoryPage extends StatefulWidget {
  final bool? mustScrollToMiddle;
  final bool? mustScrollToEnd;
  final bool? showVideo;
  const ParalaxHistoryPage(
      {this.mustScrollToEnd = false,
      this.mustScrollToMiddle = false,
      this.showVideo = true});
  @override
  _ParalaxHistoryPageState createState() => _ParalaxHistoryPageState();
}

class _ParalaxHistoryPageState extends State<ParalaxHistoryPage>
    with TickerProviderStateMixin {
  late double _scrollLearnMoreText;

  double _topTextOpasyty = 1;

  double _bottomFieldOpasity = 0;
  double youngManOpacity = 0;

  double _lernMoreOpasyty = 0;

  bool paralaxAssetsPreloaded = false;
  // final backgroundplayer = AudioPlayer();

  late AppLocalizations locals;

  late VideoPlayerController _videoController;
  AudioPlayer audioPlayerforParallaxVideo = AudioPlayer();
  AudioPlayer backgroundSound = AudioPlayer();

  final AudioPlayer _currentPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  final AudioPlayer _nextPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  double currentPlayerVol = 0.0;
  double nextPlayerVol = 0.0;

  String? loadingCount;

  bool firstSoundCalledWithInitState = false;
  bool middleSoundCalledWithoutScrolling = false;
  bool lastSoundCalledWithoutScrolling = false;

  List<String> audioAssets = [
    AssetsPath.windSound,
    AssetsPath.nikosPartSound,
    AssetsPath.peopleSound1,
    AssetsPath.peopleSound2,
    AssetsPath.footsteps,
    AssetsPath.cough,
    AssetsPath.water,
  ];

  bool isImageloaded = false;
  bool _lernMoreVisibility = false;
  bool _bottomFieldVizibility = false;

  final ScrollController _scrollController = ScrollController();
  static const _extraScrollSpeed = 100;
  final scaffoldkey = GlobalKey<ScaffoldState>();
  SharedPreferences _sharedPrefs = SharedPreferancesManagment().prefs;

  bool get _mustScrollToEnd => widget.mustScrollToEnd ?? false;
  bool get _mustScrollToMiddle => widget.mustScrollToMiddle ?? false;
  bool? get _showVideo => _sharedPrefs.getBool("showVideo");
  bool _videoEnded = false;

// get position with GlobalKeys

  final GlobalKey _athensButtonKey = GlobalKey();
  final GlobalKey _nikosGifKey = GlobalKey();
  final GlobalKey _nikosText2Key = GlobalKey();
  final GlobalKey _nikosText3Key = GlobalKey();
  final GlobalKey _nikosText4Key = GlobalKey();
  final GlobalKey _nikosText5Key = GlobalKey();
  final GlobalKey _chooseKey = GlobalKey();

  double getObjectPositionByKey(globalKey) {
    RenderBox box = globalKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    double y = position.dy;
    return y;
  }

  double getHeight(globalKey) {
    RenderBox box = globalKey.currentContext!.findRenderObject() as RenderBox;
    Size size = box.size;
    return size.height;
  }

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    height = MediaQuery.of(context).size.height;

    _scrollLearnMoreText = height * 3.8;

    if (loadingCount != "100") {
      getLoadingNumber();
    }

    super.didChangeDependencies();
  }

  bool played = false;
  bool played0 = false;
  bool played1 = false;
  bool played2 = false;
  bool played3 = false;
  bool played4 = false;
  bool played5 = false;
  bool played6 = false;
  bool played7 = false;

  bool playMiddle = false;
  bool playEnd = false;
  int seconds = 1;

  late BackgroundSound _bgSound;

  @override
  void initState() {
    print('initState + history');
    loadingCount = '0';

    seconds = _sharedPrefs.getBool("showLongLoading") == false ? 1 : 10;

    _videoController = VideoPlayerController.asset('assets/paralax_video.mp4')
      ..initialize().then((_) {
        if (!_mustScrollToEnd && !_mustScrollToMiddle && _showVideo!) {
          if (mounted) {
            setState(() {});
          }
        }
      });

    if (!_mustScrollToEnd && !_mustScrollToMiddle && _showVideo!) {
      if (!AudioPlayerUtil.isSoundOn) _videoController.setVolume(0.0);
      // _videoController.setVolume(0.0);

      _videoController.play();

      // Future.delayed(Duration(milliseconds: 500)).then((value) => init());
    }

    if (_mustScrollToEnd == true && _mustScrollToMiddle == false) {
      Future.delayed(Duration(milliseconds: 500)).then((value) => bGSound());
      // playIt(audioAssets.length - 1);
    }

    if (!_mustScrollToEnd && !_mustScrollToMiddle && _showVideo!) {
      _videoController.addListener(() {
        if (_videoController.value.isInitialized &&
            _videoController.value.position ==
                _videoController.value.duration) {
          if (mounted) {
            setState(() {
              _videoEnded = true;
            });
          }
        }
      });
    } else {
      _videoEnded = false;
    }

    NavigationSharedPreferences.getNavigationListFromSF();

    _scrollController.addListener(() {
      if (_mustScrollToEnd || _mustScrollToMiddle) {
        _topTextOpasyty = 0;
        return;
      }
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
      // setState(() {});
    });

    htm.window.onMessage.listen((event) {
      if (event.data == "paralaxAssetsLoaded") {}
      // print("receied message from js ${event.data}");
      if (mounted) {
        setState(() {
          paralaxAssetsPreloaded = true;
        });
      }
    });

    super.initState();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'paralax',
        (int viewId) => html.IFrameElement()
          ..width = '1921'
          // ..height = '8838'
          ..src = AssetsPath.paralaxHtml
          ..style.border = 'none');
  }

  Future init() async {
    await audioPlayerforParallaxVideo.play(AssetsPath.parallaxVideoSound,
        volume: AudioPlayerUtil.isSoundOn ? 1.0 : 0.0);
  }

  Future<void> firebaseScreenTracking() async {
    // await FirebaseAnalytics.instance.setCurrentScreen(screenName: '/glossary-pageeeee');
    await FirebaseAnalytics.instance.logEvent(
        name: "to-do-no-harm",
        parameters: {
          "page_url": "https://pandemics.historyadventures.app/to-do-no-harm"
        });

    await FirebaseAnalytics.instance.logScreenView(screenName: "to-do-no-harm");
  }

  Future bGSound() async {
    BackgroundSound(
        assetName: AssetsPath.parallaxBgSound, pageName: 'paralax_history');
    BackgroundSound.doAction(
      PlayerAction.play,
    );

    BackgroundSound.doAction(
      AudioPlayerUtil.isSoundOn ? PlayerAction.unmute : PlayerAction.mute,
    );
  }

  @override
  void dispose() {
    print('dispose + history');
    if (mounted) {
      BackgroundSound.doAction(
        PlayerAction.pause,
        pageName: 'paralax_history',
      );
      audioPlayerforParallaxVideo.dispose();
    }

    backgroundSound.dispose();
    _currentPlayer.dispose();
    _nextPlayer.dispose();
    _videoController.dispose();

    super.dispose();
  }

  void getLoadingNumber() {
    Timer.periodic(const Duration(milliseconds: 100), (t) {
      if (int.parse(loadingCount!) == 100) {
        t.cancel();
        return;
      }

      setState(() {
        loadingCount = (int.parse(loadingCount!) + 1).toString();
      });
    });
  }

  Widget get _paralax {
    return HtmlElementView(viewType: "paralax");
  }

  Widget get _loading => !_videoController.value.isInitialized
      ? const LoadingVideoWidget()
      : Container();

  Widget get _video =>
      _videoController.value.isInitialized && _videoController.value.isPlaying
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
          : Container();

  bool scrolled = false;
  bool showLoading = true;

  Future<void> turnOffVolume(AudioPlayer player) async {
    if (!AudioPlayerUtil.isSoundOn) {
      player.setVolume(0);
    } else {
      await player.setVolume(0.9);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(0.7);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(0.5);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(0.3);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(0.1);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(0);
    }

    player.pause();
  }

  Future<void> turnOnVolume(AudioPlayer player) async {
    if (!AudioPlayerUtil.isSoundOn) {
      await player.setVolume(0);
    } else {
      await player.setVolume(0.1);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(0.3);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(0.5);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(0.7);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(0.9);
      await Future.delayed(const Duration(milliseconds: 200));
      await player.setVolume(1);
    }
  }

  void mute() {
    BackgroundSound.doAction(PlayerAction.mute);
    _currentPlayer.setVolume(0);
    _nextPlayer.setVolume(0);
  }

  void unmute() {
    BackgroundSound.doAction(PlayerAction.unmute);
    _currentPlayer.setVolume(currentPlayerVol);
    _nextPlayer.setVolume(nextPlayerVol);
  }

  Future<void> playIt(int index) async {
    if (index.isOdd) {
      turnOffVolume(_nextPlayer);

      await _currentPlayer.setVolume(0.0);
      await _currentPlayer.play(audioAssets[index]);
      _currentPlayer.setReleaseMode(ReleaseMode.LOOP);

      turnOnVolume(_currentPlayer);

      currentPlayerVol = 1.0;
      nextPlayerVol = 0.0;
    } else {
      turnOffVolume(_currentPlayer);

      await _nextPlayer.setVolume(0.0);
      await _nextPlayer.play(audioAssets[index]);
      _nextPlayer.setReleaseMode(ReleaseMode.LOOP);
      turnOnVolume(_nextPlayer);

      currentPlayerVol = 0.0;
      nextPlayerVol = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (_mustScrollToMiddle && !scrolled) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          scrolled = true;
          Scrollable.ensureVisible(_athensButtonKey.currentContext!,
              alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
              curve: Curves.ease);
        });
      }
      if (_mustScrollToEnd && !scrolled) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          scrolled = true;
          Scrollable.ensureVisible(_chooseKey.currentContext!,
              curve: Curves.ease);
        });
      }
    });

    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (firstSoundCalledWithInitState == false) {
          if (getObjectPositionByKey(_nikosGifKey) -
                  getHeight(_nikosGifKey) * 5 >
              20) {
            if (!played0) {
              played0 = true;
              played1 = false;
              played2 = false;
              played3 = false;
              played4 = false;
              played5 = false;
              played6 = false;

              playIt(0);
            }
          }
        }

        if (getObjectPositionByKey(_nikosGifKey) - getHeight(_nikosGifKey) * 5 <
                20 &&
            getObjectPositionByKey(_nikosText2Key) -
                    getHeight(_nikosText2Key) * 2 >
                20) {
          if (!played1) {
            played1 = true;
            played0 = false;
            played2 = false;
            played3 = false;
            played4 = false;
            played5 = false;
            played6 = false;
            firstSoundCalledWithInitState = false;

            playIt(1);
          }
        }

        if (getObjectPositionByKey(_nikosText2Key) -
                    getHeight(_nikosText2Key) * 2 <
                20 &&
            getObjectPositionByKey(_nikosText3Key) -
                    getHeight(_nikosText3Key) * 2 >
                20) {
          if (!played2) {
            played2 = true;
            played0 = false;
            played1 = false;
            played3 = false;
            played4 = false;
            played5 = false;
            played6 = false;
            firstSoundCalledWithInitState = false;
            middleSoundCalledWithoutScrolling = false;

            playIt(2);
          }
        }

        if (middleSoundCalledWithoutScrolling == false) {
          if (getObjectPositionByKey(_nikosText3Key) -
                      getHeight(_nikosText3Key) * 2 <
                  20 &&
              getObjectPositionByKey(_nikosText4Key) -
                      getHeight(_nikosText4Key) * 1.5 >
                  20) {
            if (!played3) {
              played3 = true;
              played0 = false;
              played1 = false;
              played2 = false;
              played4 = false;
              played5 = false;
              played6 = false;
              firstSoundCalledWithInitState = false;
              lastSoundCalledWithoutScrolling = false;

              playIt(3);
            }
          }
        }

        if (getObjectPositionByKey(_nikosText4Key) -
                    getHeight(_nikosText4Key) * 1.5 <
                20 &&
            getObjectPositionByKey(_nikosText5Key) -
                    getHeight(_nikosText5Key) * 4.5 >
                10) {
          if (!played4) {
            played4 = true;
            played0 = false;
            played1 = false;
            played2 = false;
            played3 = false;
            played5 = false;
            played6 = false;
            firstSoundCalledWithInitState = false;
            middleSoundCalledWithoutScrolling = false;
            lastSoundCalledWithoutScrolling = false;

            playIt(4);
          }
        }

        if (getObjectPositionByKey(_nikosText5Key) -
                    getHeight(_nikosText5Key) * 4.5 <
                10 &&
            getObjectPositionByKey(_nikosText5Key) > 0) {
          if (!played5) {
            played5 = true;
            played0 = false;
            played1 = false;
            played2 = false;
            played3 = false;
            played4 = false;
            played6 = false;
            firstSoundCalledWithInitState = false;
            middleSoundCalledWithoutScrolling = false;
            lastSoundCalledWithoutScrolling = false;

            playIt(5);
          }
        }

        if (lastSoundCalledWithoutScrolling == false) {
          if (getObjectPositionByKey(_nikosText5Key) < 0) {
            if (!played6) {
              played6 = true;
              played0 = false;
              played1 = false;
              played2 = false;
              played3 = false;
              played4 = false;
              played5 = false;
              firstSoundCalledWithInitState = false;
              middleSoundCalledWithoutScrolling = false;

              playIt(6);
            }
          }
        }

        return true;
      },
      child: Stack(
        children: [
          Scaffold(
            key: scaffoldkey,
            endDrawer: const NavigationPage(),
            body: SizedBox(
              child: Stack(
                children: <Widget>[
                  if (!_mustScrollToEnd && !_mustScrollToMiddle && _showVideo!)
                    _loading,
                  if (!_mustScrollToEnd && !_mustScrollToMiddle && _showVideo!)
                    _video,
                  if (_videoEnded ||
                      _mustScrollToEnd ||
                      _mustScrollToMiddle ||
                      !_showVideo!)
                    Builder(
                      builder: (c) {
                        Future.delayed(Duration(seconds: seconds)).then((v) {
                          if (mounted) {
                            setState(() {
                              paralaxAssetsPreloaded = true;
                            });
                          }
                          _sharedPrefs.setBool("showLongLoading", false);
                          if (_mustScrollToMiddle && !playMiddle) {
                            playIt(3);
                            playMiddle = true;
                            middleSoundCalledWithoutScrolling = true;
                          }

                          if (_mustScrollToEnd && !playEnd) {
                            playIt(6);
                            playEnd = true;
                            lastSoundCalledWithoutScrolling = true;
                          } else if (!played) {
                            played = true;
                            bGSound();
                            if (_mustScrollToEnd != true &&
                                _mustScrollToMiddle != true) {
                              playIt(0);
                              firstSoundCalledWithInitState = true;
                            }
                          }
                        });

                        return Stack(
                          children: [
                            _paralax,
                            Container(
                              // height: 8838,
                              child: PointerInterceptor(
                                child: NotificationListener(
                                  onNotification: (event) {
                                    if (event is ScrollUpdateNotification) {
                                      double value =
                                          _scrollController.position.pixels;
                                      htm.window.postMessage(
                                          {"scroll": false, "y": value}, "*");
                                    }

                                    return false;
                                  },
                                  child: Stack(
                                    children: [
                                      SingleChildScrollView(
                                        padding: EdgeInsets.zero,
                                        controller: _scrollController,
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              (24 / 2.45),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: HW.getWidth(
                                                        60, context),
                                                    right: HW.getWidth(
                                                        60, context),
                                                    top: HW.getHeight(
                                                        52, context),
                                                    bottom: 0),
                                                child: AppUpButton(
                                                  onTap: () {
                                                    LeafDetails.currentVertex =
                                                        1;
                                                    LeafDetails.visitedVertexes
                                                        .add(1);
                                                    NavigationSharedPreferences
                                                        .upDateShatedPreferences();
                                                    context.router.replace(
                                                        const GlossaryPageToBottom());
                                                  },
                                                ),
                                              ),
                                              _title,
                                              SizedBox(
                                                height:
                                                    HW.getHeight(1500, context),
                                              ),
                                              ParalaxTextWidget(
                                                key: _nikosGifKey,
                                                alignment:
                                                    Alignment.centerRight,
                                                right:
                                                    HW.getWidth(238, context),
                                                text: locals.paralaxText1,
                                                size: Size(
                                                    HW.getWidth(700, context),
                                                    HW.getHeight(216, context)),
                                              ),
                                              SizedBox(
                                                height:
                                                    HW.getHeight(850, context),
                                              ),
                                              ParalaxTextWidget(
                                                key: _nikosText2Key,
                                                alignment: Alignment.centerLeft,
                                                size: Size(
                                                    HW.getWidth(557, context),
                                                    HW.getHeight(230, context)),
                                                left: HW.getWidth(157, context),
                                                text: locals.paralaxText2,
                                              ),
                                              SizedBox(
                                                height:
                                                    HW.getHeight(1250, context),
                                              ),
                                              ParalaxTextWidget(
                                                key: _nikosText3Key,
                                                alignment:
                                                    Alignment.centerRight,
                                                right:
                                                    HW.getWidth(150, context),
                                                size: Size(
                                                    HW.getWidth(600, context),
                                                    HW.getHeight(264, context)),
                                                text: locals.paralaxText3,
                                              ),
                                              SizedBox(
                                                height:
                                                    HW.getHeight(650, context),
                                              ),
                                              _athens5th(),
                                              SizedBox(
                                                  key: _athensButtonKey,
                                                  height: HW.getHeight(
                                                      450, context)),
                                              ParalaxTextWidget(
                                                key: _nikosText4Key,
                                                alignment: Alignment.centerLeft,
                                                left: HW.getWidth(250, context),
                                                text: locals.paralaxText4,
                                                size: Size(
                                                    HW.getWidth(605, context),
                                                    HW.getHeight(330, context)),
                                              ),
                                              SizedBox(
                                                  height: HW.getHeight(
                                                      2300, context)),
                                              ParalaxTextWidget(
                                                key: _nikosText5Key,
                                                alignment: Alignment.centerLeft,
                                                left: HW.getWidth(220, context),
                                                text: locals.paralaxText5,
                                                size: Size(
                                                    HW.getWidth(616, context),
                                                    HW.getHeight(268, context)),
                                              ),
                                              Spacer(),
                                              _bottomBar,
                                            ],
                                          ),
                                        ),
                                      ),
                                      _topBar(true),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (!paralaxAssetsPreloaded)
                              Align(
                                alignment: Alignment.center,
                                child: seconds == 1
                                    ? const LoadingVideoWidget()
                                    : LoadingWidget(
                                        loadingCound: loadingCount,
                                        userIteract: false),
                              ),
                          ],
                        );
                      },
                    ),
                  Visibility(
                    visible: _videoController.value.isPlaying,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButtonWidget(
                        iconSize: HW.getHeight(40, context),
                        onPressed: () {
                          if (mounted) {
                            setState(() {
                              _videoController.pause();
                              audioPlayerforParallaxVideo.dispose();

                              _videoEnded = true;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _videoController.value.isPlaying,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: _topBar(true),
                    ),
                  ),
                  Opacity(
                    opacity: _topTextOpasyty,
                    child: Visibility(
                        visible: !_videoController.value.isPlaying,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: EdgeInsets.only(
                                  bottom: HW.getHeight(48, context)),
                              height: HW.getHeight(52, context),
                              width: HW.getWidth(24, context),
                              child: Image.asset(AssetsPath.scrollIcon)),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
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
                  audioPlayerforParallaxVideo.dispose();
                  AudioPlayerUtil().playSound(AssetsPath.screenTransitionSound);
                  // backgroundSound.dispose();
                  _nextPlayer.dispose();
                  _currentPlayer.dispose();

                  LeafDetails.currentVertex = 8;
                  LeafDetails.visitedVertexes.add(8);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.replace(const PanaromaLeftPageRoute());
                }),
          ),
          Flexible(
            key: _chooseKey,
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
                  audioPlayerforParallaxVideo.dispose();
                  AudioPlayerUtil().playSound(AssetsPath.screenTransitionSound);
                  _nextPlayer.dispose();
                  _currentPlayer.dispose();
                  // backgroundSound.dispose();
                  LeafDetails.currentVertex = 9;
                  LeafDetails.visitedVertexes.add(9);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  // context.router.replace(const PanaromaRightPageRoute());
                  context.router.replace(const PanaromaRightPageRoute());
                }),
          ),
        ],
      ),
    );
  }

  Widget _topBar(bool isOnVideo) {
    return SoundAndMenuWidget(
      widget: isOnVideo
          ? SizedBox()
          : AppUpButton(
              onTap: () {
                LeafDetails.currentVertex = 1;
                LeafDetails.visitedVertexes.add(1);
                NavigationSharedPreferences.upDateShatedPreferences();
                context.router.replace(const GlossaryPageToBottom());
              },
            ),
      icons: AudioPlayerUtil.isSoundOn
          ? AssetsPath.iconVolumeOn
          : AssetsPath.iconVolumeOff,
      onTapVolume: AudioPlayerUtil.isSoundOn
          ? () {
              mute();
              if (mounted) {
                setState(() {
                  AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                  audioPlayerforParallaxVideo.setVolume(0.0);
                  _videoController.setVolume(0.0);

                  backgroundSound.stop();
                });
              }
            }
          : () {
              unmute();
              if (mounted) {
                setState(() {
                  AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                  backgroundSound.resume();
                  backgroundSound.setVolume(0.5);
                  audioPlayerforParallaxVideo.setVolume(1.0);
                  _videoController.setVolume(1.0);
                });
              }
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
        top: HW.getHeight(183, context),
        left: HW.getWidth(177, context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              " ${locals.chapter1.toUpperCase()}",
              style: TextStyle(
                fontSize: HW.getHeight(25.68, context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(locals.todoNoHarm.toUpperCase(),
                maxLines: 1,

                // minFontSize: 8,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: TextFontSize.getHeight(105, context),
                      height: 1.4,
                    )),
          ),
          SizedBox(height: HW.getHeight(17, context)),
          Container(
            padding: EdgeInsets.only(left: HW.getWidth(10, context)),
            height: HW.getHeight(83, context),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
              color: AppColors.orange,
              width: HW.getWidth(10, context),
            ))),
            child: Text(
              locals.athens429Bc,
              maxLines: 1,
              // minFontSize: 8,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: TextFontSize.getHeight(65, context),
                    fontWeight: FontWeight.w100,
                    height: 1,
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
          // backgroundSound.stop();
          // _currentPlayer.stop();
          context.router.replace(const MapPageRoute());

          // backgroundSound.stop();
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

class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({required ScrollPhysics parent})
      : super(parent: parent);

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 200,
        stiffness: 200,
        damping: 2,
      );
}

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({required ScrollPhysics parent})
      : super(parent: parent);

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    final tolerance = this.tolerance;
    if ((velocity.abs() < tolerance.velocity) ||
        (velocity > 0.0 && position.pixels >= position.maxScrollExtent) ||
        (velocity < 0.0 && position.pixels <= position.minScrollExtent)) {
      return null;
    }
    return ClampingScrollSimulation(
      position: position.pixels,
      velocity: velocity,
      friction: 1000, // <--- HERE
      tolerance: tolerance,
    );
  }
}
