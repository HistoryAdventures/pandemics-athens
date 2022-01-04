import 'dart:html' as htm;
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/app_up_button.dart';
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
  final bool? mustScrollToMiddle;
  final bool? mustScrollToEnd;
  const ParalaxHistoryPage({
    this.mustScrollToEnd = false,
    this.mustScrollToMiddle = false,
  });
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

  bool isSoundOn = false;
  bool paralaxAssetsPreloaded = false;
  final backgroundplayer = AudioPlayer();

  late AppLocalizations locals;

  late VideoPlayerController _videoController;
  bool isImageloaded = false;
  bool _lernMoreVisibility = false;
  bool _bottomFieldVizibility = false;

  final ScrollController _scrollController = ScrollController();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  bool get _mustScrollToEnd => widget.mustScrollToEnd ?? false;
  bool get _mustScrollToMiddle => widget.mustScrollToMiddle ?? false;
  bool _videoEnded = false;

  final GlobalKey _athensButtonKey = GlobalKey();

  double get _athensButtonPosition {
    RenderBox box =
        _athensButtonKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    double y = position.dy;
    return y;
  }

  double get _athensButtonHeight {
    RenderBox box =
        _athensButtonKey.currentContext!.findRenderObject() as RenderBox;
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

  @override
  void initState() {
    _videoController = VideoPlayerController.asset('assets/paralax_video.mp4')
      ..initialize().then((_) {
        if (!_mustScrollToEnd && !_mustScrollToMiddle) {
          setState(() {});
        }
      });
    if (!_mustScrollToEnd && !_mustScrollToMiddle) {
      _videoController.setVolume(0.0);
      _videoController.play();
    }

    if (!_mustScrollToEnd && !_mustScrollToMiddle) {
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
      setState(() {});
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
    // htm.window.onMessage.listen((event) {
    //   if (event.data["scroll"] == true) {
    //     _scrollController.jumpTo((event.data["y"] as num).toDouble());
    //   }
    // });
  }

  @override
  void dispose() {
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
      if (scrolled) {
        return;
      }
      if (_mustScrollToMiddle) {
        if (_athensButtonPosition > 0) {
          print("scrolling to athens button ${_athensButtonPosition}");
          double scrollY = _athensButtonPosition -
              (MediaQuery.of(context).size.height / 2 -
                  _athensButtonHeight / 2);
          _scrollController.jumpTo(scrollY);

          Future.delayed(Duration(milliseconds: 1000)).then((value) {
            htm.window.postMessage(
                {"scroll": false, "y": _scrollController.position.pixels}, "*");
            scrolled = true;
            setState(() {});
            print("SCROL IS CALLED");
          });
        }
      }
      if (_mustScrollToEnd) {
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent,
        );
        Future.delayed(Duration(milliseconds: 1000)).then((value) {
          htm.window.postMessage({
            "scroll": false,
            "y": _scrollController.position.maxScrollExtent
          }, "*");
          scrolled = true;
          setState(() {});
          print("SCROL IS CALLED");
        });
      }
    });
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: SizedBox(
        child: Stack(
          children: <Widget>[
            if (!_mustScrollToEnd && !_mustScrollToMiddle) _loading,
            if (!_mustScrollToEnd && !_mustScrollToMiddle) _video,
            if (_videoEnded || _mustScrollToEnd || _mustScrollToMiddle)
              Stack(
                children: [
                  _paralax,
                  Container(
                    // height: 8838,
                    child: PointerInterceptor(
                      child: NotificationListener(
                        onNotification: (event) {
                          if (event is ScrollUpdateNotification) {
                            double value = _scrollController.position.pixels;
                            htm.window.postMessage(
                                {"scroll": false, "y": value}, "*");
                          }

                          return false;
                        },
                        child: SingleChildScrollView(
                          padding: EdgeInsets.zero,
                          controller: _scrollController,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height *
                                (24 / 2.45),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                _topBar(false),
                                _title,
                                SizedBox(
                                  height: HW.getHeight(1700, context),
                                ),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerRight,
                                  right: HW.getWidth(238, context),
                                  text: locals.paralaxText1,
                                  size: Size(HW.getWidth(700, context),
                                      HW.getHeight(216, context)),
                                ),
                                SizedBox(
                                  height: HW.getHeight(850, context),
                                ),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerLeft,
                                  size: Size(HW.getWidth(557, context),
                                      HW.getHeight(230, context)),
                                  left: HW.getWidth(157, context),
                                  text: locals.paralaxText2,
                                ),
                                SizedBox(
                                  height: HW.getHeight(1250, context),
                                ),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerRight,
                                  right: HW.getWidth(150, context),
                                  size: Size(HW.getWidth(600, context),
                                      HW.getHeight(264, context)),
                                  text: locals.paralaxText3,
                                ),
                                SizedBox(
                                  height: HW.getHeight(650, context),
                                ),
                                _athens5th(),
                                SizedBox(height: HW.getHeight(450, context)),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerLeft,
                                  left: HW.getWidth(250, context),
                                  text: locals.paralaxText4,
                                  size: Size(HW.getWidth(605, context),
                                      HW.getHeight(330, context)),
                                ),
                                SizedBox(height: HW.getHeight(2300, context)),
                                ParalaxTextWidget(
                                  alignment: Alignment.centerLeft,
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
                  if (!paralaxAssetsPreloaded)
                    const Align(
                      alignment: Alignment.center,
                      child: LoadingVideoWidget(),
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
                      _videoEnded = true;
                    });
                  },
                  icon: Icon(Icons.arrow_downward),
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
                        margin:
                            EdgeInsets.only(bottom: HW.getHeight(48, context)),
                        height: HW.getHeight(52, context),
                        width: HW.getWidth(24, context),
                        child: Image.asset(AssetsPath.scrollIcon)),
                  )),
            ),
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

  Widget _topBar(bool isOnVideo) {
    return SoundAndMenuWidget(
      widget: isOnVideo
          ? SizedBox()
          : AppUpButton(
              onTap: () {
                LeafDetails.currentVertex = 1;
                LeafDetails.visitedVertexes.add(1);
                NavigationSharedPreferences.upDateShatedPreferences();
                context.router.replace(const GlossaryPageRoute());
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
      key: _athensButtonKey,
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
