import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/arrow_text_right.dart';
import '../../../../core/widgets/clickable_widget.dart';
import '../models/document.dart';
import '../widgets/points.dart';

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

  late String _selectedItem;

  late String _infoText;
  bool isItemSelected1 = false;
  bool isItemSelected2 = false;
  bool isItemSelected3 = false;
  bool isItemSelected4 = false;

  late List<DocumentModel> documentList;
  double scale = 0.9;
  void _onAnimateReset() {
    _transformationController.value = _animationReset!.value;
    if (!_controllerReset.isAnimating) {
      _animationReset!.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _scaleUp() {
    final Matrix4 _matrix = _transformationController.value
        .clone()
        .multiplied(Matrix4.diagonal3Values(1.25, 1.25, 1.25));

    _controllerReset.reset();
    _animationReset =
        Matrix4Tween(begin: _transformationController.value, end: _matrix)
            .animate(_controllerReset);
    _animationReset!.addListener(_onAnimateReset);

    _transformationController.value =
        PointerEvent.removePerspectiveTransform(_matrix);

    _controllerReset.forward();
  }

  void _scaleDown() {
    final Matrix4 _matrix = _transformationController.value
        .clone()
        .multiplied(Matrix4.diagonal3Values(scale, scale, scale));
    _controllerReset.reset();
    _animationReset =
        Matrix4Tween(begin: _transformationController.value, end: _matrix)
            .animate(_controllerReset);
    _animationReset!.addListener(_onAnimateReset);
    _transformationController.value =
        PointerEvent.removePerspectiveTransform(_matrix);

    _controllerReset.forward();
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
    _selectedItem = locale.documentIntro;
    _infoText = locale.documentIntroText;
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
          top: MediaQuery.of(context).size.height * 0.15,
          left: MediaQuery.of(context).size.width * 0.38,
          name: locale.document1,
          text: locale.document1Text),
      DocumentModel(
          top: MediaQuery.of(context).size.height * 0.38,
          left: MediaQuery.of(context).size.width * 0.45,
          name: locale.document2,
          text: locale.document2Text),
      DocumentModel(
          top: MediaQuery.of(context).size.height * 0.62,
          left: MediaQuery.of(context).size.width * 0.37,
          name: locale.document3,
          text: locale.document3Text),
      DocumentModel(
          top: MediaQuery.of(context).size.height * 0.68,
          left: MediaQuery.of(context).size.width * 0.55,
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
      duration: const Duration(milliseconds: 100),
    );

    _transformationController.addListener(() {
      debugPrint('${_transformationController.value}');
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
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        backgroundColor: AppColors.greyDeep,
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: AppColors.white,
              onPressed: _scaleUp,
              child: const Icon(Icons.add, color: AppColors.blackB),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              backgroundColor: AppColors.white,
              onPressed: _scaleDown,
              child: const Icon(Icons.remove, color: AppColors.blackB),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                Row(
                  children: [
                    Expanded(
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
                              // color: Colors.red,
                              image: DecorationImage(
                                  //alignment: Alignment.centerLeft,
                                  image: AssetImage(AssetsPath.document))),
                          child: SizedBox(
                            child: Stack(
                                children:
                                    documentList.sublist(2, 6).map((data) {
                              return Positioned(
                                top: data.top,
                                left: data.left,
                                child: Clickable(
                                  onPressed: () {
                                    chandeState(data.name, data.text);
                                  },
                                  child: PointWidget(
                                    color: _selectedItem == data.name
                                        ? AppColors.orange
                                        : Colors.black,
                                    text: data.name.substring(1),
                                  ),
                                ),
                              );
                            }).toList()),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
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
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.volume_up),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.menu))
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  locale
                                                      .chapter1MedicalToolsKnowledge,
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2,
                                                ),
                                                AutoSizeText(
                                                  locale
                                                      .sourceAnalysisHippocraticOath,
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2,
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: Container(
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
                                                child: SingleChildScrollView(
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                      text: '$_selectedItem\n'
                                                          .toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline3,
                                                    ),
                                                    TextSpan(
                                                      text: _infoText,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                  ])),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
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
                                            const SizedBox(
                                              height: 60,
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
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 24),
                    child: ArrowRightTextWidget(
                        textSubTitle: locale.medicalToolsKnowledge,
                        textTitle: locale.chapter1,
                        onTap: () {
                          context.router.pop();
                        }),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void chandeState(String? selctedItem, String? textDescription) {
    setState(() {
      _selectedItem = selctedItem!;
      _infoText = textDescription!;
    });
  }

  Widget documentInfoListWidgets(
      {String? name,
      String? selected,
      String? image,
      String? text,
      bool? color}) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Clickable(
          onPressed: () {
            chandeState(selected, text);
          },
          child: AutoSizeText(name!.toUpperCase(),
              maxLines: 1,
              maxFontSize: 15,
              minFontSize: 5,
              style: _selectedItem == selected
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.orange)
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.blackG)),
        ),
      ),
    );
  }
}
