import 'dart:html' as htm;
import 'dart:math';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
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

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import 'package:audioplayers/audioplayers.dart';

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

  bool isSoundOn = true;
  bool paralaxAssetsPreloaded = false;
  // final backgroundplayer = AudioPlayer();

  late AppLocalizations locals;

  late VideoPlayerController _videoController;
  AudioPlayer audioPlayerforParallaxVideo = AudioPlayer();
  AudioPlayer audioPlayerforWind = AudioPlayer();
  AudioPlayer nikosPart = AudioPlayer();
  AudioPlayer backgroundSound = AudioPlayer();
  AudioPlayer audioPlayerforPeople1 = AudioPlayer();
  AudioPlayer audioPlayerforPeople2 = AudioPlayer();
  AudioPlayer footsteps = AudioPlayer();
  AudioPlayer cough = AudioPlayer();
  AudioPlayer water = AudioPlayer();
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

  @override
  void initState() {
    _videoController = VideoPlayerController.asset('assets/paralax_video.mp4')
      ..initialize().then((_) {
        if (!_mustScrollToEnd && !_mustScrollToMiddle && _showVideo!) {
          setState(() {});
        }
      });

    if (!_mustScrollToEnd && !_mustScrollToMiddle && _showVideo!) {
      _videoController.setVolume(0.0);

      _videoController.play();

      Future.delayed(Duration(milliseconds: 500)).then((value) => init());
    }

    if (!_mustScrollToEnd && !_mustScrollToMiddle && _showVideo!) {
      _videoController.addListener(() {
        if (_videoController.value.isInitialized &&
            _videoController.value.position ==
                _videoController.value.duration) {
          setState(() {
            _videoEnded = true;
          });
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
        print("code is here");
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
      print("receied message from js ${event.data}");
      setState(() {
        paralaxAssetsPreloaded = true;
      });
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
   
    await audioPlayerforParallaxVideo.play(AssetsPath.parallaxVideoSound);
  }

  Future plaWindSound() async {
    final int? result = await audioPlayerforWind.play(AssetsPath.windSound);
    await audioPlayerforWind.setReleaseMode(ReleaseMode.LOOP);
  }

  Future playNikosPartSound() async {
    final int? result = await nikosPart.play(AssetsPath.nikosPartSound);
    await nikosPart.setReleaseMode(ReleaseMode.LOOP);
    nikosPart.stop();
  }

  Future playPeople1Sound() async {
    final int? result = await audioPlayerforPeople1.play(
      AssetsPath.peopleSound1,
    );

    await audioPlayerforPeople1.setReleaseMode(ReleaseMode.LOOP);
    audioPlayerforPeople1.stop();
  }

  Future playPeople2Sound() async {
    final int? result = await audioPlayerforPeople2.play(
      AssetsPath.peopleSound2,
    );
    await audioPlayerforPeople2.setReleaseMode(ReleaseMode.LOOP);
    audioPlayerforPeople2.stop();
  }

  Future footSteps() async {
    final int? result = await footsteps.play(AssetsPath.footsteps);
    await footsteps.setReleaseMode(ReleaseMode.LOOP);
    footsteps.stop();
  }

  Future coughSound() async {
    final int? result = await cough.play(AssetsPath.cough, volume: 0.0);
    await cough.setReleaseMode(ReleaseMode.LOOP);
    footsteps.stop();
  }

  Future waterSound() async {
    final int? result = await water.play(AssetsPath.water, volume: 0.0);
    await water.setReleaseMode(ReleaseMode.LOOP);
  }

  Future bGSound() async {
    final int? bgResult =
        await backgroundSound.play(AssetsPath.parallaxBgSound, volume: 0.5);
    await backgroundSound.setReleaseMode(ReleaseMode.LOOP);
  }

  @override
  void dispose() {
    audioPlayerforParallaxVideo.dispose();
    audioPlayerforWind.dispose();
    nikosPart.dispose();
    backgroundSound.dispose();
    audioPlayerforPeople1.dispose();
    audioPlayerforPeople2.dispose();
    water.dispose();
    footsteps.dispose();
    cough.dispose();
    super.dispose();
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

        final ScrollDirection direction = notification.direction;

        if (direction == ScrollDirection.reverse) {
          if (getObjectPositionByKey(_nikosGifKey) -
                  getHeight(_nikosGifKey) * 5 <
              20) {
            if (!played1) {
              played1 = true;

              if (audioPlayerforWind.state == PlayerState.PAUSED) {
                audioPlayerforWind.resume();
              }
              audioPlayerforWind.setVolume(0.8);
              audioPlayerforWind.setVolume(0.7);
              audioPlayerforWind.setVolume(0.6);
              audioPlayerforWind.setVolume(0.4);
              // cough.setVolume(0.0);

              Future.delayed(Duration(seconds: 1)).then((value) {
                // nikosPart.seek(Duration(milliseconds: 0));
                // nikosPart.setVolume(1.0);
                nikosPart.seek(Duration(milliseconds: 0));
                nikosPart.setVolume(1.0);
                nikosPart.resume();
              });
              Future.delayed(Duration(seconds: 2)).then((value) {
                audioPlayerforWind.setVolume(0.2);
                audioPlayerforWind.setVolume(0.0);
                audioPlayerforWind.stop();
              });
            }
          }

          if (getObjectPositionByKey(_nikosText2Key) -
                  getHeight(_nikosText2Key) * 2 <
              20) {
            if (!played2) {
              played2 = true;
              if (nikosPart.state == PlayerState.PAUSED) {
                nikosPart.resume();
              }
              nikosPart.setVolume(0.8);
              nikosPart.setVolume(0.6);
              nikosPart.setVolume(0.4);
              if (audioPlayerforPeople1.state == PlayerState.STOPPED) {
                audioPlayerforPeople1.resume();
              }
              audioPlayerforPeople1.seek(Duration(milliseconds: 0));
              audioPlayerforPeople1.setVolume(1.0);

              Future.delayed(Duration(seconds: 2)).then((value) {
                nikosPart.setVolume(0.2);
                nikosPart.setVolume(0.0);
                nikosPart.stop();
              });
            }
          }

          if (getObjectPositionByKey(_nikosText3Key) -
                  getHeight(_nikosText3Key) * 2 <
              20) {
            if (!played3) {
              played3 = true;
              if (audioPlayerforPeople1.state == PlayerState.STOPPED) {
                audioPlayerforPeople1.resume();
                audioPlayerforPeople1.setVolume(1.0);
              }

              audioPlayerforPeople1.setVolume(0.8);
              audioPlayerforPeople1.setVolume(0.6);
              audioPlayerforPeople1.setVolume(0.4);

              Future.delayed(Duration(seconds: 2)).then((value) {
                if (audioPlayerforPeople2.state == PlayerState.STOPPED) {
                  audioPlayerforPeople2.seek(Duration(milliseconds: 0));
                  audioPlayerforPeople2.setVolume(1.0);
                  audioPlayerforPeople2.resume();
                }
              });
              Future.delayed(Duration(seconds: 2)).then((value) {
                audioPlayerforPeople1.setVolume(0.2);
                audioPlayerforPeople1.setVolume(0.0);
                audioPlayerforPeople1.stop();
              });


            }
          }

          if (getObjectPositionByKey(_nikosText4Key) -
                  getHeight(_nikosText4Key) * 1.5 <
              20) {
            if (!played4) {
              played4 = true;
    

              if (audioPlayerforPeople2.state == PlayerState.STOPPED) {
                audioPlayerforPeople2.resume();
              }
              audioPlayerforPeople2.setVolume(0.8);
              audioPlayerforPeople2.setVolume(0.6);
              audioPlayerforPeople2.setVolume(0.4);

              Future.delayed(Duration(seconds: 2)).then((value) {
                if (footsteps.state == PlayerState.STOPPED) {
                  footsteps.seek(Duration(milliseconds: 0));
                  footsteps.setVolume(1.0);
                  footsteps.resume();
                }
              });
    
              Future.delayed(Duration(seconds: 2)).then((value) {
                audioPlayerforPeople2.setVolume(0.2);
                audioPlayerforPeople2.setVolume(0.0);
                audioPlayerforPeople2.stop();
              });

            }
          }

          if (getObjectPositionByKey(_nikosText5Key) -
                  getHeight(_nikosText5Key) * 4.5 <
              10) {
            if (!played5) {
              played5 = true;

              if (footsteps.state == PlayerState.STOPPED) {
                footsteps.resume();
              }
              footsteps.setVolume(0.8);
              footsteps.setVolume(0.6);
              footsteps.setVolume(0.4);

              Future.delayed(Duration(seconds: 1)).then((value) {
                if (cough.state == PlayerState.PAUSED) {
                  cough.seek(Duration(milliseconds: 0));
                  cough.setVolume(1.0);
                  cough.resume();
                }
              });

              Future.delayed(Duration(seconds: 1)).then((value) {
                footsteps.setVolume(0.2);
                footsteps.setVolume(0.0);
                footsteps.stop();
              });

            }
          }

          if (getObjectPositionByKey(_nikosText5Key) < 0) {
            if (!played6) {
              played6 = true;

              cough.setVolume(1.0);
              if (cough.state == PlayerState.STOPPED) {
                cough.resume();
              }
              cough.setVolume(0.8);
              cough.setVolume(0.6);
              cough.setVolume(0.4);

              Future.delayed(Duration(seconds: 1)).then((value) {
                water.seek(Duration(milliseconds: 0));
                water.setVolume(1.0);

                if (water.state == PlayerState.STOPPED) {
                  water.resume();
                }
              });
             
              Future.delayed(Duration(seconds: 1)).then((value) {
                cough.setVolume(0.2);
                cough.setVolume(0.0);
                cough.stop();
              });
            }
            // }
          }
        }
  
        if (direction == ScrollDirection.forward) {
          if (getObjectPositionByKey(_nikosGifKey) -
                      getHeight(_nikosGifKey) * 5 >
                  20 &&
              getObjectPositionByKey(_nikosGifKey) -
                      getHeight(_nikosGifKey) * 5 <
                  200) {
            played0 = false;
            played1 = false;
            played2 = false;
            played3 = false;
            played4 = false;
            played5 = false;
            played6 = false;
            played7 = false;

            if (audioPlayerforPeople1.state == PlayerState.PLAYING) {
              audioPlayerforPeople1.stop();
            }
            if (audioPlayerforPeople2.state == PlayerState.PLAYING) {
              audioPlayerforPeople2.stop();
            }
            if (water.state == PlayerState.PLAYING) {
              water.stop();
            }
            if (footsteps.state == PlayerState.PLAYING) {
              footsteps.stop();
            }
            if (cough.state == PlayerState.PLAYING) {
              cough.stop();
            }
            if (nikosPart.state == PlayerState.STOPPED) {
              nikosPart.resume();
            }

            nikosPart.setVolume(0.8);
            nikosPart.setVolume(0.6);
            nikosPart.setVolume(0.4);

            Future.delayed(Duration(seconds: 1)).then((value) {
              if (audioPlayerforWind.state == PlayerState.STOPPED) {
                audioPlayerforWind.resume();
              }
              audioPlayerforWind.seek(Duration(milliseconds: 0));
              audioPlayerforWind.setVolume(1.0);
            });
            Future.delayed(Duration(seconds: 1)).then((value) {
              nikosPart.setVolume(0.2);
              nikosPart.setVolume(0.0);
            });
          }

          if (getObjectPositionByKey(_nikosText2Key) -
                      getHeight(_nikosText2Key) * 2 >
                  50 &&
              getObjectPositionByKey(_nikosText2Key) -
                      getHeight(_nikosText2Key) * 2 <
                  150) {

            played0 = false;
            played1 = false;
            played2 = false;
            played3 = false;
            played4 = false;
            played5 = false;
            played6 = false;
            played7 = false;

            if (audioPlayerforPeople2.state == PlayerState.PLAYING) {
              audioPlayerforPeople2.stop();
            }
            if (water.state == PlayerState.PLAYING) {
              water.stop();
            }
            if (footsteps.state == PlayerState.PLAYING) {
              footsteps.stop();
            }
            if (cough.state == PlayerState.PLAYING) {
              cough.stop();
            }
            if (audioPlayerforPeople1.state == PlayerState.STOPPED) {
              audioPlayerforPeople1.resume();
            }

            audioPlayerforPeople1.setVolume(0.8);
            audioPlayerforPeople1.setVolume(0.6);
            audioPlayerforPeople1.setVolume(0.4);

            Future.delayed(Duration(seconds: 1)).then((value) {
              if (nikosPart.state == PlayerState.STOPPED) {
                nikosPart.resume();
              }
              nikosPart.seek(Duration(milliseconds: 0));
              nikosPart.setVolume(1.0);
            });
            Future.delayed(Duration(seconds: 1)).then((value) {
              audioPlayerforPeople1.setVolume(0.2);
              audioPlayerforPeople1.setVolume(0.0);
            });
          }

          if (getObjectPositionByKey(_nikosText3Key) -
                      getHeight(_nikosText3Key) * 2 >
                  10 &&
              getObjectPositionByKey(_nikosText3Key) -
                      getHeight(_nikosText3Key) * 2 <
                  50) {
            played0 = false;
            played1 = false;
            played2 = false;
            played3 = false;
            played4 = false;
            played5 = false;
            played6 = false;
            played7 = false;

            if (water.state == PlayerState.PLAYING) {
              water.stop();
            }
            if (footsteps.state == PlayerState.PLAYING) {
              footsteps.stop();
            }
            if (cough.state == PlayerState.PLAYING) {
              cough.stop();
            }

            if (audioPlayerforPeople2.state == PlayerState.STOPPED) {
              audioPlayerforPeople2.resume();
            }

            audioPlayerforPeople2.setVolume(0.8);
            audioPlayerforPeople2.setVolume(0.6);
            audioPlayerforPeople2.setVolume(0.4);

            Future.delayed(Duration(seconds: 1)).then((value) {
              if (audioPlayerforPeople1.state == PlayerState.STOPPED) {
                audioPlayerforPeople1.resume();
              }

              audioPlayerforPeople1.seek(Duration(milliseconds: 0));
              audioPlayerforPeople1.setVolume(1.0);
            });
            Future.delayed(Duration(seconds: 1)).then((value) {
              audioPlayerforPeople2.setVolume(0.2);
              audioPlayerforPeople2.setVolume(0.0);
            });
          }

          if (getObjectPositionByKey(_nikosText4Key) -
                      getHeight(_nikosText4Key) * 1.5 >
                  10 &&
              getObjectPositionByKey(_nikosText4Key) -
                      getHeight(_nikosText4Key) * 1.5 <
                  90) {
            played0 = false;
            played1 = false;
            played2 = false;
            played3 = false;
            played4 = false;
            played5 = false;
            played6 = false;
            played7 = false;
            if (audioPlayerforPeople1.state == PlayerState.PLAYING) {
              audioPlayerforPeople1.stop();
            }

            if (water.state == PlayerState.PLAYING) {
              water.stop();
            }

            if (cough.state == PlayerState.PLAYING) {
              cough.stop();
            }

            footsteps.setVolume(0.8);
            footsteps.setVolume(0.6);
            footsteps.setVolume(0.4);

            Future.delayed(Duration(seconds: 1)).then((value) {
              if (audioPlayerforPeople2.state == PlayerState.STOPPED) {
                audioPlayerforPeople2.resume();
              }
              audioPlayerforPeople2.seek(Duration(milliseconds: 0));
              audioPlayerforPeople2.setVolume(1.0);
            });
            Future.delayed(Duration(seconds: 1)).then((value) {
              if (footsteps.state == PlayerState.STOPPED) {
                footsteps.resume();
              }
              footsteps.setVolume(0.2);
              footsteps.setVolume(0.0);
            });
          }

          if (getObjectPositionByKey(_nikosText5Key) -
                      getHeight(_nikosText5Key) * 7 >
                  10 &&
              getObjectPositionByKey(_nikosText5Key) -
                      getHeight(_nikosText5Key) * 7 <
                  90) {
            played0 = false;
            played1 = false;
            played2 = false;
            played3 = false;
            played4 = false;
            played5 = false;
            played6 = false;
            played7 = false;
            cough.setVolume(0.8);
            cough.setVolume(0.6);
            cough.setVolume(0.4);

            Future.delayed(Duration(seconds: 1)).then((value) {
              footsteps.seek(Duration(milliseconds: 0));
              footsteps.setVolume(1.0);
            });
            Future.delayed(Duration(seconds: 1)).then((value) {
              cough.setVolume(0.2);
              cough.setVolume(0.0);
            });
          }

          if (getObjectPositionByKey(_nikosText5Key) > 10 &&
              getObjectPositionByKey(_nikosText5Key) < 100) {
            played0 = false;
            played1 = false;
            played2 = false;
            played3 = false;
            played4 = false;
            played5 = false;
            played6 = false;
            played7 = false;
            water.setVolume(0.8);
            water.setVolume(0.6);
            water.setVolume(0.4);

            Future.delayed(Duration(seconds: 1)).then((value) {
              cough.seek(Duration(milliseconds: 0));
              cough.setVolume(1.0);
            });
            Future.delayed(Duration(seconds: 1)).then((value) {
              water.setVolume(0.2);
              water.setVolume(0.0);
            });
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
                        int seconds =
                            _sharedPrefs.getBool("showLongLoading") == false
                                ? 2
                                : 10;
                        Future.delayed(Duration(seconds: seconds)).then((v) {
                          setState(() {
                            paralaxAssetsPreloaded = true;
                          });

                          _sharedPrefs.setBool("showLongLoading", false);

                          if (_mustScrollToEnd) {
                            if (!played7) {
                              print("played7");
                              waterSound();
                              water.setVolume(1.0);
                              played7 = true;
                            }
                          } else if (!played) {
                            played = true;
                            plaWindSound();
                            bGSound();
                            playNikosPartSound();
                            playPeople1Sound();
                            playPeople2Sound();
                            footSteps();
                            coughSound();
                            waterSound();
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
                                                    HW.getHeight(1700, context),
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
                              const Align(
                                alignment: Alignment.center,
                                child: LoadingVideoWidget(),
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
                          setState(() {
                            _videoController.pause();
                            audioPlayerforParallaxVideo.dispose();

                            _videoEnded = true;
                          });
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
                  audioPlayerforWind.dispose();
                  nikosPart.dispose();
                  backgroundSound.dispose();
                  audioPlayerforPeople1.dispose();
                  audioPlayerforPeople2.dispose();
                  water.dispose();
                  footsteps.dispose();
                  cough.dispose();
                  LeafDetails.currentVertex = 8;
                  LeafDetails.visitedVertexes.add(8);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.push(const PanaromaLeftPageRoute());
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
                  audioPlayerforWind.dispose();
                  nikosPart.dispose();
                  backgroundSound.dispose();
                  audioPlayerforPeople1.dispose();
                  audioPlayerforPeople2.dispose();
                  water.dispose();
                  footsteps.dispose();
                  cough.dispose();
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
      icons: isSoundOn ? AssetsPath.iconVolumeOn : AssetsPath.iconVolumeOff,
      onTapVolume: isSoundOn
          ? () {
              setState(() {
                isSoundOn = !isSoundOn;
                // audioPlayerforParallaxVideo.setVolume(0.0);
                audioPlayerforWind.stop();
                nikosPart.stop();
                backgroundSound.stop();
                audioPlayerforPeople1.stop();
                audioPlayerforPeople2.stop();
                water.stop();
                footsteps.stop();
                cough.stop();
              });
            }
          : () {
              setState(() {
                isSoundOn = !isSoundOn;
                backgroundSound.resume();
                backgroundSound.setVolume(0.5);
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
          context.router.push(const MapPageRoute());
          backgroundSound.stop();
          audioPlayerforWind.stop();
          nikosPart.stop();
          backgroundSound.stop();
          audioPlayerforPeople1.stop();
          audioPlayerforPeople2.stop();
          water.stop();
          footsteps.stop();
          cough.stop();
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
