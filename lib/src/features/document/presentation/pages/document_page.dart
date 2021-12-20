import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/circle_button.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../models/document.dart';
import '../widgets/points.dart';
import '../../../../core/router.gr.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage>
    with TickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();
  Animation<Matrix4>? _animationReset;
  late final AnimationController _controllerReset;
  late AppLocalizations locale;

  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isInfoBorderOpen = true;

  late List<DocumentModel> documentList;

  late DocumentModel documentModel;

  double scaleDownIndex = 0.9;
  double scaleUpIndex = 1.25;

  void _onAnimateReset() {
    _transformationController.value = _animationReset!.value;
    if (!_controllerReset.isAnimating) {
      _animationReset!.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _scaleUp() {
    final Matrix4 _matrixUp = _transformationController.value
        .clone()
        .multiplied(
            Matrix4.diagonal3Values(scaleUpIndex, scaleUpIndex, scaleUpIndex));
    if (_matrixUp[0] < 3.5) {
      _controllerReset.reset();
      _animationReset =
          Matrix4Tween(begin: _transformationController.value, end: _matrixUp)
              .animate(_controllerReset);
      _animationReset!.addListener(_onAnimateReset);

      _transformationController.value =
          PointerEvent.removePerspectiveTransform(_matrixUp);

      _controllerReset.forward();
    } else {
      return;
    }
  }

  void _scaleDown() {
    final Matrix4 _matrixDown = _transformationController.value
        .clone()
        .multiplied(Matrix4.diagonal3Values(
            scaleDownIndex, scaleDownIndex, scaleDownIndex));
    if (_matrixDown[0] > 0.3) {
      _controllerReset.reset();
      _animationReset =
          Matrix4Tween(begin: _transformationController.value, end: _matrixDown)
              .animate(_controllerReset);
      _animationReset!.addListener(_onAnimateReset);
      _transformationController.value =
          PointerEvent.removePerspectiveTransform(_matrixDown);

      _controllerReset.forward();
    } else {
      return;
    }
  }

// Stop a running reset to home transform animation.
  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    // If the user tries to cause a transformation while the reset animation is
    // running, cancel the reset animation.
    if (_controllerReset.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    NavigationSharedPreferences.getNavigationListFromSF();
    documentModel = DocumentModel(
      left: 0,
      top: 0,
      name: locale.documentIntro,
      text: locale.documentIntroText,
    );
    documentList = [
      DocumentModel(
        left: 0,
        top: 0,
        name: locale.documentIntro,
        text: locale.documentIntroText,
      ),
      DocumentModel(
          left: 0,
          top: 0,
          name: locale.documentTranscription,
          text: locale.documentTranscriptionText),
      DocumentModel(
          top: MediaQuery.of(context).size.height * 0.31,
          left: MediaQuery.of(context).size.width * 0.45,
          name: locale.document1,
          text: locale.document1Text),
      DocumentModel(
          top: MediaQuery.of(context).size.height * 0.45,
          left: MediaQuery.of(context).size.width * 0.48,
          name: locale.document2,
          text: locale.document2Text),
      DocumentModel(
          top: MediaQuery.of(context).size.height * 0.62,
          left: MediaQuery.of(context).size.width * 0.45,
          name: locale.document3,
          text: locale.document3Text),
      DocumentModel(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.50,
          name: locale.document4,
          text: locale.document4Text),
    ];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    _controllerReset = AnimationController(
      vsync: this,
      duration: Times.fastest,
    );

    _transformationController.addListener(() {
      //debugPrint('${_transformationController.value}');
    });
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldkey,
        endDrawer: const NavigationPage(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              decoration:
                  const BoxDecoration(gradient: AppColors.linearGradientBlueBK),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Times.fastest,
                    height: constraints.maxHeight,
                    width: isInfoBorderOpen
                        ? HW.getWidth(1120, context)
                        : constraints.maxWidth,
                    child: InteractiveViewer(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      transformationController: _transformationController,
                      onInteractionStart: _onInteractionStart,
                      boundaryMargin: const EdgeInsets.all(double.infinity),
                      minScale: 0.25,
                      maxScale: 3,
                      constrained: false,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                //alignment: Alignment.centerLeft,
                                image: AssetImage(AssetsPath.document))),
                        child: SizedBox(
                          child: Stack(
                              children: documentList.sublist(2, 6).map((data) {
                            return Positioned(
                              top: data.top,
                              left: data.left,
                              child: Clickable(
                                onPressed: () {
                                  setState(() {
                                    documentModel.chandeState(
                                        data.name, data.text);
                                  });
                                },
                                child: PointWidget(
                                  width: HW.getWidth(20, context),
                                  color: documentModel.name == data.name
                                      ? AppColors.orange
                                      : Colors.black.withOpacity(0.8),
                                  text: data.name!.substring(1),
                                ),
                              ),
                            );
                          }).toList()),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedContainer(
                      height: constraints.maxHeight,
                      width: isInfoBorderOpen ? HW.getWidth(800, context) : 0,
                      duration: Times.fastest,
                      child: LayoutBuilder(builder: (context, constraines) {
                        return Container(
                            decoration: const BoxDecoration(
                                gradient: AppColors
                                    .linearGradientForBackgroundDocument),
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: constraines.maxHeight,
                                  padding: EdgeInsets.only(
                                      left: HW.getWidth(64, context),
                                      right: HW.getWidth(64, context),
                                      top: HW.getHeight(50, context),
                                      bottom: HW.getHeight(148, context)),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            bottom: HW.getHeight(50, context)),
                                        child: Visibility(
                                          visible: isInfoBorderOpen,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Clickable(
                                                  onPressed: () {},
                                                  child: SizedBox(
                                                    height: HW.getWidth(
                                                        32, context),
                                                    width: HW.getWidth(
                                                        32, context),
                                                    child: Image.asset(
                                                      AssetsPath.iconVolumeOn,
                                                      fit: BoxFit.contain,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                  child: Clickable(
                                                onPressed: () {
                                                  scaffoldkey.currentState!
                                                      .openEndDrawer();
                                                },
                                                child: SizedBox(
                                                  height:
                                                      HW.getHeight(30, context),
                                                  width:
                                                      HW.getWidth(40, context),
                                                  child: Image.asset(
                                                    AssetsPath.iconMenu,
                                                    fit: BoxFit.contain,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: HW.getHeight(
                                                          8, context)),
                                                  child: AutoSizeText(
                                                    locale
                                                        .chapter1MedicalToolsKnowledge,
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline1,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: HW.getHeight(
                                                          16, context)),
                                                  child: AutoSizeText(
                                                    locale
                                                        .sourceAnalysisHippocraticOath,
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    top: BorderSide(
                                                        color: AppColors.grey,
                                                        width: 1.2),
                                                    bottom: BorderSide(
                                                        color: AppColors.grey,
                                                        width: 1.2),
                                                  ),
                                                ),
                                                child: HAScrollbar(
                                                  isAlwaysShown: true,
                                                  showTrackOnHover: true,
                                                  child: SingleChildScrollView(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 16,
                                                              right: 32),
                                                      child: RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                              text: '${documentModel.name}\n\n'
                                                                  .toUpperCase(),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline3,
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  documentModel
                                                                      .text,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                            ),
                                                          ])),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: HW.getHeight(20, context),
                                            ),
                                            SizedBox(
                                              height: HW.getHeight(23, context),
                                              child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                      children: documentList
                                                          .map((data) =>
                                                              documentInfoListWidgets(
                                                                  name:
                                                                      data.name,
                                                                  text:
                                                                      data.text,
                                                                  selected: data
                                                                      .name))
                                                          .toList())),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]));
                      }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ArrowRightTextWidget(
                        textSubTitle: locale.medicalToolsKnowledge,
                        textTitle: locale.chapter1,
                        onTap: () {
                          LeafDetails.currentVertex = 8;
                          LeafDetails.visitedVertexes.add(8);

                          NavigationSharedPreferences.upDateShatedPreferences();
                          context.router.replace(const PanaromaLeftPageRoute());
                        }),
                  ),
                  Positioned(
                    bottom: HW.getHeight(5, context),
                    left: HW.getWidth(800, context),
                    child: SizedBox(
                      height: HW.getHeight(144, context),
                      width: HW.getWidth(320, context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleButton(
                            padding: EdgeInsets.all(
                              HW.getWidth(5, context),
                            ),
                            onPressed: () {
                              setState(() {
                                isInfoBorderOpen = !isInfoBorderOpen;
                              });
                            },
                            iconData: Icons.crop_free,
                            child: Image.asset(AssetsPath.expand),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: CircleButton(
                              padding: EdgeInsets.all(
                                HW.getWidth(5, context),
                              ),
                              onPressed: _scaleUp,
                              iconData: Icons.add,
                              child: Image.asset(AssetsPath.inc),
                            ),
                          ),
                          CircleButton(
                            padding: EdgeInsets.all(
                              HW.getHeight(5, context),
                            ),
                            onPressed: _scaleDown,
                            iconData: Icons.remove,
                            child: Image.asset(
                              AssetsPath.dec,
                              width: HW.getWidth(20, context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget documentInfoListWidgets({
    String? name,
    String? selected,
    String? image,
    String? text,
  }) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(right: HW.getWidth(20, context)),
        child: Clickable(
          onPressed: () {
            setState(() {
              documentModel.chandeState(selected, text);
            });
          },
          child: AutoSizeText(name!.toUpperCase(),
              maxLines: 1,
              maxFontSize: 20,
              minFontSize: 10,
              style: documentModel.name == selected
                  ? Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.orange, fontWeight: FontWeight.w500)
                  : Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      )),
        ),
      ),
    );
  }
}
