import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';

import '../../features/dead_socrates/presentation/modesl/socrates_info_model.dart';
import '../colors.dart';
import '../utils/styles.dart';
import 'clickable_widget.dart';
import 'dialog_image.dart';
import 'zoom_in_notes_widget.dart';

class CardTextAndImageWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final SocratesInfoModel slectedInfoDialog;
  final List<SocratesInfoModel> listDialogInfo;
  final String subTitleText;
  final String titleText;

  const CardTextAndImageWidget(
      {Key? key,
      required this.titleText,
      required this.slectedInfoDialog,
      required this.listDialogInfo,
      required this.constraints,
      required this.subTitleText})
      : super(key: key);

  @override
  _CardTextAndImageWidgetState createState() => _CardTextAndImageWidgetState();
}

class _CardTextAndImageWidgetState extends State<CardTextAndImageWidget> {
  late AppLocalizations locals;
  late SocratesInfoModel socratesInfoModel;
  String? hoveredItemIndex;

  @override
  void initState() {
    socratesInfoModel = SocratesInfoModel(
      description: widget.slectedInfoDialog.description,
      image: widget.slectedInfoDialog.image,
      imageText: widget.slectedInfoDialog.imageText,
      name: widget.slectedInfoDialog.name,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: HW.getWidth(1200, context),
        height: HW.getHeight(676, context),
        child: Scaffold(
            backgroundColor: AppColors.white.withOpacity(0.9),
            body: Container(
              padding: EdgeInsets.symmetric(
                  vertical: HW.getHeight(24, context),
                  horizontal: HW.getWidth(24, context)),
              child: Row(
                children: [
                  SizedBox(
                    height: HW.getHeight(628, context),
                    width: HW.getWidth(400, context),
                    child: AnimatedSwitcher(
                      duration: Times.medium,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: Container(
                          key: ValueKey(socratesInfoModel.name),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(socratesInfoModel.image),
                                  fit: BoxFit.cover)),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Clickable(
                                onPressed: () {
                                  showGeneralDialog(
                                      context: context,
                                      barrierColor:
                                          Colors.black.withOpacity(0.5),
                                      transitionBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation,
                                          Widget child) {
                                        return LayoutBuilder(
                                            builder: (context, constraints) =>
                                                DialogImageWidget(
                                                  animation: animation,
                                                  selectedImage:
                                                      socratesInfoModel.image,
                                                  selectedImageText:
                                                      socratesInfoModel
                                                          .imageText,
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
                                child: ZoomInNotesWidget()),
                          )),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: HW.getHeight(68, context),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: HW.getHeight(8, context)),
                                          child: Text(widget.titleText,
                                              maxLines: 1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  ?.copyWith(
                                                      fontSize: TextFontSize
                                                          .getHeight(
                                                              14, context),
                                                      color:
                                                          AppColors.black54)),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(widget.subTitleText,
                                              maxLines: 1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2
                                                  ?.copyWith(
                                                      fontSize: TextFontSize
                                                          .getHeight(
                                                              32, context),
                                                      height: 1)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    margin: EdgeInsets.only(
                                        bottom: HW.getHeight(16, context),
                                        top: HW.getHeight(8, context)),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            color: AppColors.grey, width: 1.2),
                                        bottom: BorderSide(
                                            color: AppColors.grey, width: 1.2),
                                      ),
                                    ),
                                    child: HAScrollbar(
                                      isAlwaysShown: true,
                                      child:
                                          ListView(shrinkWrap: true, children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 24,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 16),
                                                child: AutoSizeText(
                                                    socratesInfoModel.name
                                                        .toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3),
                                              ),
                                              AutoSizeText(
                                                socratesInfoModel.description,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: HW.getHeight(22, context),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: widget.listDialogInfo
                                    .map((data) => MouseRegion(
                                          onHover: (_) {
                                            setState(() {
                                              hoveredItemIndex = data.name;
                                            });
                                          },
                                          onExit: (_) {
                                            setState(() {
                                              hoveredItemIndex = null;
                                            });
                                          },
                                          child: buttomItemsList(
                                            isHoverd:
                                                hoveredItemIndex == data.name,
                                            name: data.name,
                                            image: data.image,
                                            text: data.description,
                                            subTitle: data.name,
                                            imageText: data.imageText,
                                            selected: data.name,
                                          ),
                                        ))
                                    .toList()),
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            )),
      ),
    );
  }

  Widget buttomItemsList(
      {required String name,
      required String selected,
      required String image,
      required String text,
      required String subTitle,
      required String imageText,
      bool isHoverd = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Clickable(
        onPressed: () {
          setState(() {
            socratesInfoModel.changeCaracterInfo(
                name: name,
                image: image,
                description: text,
                imageText: imageText);
          });
        },
        child: Text(name.toUpperCase(),
            maxLines: 1,
            style: socratesInfoModel.name == selected || isHoverd
                ? Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: AppColors.orange,
                    fontSize: TextFontSize.getHeight(16, context))
                : Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: AppColors.grey,
                    fontSize: TextFontSize.getHeight(16, context))),
      ),
    );
  }
}
