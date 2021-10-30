import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';

import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
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
import 'dart:ui' as ui;

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _scrollController = ScrollController();
  late AppLocalizations locals;
  late List<MapInfoModel> mapInfoList;
  late WebViewXController webviewController;

  bool isImageloaded = false;
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();

  late MapInfoModel mapInfoModel;

  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();
  String viewID = "your-view-id";

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    mapInfoModel = MapInfoModel(
      lottie: AssetsPath.mapLottie1,
      imageDescription: '',
      image: '',
      text: locals.y508bodyText,
      title: locals.y508,
      year: locals.y508,
      mapImage: AssetsPath.map508,
    );
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          ..src = mapInfoModel.lottie
          ..style.border = 'none');

    mapInfoList = [
      MapInfoModel(
        lottie: AssetsPath.mapLottie1,
        imageDescription: '',
        image: '',
        text: locals.y508bodyText,
        title: locals.y508,
        year: locals.y508,
        mapImage: AssetsPath.map508,
      ),
      MapInfoModel(
        lottie: AssetsPath.mapLottie2,
        imageDescription: locals.y495imageText,
        image: AssetsPath.mapImage495,
        text: locals.y495bodyText,
        title: locals.y495,
        year: locals.y495,
        mapImage: AssetsPath.map495,
      ),
      MapInfoModel(
          lottie: AssetsPath.mapLottie3,
          imageDescription: locals.y490imageText,
          image: AssetsPath.mapImage490,
          text: locals.y490bodyText,
          title: locals.y490bodyTextTitle,
          year: locals.y490,
          mapImage: AssetsPath.map490),
      MapInfoModel(
          lottie: AssetsPath.mapLottie4,
          imageDescription: locals.y480imageText,
          image: AssetsPath.mapImage480,
          text: locals.y480bodyText,
          title: locals.y480bodyTextTitle,
          year: locals.y480,
          mapImage: AssetsPath.map480),
      MapInfoModel(
          lottie: AssetsPath.mapLottie5,
          imageDescription: locals.y479imageText,
          image: AssetsPath.mapImage479,
          text: locals.y479bodyText,
          title: locals.y479bodyTextTitle,
          year: locals.y479,
          mapImage: AssetsPath.map479),
      MapInfoModel(
          lottie: AssetsPath.mapLottie6,
          imageDescription: locals.y477imageText,
          image: AssetsPath.mapImage477,
          text: locals.y477bodyText,
          title: locals.y477bodyTextTitle,
          year: locals.y477,
          mapImage: AssetsPath.map477),
      MapInfoModel(
          lottie: AssetsPath.mapLottie7,
          imageDescription: locals.y471imageText,
          image: AssetsPath.mapImage471,
          text: locals.y471bodyText,
          title: locals.y471bodyTextTitle,
          year: locals.y471,
          mapImage: AssetsPath.map471),
      MapInfoModel(
          lottie: AssetsPath.mapLottie8,
          imageDescription: locals.y469imageText,
          image: AssetsPath.mapImage469,
          text: locals.y469bodyText,
          title: locals.y469bodyTextTitle,
          year: locals.y469,
          mapImage: AssetsPath.map469),
      MapInfoModel(
          lottie: AssetsPath.mapLottie9,
          imageDescription: locals.y462imageText,
          image: AssetsPath.mapImage462,
          text: locals.y462bodyText,
          title: locals.y462bodyTextTitle,
          year: locals.y462,
          mapImage: AssetsPath.map462),
      MapInfoModel(
          lottie: AssetsPath.mapLottie10,
          imageDescription: locals.y461imageText,
          image: AssetsPath.mapImage461,
          text: locals.y461bodyText,
          title: locals.y461bodyTextTitle,
          year: locals.y461,
          mapImage: AssetsPath.map461),
      MapInfoModel(
          lottie: AssetsPath.mapLottie11,
          imageDescription: locals.y458imageText,
          image: AssetsPath.mapImage458,
          text: locals.y458bodyText,
          title: locals.y458bodyTextTitle,
          year: locals.y458,
          mapImage: AssetsPath.map458),
      MapInfoModel(
          lottie: AssetsPath.mapLottie12,
          imageDescription: locals.y457imageText,
          image: AssetsPath.mapImage457,
          text: locals.y457bodyText,
          title: locals.y457bodyTextTitle,
          year: locals.y457,
          mapImage: AssetsPath.map457),
      MapInfoModel(
          lottie: AssetsPath.mapLottie13,
          imageDescription: locals.y454imageText,
          image: AssetsPath.mapImage454,
          text: locals.y454bodyText,
          title: locals.y454bodyTextTitle,
          year: locals.y454,
          mapImage: AssetsPath.map454),
      MapInfoModel(
          lottie: AssetsPath.mapLottie14,
          imageDescription: locals.y451imageText,
          image: AssetsPath.mapImage451,
          text: locals.y451bodyText,
          title: locals.y451bodyTextTitle,
          year: locals.y451,
          mapImage: AssetsPath.map451),
      MapInfoModel(
          lottie: AssetsPath.mapLottie15,
          imageDescription: locals.y450imageText,
          image: AssetsPath.mapImage450,
          text: locals.y450bodyText,
          title: locals.y450bodyTextTitle,
          year: locals.y450,
          mapImage: AssetsPath.map450),
      MapInfoModel(
          lottie: AssetsPath.mapLottie16,
          imageDescription: locals.y447_432imageText,
          image: AssetsPath.mapImage447_432,
          text: locals.y447_432bodyText,
          title: locals.y447_432bodyTextTitle,
          year: locals.y447_432,
          mapImage: AssetsPath.map447_432),
      MapInfoModel(
          lottie: AssetsPath.mapLottie17,
          imageDescription: locals.y446imageText,
          image: AssetsPath.mapImage446,
          text: locals.y446bodyText,
          title: locals.y446bodyTextTitle,
          year: locals.y446,
          mapImage: AssetsPath.map446),
      MapInfoModel(
          lottie: AssetsPath.mapLottie18,
          imageDescription: locals.y443imageText,
          image: AssetsPath.mapImage443,
          text: locals.y443bodyText,
          title: locals.y443bodyTextTitle,
          year: locals.y443,
          mapImage: AssetsPath.map443),
      MapInfoModel(
          lottie: AssetsPath.mapLottie19,
          imageDescription: locals.y441imageText,
          image: AssetsPath.mapImage441,
          text: locals.y441bodyText,
          title: locals.y441bodyTextTitle,
          year: locals.y441,
          mapImage: AssetsPath.map441),
      MapInfoModel(
          lottie: AssetsPath.mapLottie20,
          imageDescription: locals.y438imageText,
          image: AssetsPath.mapImage438,
          text: locals.y438bodyText,
          title: locals.y438bodyTextTitle,
          year: locals.y438,
          mapImage: AssetsPath.map438),
      MapInfoModel(
          lottie: AssetsPath.mapLottie21,
          imageDescription: locals.y431imageText,
          image: AssetsPath.mapImage431,
          text: locals.y431bodyText,
          title: locals.y431bodyTextTitle,
          year: locals.y431,
          mapImage: AssetsPath.map431),
      MapInfoModel(
          lottie: AssetsPath.mapLottie22,
          imageDescription: locals.y430imageText,
          image: AssetsPath.mapImage430,
          text: locals.y430bodyText,
          title: locals.y430bodyTextTitle,
          year: locals.y430,
          mapImage: AssetsPath.map430),
      MapInfoModel(
        lottie: AssetsPath.mapLottie23,
        imageDescription: '',
        image: '',
        text: locals.y429bodyText,
        title: locals.y429bodyTextTitle,
        year: locals.y429,
        mapImage: AssetsPath.map429,
      ),
      MapInfoModel(
        lottie: AssetsPath.mapLottie24,
        mapImage: AssetsPath.map427,
        imageDescription: locals.y427imageText,
        image: AssetsPath.mapImage427,
        text: locals.y427bodyText,
        title: locals.y427bodyTextTitle,
        year: locals.y427,
      ),
      MapInfoModel(
          lottie: AssetsPath.mapLottie25,
          imageDescription: locals.y421imageText,
          image: AssetsPath.mapImage421,
          text: locals.y421bodyText,
          title: locals.y421bodyTextTitle,
          year: locals.y421,
          mapImage: AssetsPath.map421),
      MapInfoModel(
          lottie: AssetsPath.mapLottie1,
          imageDescription: locals.y416imageText,
          image: AssetsPath.mapImage416,
          text: locals.y416bodyText,
          title: locals.y416bodyTextTitle,
          year: locals.y416,
          mapImage: AssetsPath.map416),
      MapInfoModel(
          lottie: AssetsPath.mapLottie26,
          imageDescription: locals.y415imageText,
          image: AssetsPath.mapImage415,
          text: locals.y415bodyText,
          title: locals.y415bodyTextTitle,
          year: locals.y415,
          mapImage: AssetsPath.map415),
      MapInfoModel(
          lottie: AssetsPath.mapLottie27,
          imageDescription: locals.y414imageText,
          image: AssetsPath.mapImage414,
          text: locals.y414bodyText,
          title: locals.y414bodyTextTitle,
          year: locals.y414,
          mapImage: AssetsPath.map414),
      MapInfoModel(
          lottie: AssetsPath.mapLottie28,
          imageDescription: locals.y413imageText,
          image: AssetsPath.mapImage421,
          text: locals.y413bodyText,
          title: locals.y413bodyTextTitle,
          year: locals.y413,
          mapImage: AssetsPath.map413),
      MapInfoModel(
          lottie: AssetsPath.mapLottie29,
          imageDescription: locals.y411imageText,
          image: AssetsPath.mapImage413,
          text: locals.y411bodyText,
          title: locals.y411bodyTextTitle,
          year: locals.y411,
          mapImage: AssetsPath.map411),
      MapInfoModel(
          lottie: AssetsPath.mapLottie30,
          imageDescription: locals.y410imageText,
          image: AssetsPath.mapImage413,
          text: locals.y410bodyText,
          title: locals.y410bodyTextTitle,
          year: locals.y410,
          mapImage: AssetsPath.map410),
      MapInfoModel(
          lottie: AssetsPath.mapLottie31,
          imageDescription: locals.y407imageText,
          image: AssetsPath.mapImage413,
          text: locals.y407bodyText,
          title: locals.y407bodyTextTitle,
          year: locals.y407,
          mapImage: AssetsPath.map407),
      MapInfoModel(
          lottie: AssetsPath.mapLottie32,
          imageDescription: locals.y404imageText,
          image: AssetsPath.mapImage413,
          text: locals.y404bodyText,
          title: locals.y404bodyTextTitle,
          year: locals.y404,
          mapImage: AssetsPath.map404),
      MapInfoModel(
          lottie: AssetsPath.mapLottie33,
          imageDescription: locals.y403imageText,
          image: AssetsPath.mapImage413,
          text: locals.y403bodyText,
          title: locals.y403bodyTextTitle,
          year: locals.y403,
          mapImage: AssetsPath.map403),
      MapInfoModel(
          lottie: AssetsPath.mapLottie34,
          imageDescription: locals.y399imageText,
          image: AssetsPath.mapImage399,
          text: locals.y399bodyText,
          title: locals.y399bodyTextTitle,
          year: locals.y399,
          mapImage: AssetsPath.map399),
    ];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(builder: (context, constraints) {
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
                child: Container(
                  key: ValueKey(mapInfoModel.title),
                  color: Colors.transparent,
                  child: _iframeIgnorePointer(viewID: viewID),
                ),
              ),
            ),
            _yearDescriptionField(constraints),
            _timeLineWidget(constraints),
            SoundAndMenuWidget(
              icons: isSoundOn ? Icons.volume_up : Icons.volume_mute,
              onTapVolume: isSoundOn
                  ? () {
                      print('appbar');
                      setState(() {
                        isSoundOn = !isSoundOn;
                        backgroundplayer.pause();
                      });
                    }
                  : () {
                      print('appbar');
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
          child: RepaintBoundary(
            child: HtmlElementView(
              viewType: viewID,
            ),
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
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.linearGradientForBackground,
          ),
          padding: const EdgeInsets.all(24),
          margin: EdgeInsets.only(left: 50, top: constraints.maxHeight * 0.18),
          height: constraints.maxHeight * 0.5,
          width: constraints.maxWidth * 0.5,
          child: mapInfoModel.image != ''
              ? Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: constraints.maxHeight,
                        child: AnimatedSwitcher(
                          duration: Times.medium,
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Container(
                            key: ValueKey(mapInfoModel.title),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(mapInfoModel.image),
                              fit: BoxFit.cover,
                            )),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Clickable(
                                  onPressed: () {
                                    print('dialog');
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
                                                        mapInfoModel.image,
                                                    selectedImageText:
                                                        mapInfoModel
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
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Container(
                                  width: constraints.maxWidth,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.grey,
                                              width: 1.2))),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: AutoSizeText(
                                          "${locals.chapter1Athens5thCentury}\n",
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.copyWith(color: AppColors.grey),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  constraints.maxHeight * 0.01),
                                          child: AutoSizeText(
                                            '${locals.timelineOfMainEvents}\n'
                                                .toUpperCase(),
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: Scrollbar(
                                  child: ListView(shrinkWrap: true, children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, right: 30),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: "${mapInfoModel.title}\n\n"
                                                .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                        TextSpan(
                                          text: mapInfoModel.text,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ])),
                                    )
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          width: constraints.maxWidth,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColors.grey, width: 1.2))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  flex: 2,
                                  child: AutoSizeText(
                                    "${locals.chapter1Athens5thCentury}\n",
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        ?.copyWith(color: AppColors.grey),
                                  )),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: constraints.maxHeight * 0.01),
                                  child: AutoSizeText(
                                    locals.timelineOfMainEvents.toUpperCase(),
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Scrollbar(
                          child: ListView(shrinkWrap: true, children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, right: 30),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "${mapInfoModel.title}\n\n"
                                        .toUpperCase(),
                                    style:
                                        Theme.of(context).textTheme.headline3),
                                TextSpan(
                                  text: mapInfoModel.text,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ])),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
        ));
  }

  Widget _timeLineWidget(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: constraints.maxHeight * 0.137,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, -1), color: AppColors.grey, blurRadius: 5),
          ],
          gradient: AppColors.linearGradientForBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: ArrowLeftTextWidget(
                  textSubTitle: locals.todoNoHarm,
                  textTitle: locals.chapter1,
                  onTap: () {
                    LeafDetails.currentVertex = 2;
                    NavigationSharedPreferences.upDateShatedPreferences();

                    if (kIsWeb) {
                      html.window.history.back();
                      context.router.pop();
                    } else {
                      context.router.pop();
                    }
                  }),
            ),
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: IconButtonWidget(
                      onPressed: () {
                        _scrollController.animateTo(
                          0.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      icon: const Icon(
                        Icons.navigate_before,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      child: Scrollbar(
                        isAlwaysShown: true,
                        child: ListView.builder(
                            padding: const EdgeInsets.only(bottom: 10),
                            controller: _scrollController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: mapInfoList.length,
                            itemBuilder: (context, index) {
                              return yearsWidget(
                                  lottie: mapInfoList[index].lottie,
                                  year: mapInfoList[index].year,
                                  image: mapInfoList[index].image,
                                  text: mapInfoList[index].text,
                                  map: mapInfoList[index].mapImage,
                                  title: mapInfoList[index].title,
                                  imageText:
                                      mapInfoList[index].imageDescription);
                            }),
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButtonWidget(
                      onPressed: () {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: ArrowRightTextWidget(
                  textSubTitle: locals.keyPeopleOfTheAge,
                  textTitle: locals.athens5thCentury,
                  onTap: () {
                    LeafDetails.visitedVertexes.add(5);
                    LeafDetails.currentVertex = 5;
                    print(LeafDetails.currentVertex);
                    print(LeafDetails.visitedVertexes);
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.push(const CharacrterPageRoute());
                  }),
            ),
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
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(left: 30),
      child: Clickable(
        onPressed: () {
          setState(() {
            mapInfoModel.chandeState(
              lottie: lottie,
              image: image,
              text: text,
              title: title,
              imageDescription: imageText,
              mapImage: map,
            );
          });
        },
        child: AutoSizeText(
          year!,
          textAlign: TextAlign.end,
          style: mapInfoModel.title == title
              ? const TextStyle(
                  color: AppColors.orange,
                  fontSize: 36,
                )
              : const TextStyle(color: AppColors.blackB, fontSize: 15),
        ),
      ),
    );
  }
}
