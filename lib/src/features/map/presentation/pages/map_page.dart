import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:lottie/lottie.dart';
import "package:universal_html/html.dart" as html;
import 'package:webviewx/webviewx.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../core/widgets/zoom_in_notes_widget.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../models/year_info_model.dart';
import 'package:restart_app/restart_app.dart';

class MapPage extends StatefulWidget {
  static bool mapPageRestarted = false;
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _scrollController = ScrollController();
  late AppLocalizations locals;
  List<MapInfoModel>? mapInfoList;
  MapInfoModel? mapInfoModel;
  late WebViewXController webviewController;

  bool isImageloaded = false;
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();

  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();
  String viewID = "your-view-id";
  bool _visible = false;
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;

    if (mapInfoModel == null) {
      mapInfoModel = MapInfoModel(
        lottie: AssetsPath.mapLottie508,
        imageDescription: '',
        image: '',
        text: locals.introTimeLineText,
        title: '',
        year: '',
      );

      mapInfoList = [
        MapInfoModel(
          lottie: AssetsPath.mapLottie508,
          imageDescription: '',
          image: '',
          text: locals.y508bodyText,
          title: locals.y508,
          year: locals.y508,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie495,
          imageDescription: locals.y495imageText,
          image: AssetsPath.mapImage495,
          text: locals.y495bodyText,
          title: locals.y495,
          year: locals.y495,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie490,
          imageDescription: locals.y490imageText,
          image: AssetsPath.mapImage490,
          text: locals.y490bodyText,
          title: locals.y490bodyTextTitle,
          year: locals.y490,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie480,
          imageDescription: locals.y480imageText,
          image: AssetsPath.mapImage480,
          text: locals.y480bodyText,
          title: locals.y480bodyTextTitle,
          year: locals.y480,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie479,
          imageDescription: locals.y479imageText,
          image: AssetsPath.mapImage479,
          text: locals.y479bodyText,
          title: locals.y479bodyTextTitle,
          year: locals.y479,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie477,
          imageDescription: locals.y477imageText,
          image: AssetsPath.mapImage477,
          text: locals.y477bodyText,
          title: locals.y477bodyTextTitle,
          year: locals.y477,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie471,
          imageDescription: locals.y471imageText,
          image: AssetsPath.mapImage471,
          text: locals.y471bodyText,
          title: locals.y471bodyTextTitle,
          year: locals.y471,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie469,
          imageDescription: locals.y469imageText,
          image: AssetsPath.mapImage469,
          text: locals.y469bodyText,
          title: locals.y469bodyTextTitle,
          year: locals.y469,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie462,
          imageDescription: locals.y462imageText,
          image: AssetsPath.mapImage462,
          text: locals.y462bodyText,
          title: locals.y462bodyTextTitle,
          year: locals.y462,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie461,
          imageDescription: locals.y461imageText,
          image: AssetsPath.mapImage461,
          text: locals.y461bodyText,
          title: locals.y461bodyTextTitle,
          year: locals.y461,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie458,
          imageDescription: locals.y458imageText,
          image: AssetsPath.mapImage458,
          text: locals.y458bodyText,
          title: locals.y458bodyTextTitle,
          year: locals.y458,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie457,
          imageDescription: locals.y457imageText,
          image: AssetsPath.mapImage457,
          text: locals.y457bodyText,
          title: locals.y457bodyTextTitle,
          year: locals.y457,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie454,
          imageDescription: locals.y454imageText,
          image: AssetsPath.mapImage454,
          text: locals.y454bodyText,
          title: locals.y454bodyTextTitle,
          year: locals.y454,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie451,
          imageDescription: locals.y451imageText,
          image: AssetsPath.mapImage451,
          text: locals.y451bodyText,
          title: locals.y451bodyTextTitle,
          year: locals.y451,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie450,
          imageDescription: locals.y450imageText,
          image: AssetsPath.mapImage450,
          text: locals.y450bodyText,
          title: locals.y450bodyTextTitle,
          year: locals.y450,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie447_432,
          imageDescription: locals.y447_432imageText,
          image: AssetsPath.mapImage447_432,
          text: locals.y447_432bodyText,
          title: locals.y447_432bodyTextTitle,
          year: locals.y447_432,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie446,
          imageDescription: locals.y446imageText,
          image: AssetsPath.mapImage446,
          text: locals.y446bodyText,
          title: locals.y446bodyTextTitle,
          year: locals.y446,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie443,
          imageDescription: locals.y443imageText,
          image: AssetsPath.mapImage443,
          text: locals.y443bodyText,
          title: locals.y443bodyTextTitle,
          year: locals.y443,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie441,
          imageDescription: locals.y441imageText,
          image: AssetsPath.mapImage441,
          text: locals.y441bodyText,
          title: locals.y441bodyTextTitle,
          year: locals.y441,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie438,
          imageDescription: locals.y438imageText,
          image: AssetsPath.mapImage438,
          text: locals.y438bodyText,
          title: locals.y438bodyTextTitle,
          year: locals.y438,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie431,
          imageDescription: locals.y431imageText,
          image: AssetsPath.mapImage431,
          text: locals.y431bodyText,
          title: locals.y431bodyTextTitle,
          year: locals.y431,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie430,
          imageDescription: locals.y430imageText,
          image: AssetsPath.mapImage430,
          text: locals.y430bodyText,
          title: locals.y430bodyTextTitle,
          year: locals.y430,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie429,
          imageDescription: '',
          image: '',
          text: locals.y429bodyText,
          title: locals.y429bodyTextTitle,
          year: locals.y429,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie427,
          imageDescription: locals.y427imageText,
          image: AssetsPath.mapImage427,
          text: locals.y427bodyText,
          title: locals.y427bodyTextTitle,
          year: locals.y427,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie421,
          imageDescription: '',
          image: '',
          text: locals.y421bodyText,
          title: locals.y421bodyTextTitle,
          year: locals.y421,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie416,
          imageDescription: locals.y416imageText,
          image: AssetsPath.mapImage416,
          text: locals.y416bodyText,
          title: locals.y416bodyTextTitle,
          year: locals.y416,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie415,
          imageDescription: locals.y415imageText,
          image: AssetsPath.mapImage415,
          text: locals.y415bodyText,
          title: locals.y415bodyTextTitle,
          year: locals.y415,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie414,
          imageDescription: locals.y414imageText,
          image: AssetsPath.mapImage414,
          text: locals.y414bodyText,
          title: locals.y414bodyTextTitle,
          year: locals.y414,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie413,
          imageDescription: '',
          image: '',
          text: locals.y413bodyText,
          title: locals.y413bodyTextTitle,
          year: locals.y413,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie411,
          imageDescription: '',
          image: '',
          text: locals.y411bodyText,
          title: locals.y411bodyTextTitle,
          year: locals.y411,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie410,
          imageDescription: '',
          image: '',
          text: locals.y410bodyText,
          title: locals.y410bodyTextTitle,
          year: locals.y410,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie407,
          imageDescription: '',
          image: '',
          text: locals.y407bodyText,
          title: locals.y407bodyTextTitle,
          year: locals.y407,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie404,
          imageDescription: '',
          image: '',
          text: locals.y404bodyText,
          title: locals.y404bodyTextTitle,
          year: locals.y404,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie403,
          imageDescription: '',
          image: '',
          text: locals.y403bodyText,
          title: locals.y403bodyTextTitle,
          year: locals.y403,
        ),
        MapInfoModel(
          lottie: AssetsPath.mapLottie399,
          imageDescription: locals.y399imageText,
          image: AssetsPath.mapImage399,
          text: locals.y399bodyText,
          title: locals.y399bodyTextTitle,
          year: locals.y399,
        ),
      ];
    }

    // setIframElementPlatform();
    // setState(() {
    //   additionalLoading = false;
    //   mapScreenLoading = false;
    // });
    super.didChangeDependencies();
  }

  // bool additionalLoading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      _visible = true;
      setState(() {});
    });

    setIframElementPlatform();

    super.initState();
  }

  void setIframElementPlatform() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          ..src = mapInfoModel?.lottie
          ..style.border = 'none');
  }

  // bool mapScreenLoading = true;
  // String reloadKey = "mapPageReload";
  // void setLoading() {
  //   Future.delayed(Duration(milliseconds: 10)).then((value)async {
  //    SharedPreferences _sharedPrefs =await  SharedPreferences.getInstance();
  //    _sharedPrefs.setBool(reloadKey, true);
  //    Restart.restartApp(webOrigin: '/map-page');

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body:
          // mapScreenLoading || additionalLoading
          //     ? const LoadingWidget()
          //:
          LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            IgnorePointer(
              ignoringSemantics: true,
              ignoring: true,
              child: AnimatedSwitcher(
                duration: Times.medium,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: mapInfoModel!.text == locals.introTimeLineText
                    ? Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AssetsPath.mapIntroImage),
                                fit: BoxFit.cover)),
                      )
                    : Container(
                        key: ValueKey(mapInfoModel?.title),
                        color: Colors.transparent,
                        child: _iframeIgnorePointer(viewID: viewID),
                      ),
              ),
            ),
            _yearDescriptionField(constraints),
            _timeLineWidget(constraints),
            SoundAndMenuWidget(
              icons: isSoundOn
                  ? AssetsPath.iconVolumeOn
                  : AssetsPath.iconVolumeOff,
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
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        );
      }),
    );
  }

  Widget _iframeIgnorePointer({
    bool ignoring = true,
    required String viewID,
  }) {
    return Stack(
      children: [
        AbsorbPointer(
          child: HtmlElementView(
            viewType: viewID,
          ),
        ),
        if (ignoring)
          Positioned.fill(
            child: PointerInterceptor(
              child: Container(),
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }

  Widget _yearDescriptionField(BoxConstraints constraints) {
    return Visibility(
      visible: _visible,
      child: Positioned(
          top: mapInfoModel!.text == locals.introTimeLineText
              ? HW.getHeight(180, context)
              : HW.getHeight(280, context),
          left: HW.getWidth(128, context),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white10,
                      Colors.white54,
                      Colors.white54,
                      Colors.white54,
                      Colors.white54,
                      Colors.white54,
                      Colors.white54,
                      Colors.white10,
                    ],
                    transform: GradientRotation(104),
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.all(HW.getHeight(24, context)),
                height: mapInfoModel!.text == locals.introTimeLineText
                    ? HW.getHeight(735, context)
                    : HW.getHeight(398, context),
                width: HW.getWidth(768, context),
                child: Row(
                  children: [
                    Visibility(
                      visible: mapInfoModel?.image != '',
                      child: SizedBox(
                        height: HW.getHeight(350, context),
                        width: HW.getWidth(276, context),
                        child: AnimatedSwitcher(
                          duration: Times.medium,
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Container(
                            key: ValueKey(mapInfoModel?.title),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(mapInfoModel!.image),
                              fit: BoxFit.cover,
                            )),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Clickable(
                                  onPressed: () {
                                    AudioPlayerUtil().playZoomInSound();
                                    showGeneralDialog(
                                        context: context,
                                        barrierColor:
                                            Colors.black.withOpacity(0.5),
                                        transitionBuilder:
                                            (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation,
                                                Widget child) {
                                          return LayoutBuilder(
                                              builder: (context, constraints) =>
                                                  DialogImageWidget(
                                                    animation: animation,
                                                    selectedImage:
                                                        mapInfoModel!.image,
                                                    selectedImageText:
                                                        mapInfoModel!
                                                            .imageDescription,
                                                    constraints: constraints,
                                                  ));
                                        },
                                        transitionDuration: Times.fast,
                                        barrierDismissible: true,
                                        barrierLabel: '',
                                        pageBuilder:
                                            (context, animation1, animation2) {
                                          return Container();
                                        });
                                  },
                                  child: const ZoomInNotesWidget()),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.only(
                          left: mapInfoModel?.image != '' ? 24 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: HW.getHeight(68, context),
                            width: constraints.maxWidth,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: HW.getHeight(8, context)),
                                    child: Text(
                                      "${locals.chapter1Athens5thCentury}\n",
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          ?.copyWith(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize: TextFontSize.getHeight(
                                                17, context),
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    '${locals.timelineOfMainEvents}\n'
                                        .toUpperCase(),
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(
                                            fontSize: TextFontSize.getHeight(
                                                34, context)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: HW.getHeight(20, context),
                          // ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              margin: EdgeInsets.only(
                                  top: HW.getHeight(16, context)),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: AppColors.grey, width: 1.2))),
                              child: HAScrollbar(
                                showTrackOnHover: true,
                                child: ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    children: [
                                      Container(
                                          alignment: Alignment.topCenter,
                                          padding: const EdgeInsets.only(
                                              top: 10.0, right: 30),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${mapInfoModel?.title}"
                                                      .toUpperCase(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline3!
                                                      .copyWith(
                                                        height: 1.7,
                                                      ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      HW.getHeight(16, context),
                                                ),
                                                Text(
                                                  mapInfoModel?.text ?? "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                        height: 1.7,
                                                      ),
                                                ),
                                              ])),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                )),
          )),
    );
  }

  Widget _timeLineWidget(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: HW.getWidth(40, context),
        ),
        height: HW.getHeight(149, context),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.mapTimeLineBlur), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
                offset: Offset(1, -1), color: AppColors.grey, blurRadius: 5),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ArrowLeftTextWidget(
                left: 0,
                bottom: 0,
                textSubTitle: locals.todoNoHarm,
                textTitle: locals.chapter1,
                onTap: () {
                  LeafDetails.currentVertex = 2;
                  LeafDetails.visitedVertexes.add(2);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.replace(ParalaxHistoryPageToRight(
                    mustScrollToMiddle: true,
                  ));
                }),
            Container(
              width: HW.getWidth(980, context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: HW.getHeight(40, context),
                      width: HW.getWidth(930, context),
                      child: Theme(
                        data: ThemeData(
                          scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(2),
                              crossAxisMargin: 1,
                              minThumbLength: 119,
                              thickness: MaterialStateProperty.all(4),
                              trackColor: MaterialStateProperty.all(
                                  AppColors.trackColorScrollBar),
                              trackBorderColor: MaterialStateProperty.all(
                                  AppColors.transpatent),
                              thumbColor:
                                  MaterialStateProperty.all(AppColors.orange),
                              showTrackOnHover: true),
                        ),
                        child: Row(
                          children: [
                            leftArrow,
                            Expanded(
                              child: HAScrollbar(
                                controller: _scrollController,
                                isAlwaysShown: true,
                                showTrackOnHover: true,
                                child: ListView.builder(
                                  padding: EdgeInsets.only(
                                    left: HW.getWidth(20, context),
                                    right: HW.getWidth(20, context),
                                    bottom: HW.getHeight(5, context),
                                  ),
                                  controller: _scrollController,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: mapInfoList?.length,
                                  itemBuilder: (context, index) {
                                    return yearsWidget(
                                        lottie: mapInfoList![index].lottie,
                                        year: mapInfoList![index].year,
                                        image: mapInfoList![index].image,
                                        text: mapInfoList![index].text,
                                        map: mapInfoList![index].mapImage,
                                        title: mapInfoList![index].title,
                                        imageText: mapInfoList![index]
                                            .imageDescription);
                                  },
                                ),
                              ),
                            ),
                            _rightArrow,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ArrowRightTextWidget(
                textSubTitle: locals.keyPeopleOfTheAge,
                right: 0,
                bottom: 0,
                textTitle: locals.athens5thCentury,
                onTap: () {
                  AudioPlayerUtil().playScreenTransition();
                  LeafDetails.visitedVertexes.add(5);
                  LeafDetails.currentVertex = 5;
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.replace(const CharacrterPageRoute());
                }),
          ],
        ),
      ),
    );
  }

  Widget yearsWidget(
      {String? year,
      String? image,
      String? imageText,
      String? text,
      String? map,
      String? lottie,
      String? title}) {
    return Container(
      height: HW.getHeight(50, context),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(right: HW.getWidth(50, context)),
      child: Clickable(
        onPressed: () async {
          AudioPlayerUtil().playChangeIndexSound();
          _visible = false;
          setState(() {});
          //  await Future.delayed(const Duration(seconds: 1));
          //

          // setState(() {
          //   additionalLoading = true;
          //   mapScreenLoading = true;
          // });
          //
          //  setIframElementPlatform();
          await mapInfoModel?.chandeState(
            lottie: lottie,
            image: image,
            text: text,
            title: title,
            imageDescription: imageText,
            mapImage: map,
          );

          Future.delayed(const Duration(seconds: 1)).then((value) {
            _visible = true;
            setState(() {});
          });
          // Future.delayed(Duration(milliseconds: 400)).then((value) {
          //   setIframElementPlatform();
          // });
          // Future.delayed(Duration(milliseconds: 400)).then((value) {
          //   setState(() {});
          // });

          // setIframElementPlatform();

          // Future.delayed(Duration(milliseconds: 200)).then((value) {
          //   setState(() {
          //     additionalLoading = false;
          //     mapScreenLoading = false;
          //   });
          // });
        },
        child: AutoSizeText(
          year!,
          textAlign: TextAlign.end,
          style: mapInfoModel?.title == title
              ? Theme.of(context).textTheme.headline5?.copyWith(
                    color: AppColors.orange,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  )
              : Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black.withOpacity(0.5),
                  ),
        ),
      ),
    );
  }

  Widget get leftArrow => IconButton(
        onPressed: () {
          if (_scrollController.offset >
              _scrollController.position.maxScrollExtent / 2) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent / 2,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else {
            _scrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        },
        padding: EdgeInsets.zero,
        alignment: Alignment.centerRight,
        icon: Icon(
          Icons.navigate_before,
          color: Colors.black.withOpacity(0.6),
          size: HW.getWidth(30, context),
        ),
      );

  Widget get _rightArrow => IconButton(
        alignment: Alignment.centerLeft,
        onPressed: () {
          if (_scrollController.offset <
              _scrollController.position.maxScrollExtent / 2) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent / 2,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        },
        padding: EdgeInsets.only(right: 0),
        icon: Icon(
          Icons.navigate_next,
          color: Colors.black.withOpacity(0.6),
          size: HW.getWidth(30, context),
        ),
      );
}
