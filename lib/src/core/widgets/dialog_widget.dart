import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../../features/panaramas/presentation/models/dialog_model.dart';
import '../colors.dart';
import '../utils/styles.dart';
import 'clickable_widget.dart';
import 'dialog_image.dart';
import 'zoom_in_notes_widget.dart';

class DialogWidget extends StatefulWidget {
  final Animation<double> animation;
  final BoxConstraints constraints;

  final InfoDialogModel slectedInfoDialog;
  final List<InfoDialogModel> listDialogInfo;
  final String subTitleText;
  final String titleText;

  const DialogWidget(
      {Key? key,
      required this.titleText,
      required this.animation,
      required this.slectedInfoDialog,
      required this.listDialogInfo,
      required this.constraints,
      required this.subTitleText})
      : super(key: key);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  late AppLocalizations locals;
  late InfoDialogModel infoDialogModel;

  @override
  void initState() {
    infoDialogModel = InfoDialogModel(
      description: widget.slectedInfoDialog.description,
      height: widget.slectedInfoDialog.height,
      image: widget.slectedInfoDialog.image,
      imageDescription: widget.slectedInfoDialog.imageDescription,
      latitude: widget.slectedInfoDialog.latitude,
      longitude: widget.slectedInfoDialog.longitude,
      subTitle: widget.slectedInfoDialog.subTitle,
      title: widget.slectedInfoDialog.title,
      width: widget.slectedInfoDialog.width,
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
      child: FadeTransition(
        opacity: widget.animation,
        child: Container(
          width: HW.getWidth(1200, context),
          height: HW.getHeight(676, context),
          child: Scaffold(
              backgroundColor: AppColors.white.withOpacity(0.9),
              body: Container(
                padding: EdgeInsets.all(HW.getHeight(24, context)),
                child: Row(
                  children: [
                    Container(
                        height: HW.getHeight(628, context),
                        width: HW.getWidth(400, context),
                        child: SizedBox(
                          height: widget.constraints.maxHeight,
                          child: AnimatedSwitcher(
                            duration: Times.medium,
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: Container(
                                key: ValueKey(infoDialogModel.image),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(infoDialogModel.image),
                                        fit: BoxFit.cover)),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Clickable(
                                      onPressed: () {
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
                                                  builder: (context,
                                                          constraints) =>
                                                      DialogImageWidget(
                                                        animation: animation,
                                                        selectedImage:
                                                            infoDialogModel
                                                                .image,
                                                        selectedImageText:
                                                            infoDialogModel
                                                                .imageDescription,
                                                        constraints:
                                                            constraints,
                                                      ));
                                            },
                                            transitionDuration: Times.fast,
                                            barrierDismissible: true,
                                            barrierLabel: '',
                                            pageBuilder: (context, animation1,
                                                animation2) {
                                              return Container();
                                            });
                                      },
                                      child: const ZoomInNotesWidget()),
                                )),
                          ),
                        )),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: HW.getHeight(68, context),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: HW.getHeight(
                                                              8, context)),
                                                      child: Text(
                                                        "${widget.titleText}\n",
                                                        maxLines: 2,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline1
                                                            ?.copyWith(
                                                                fontSize: TextFontSize
                                                                    .getHeight(
                                                                        16,
                                                                        context),
                                                                color: AppColors
                                                                    .black54),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                          widget.subTitleText,
                                                          maxLines: 1,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline2
                                                              ?.copyWith(
                                                                  fontSize: TextFontSize
                                                                      .getHeight(
                                                                          32,
                                                                          context)))),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                                child: Clickable(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Icon(
                                                        Icons.clear)))
                                          ])),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: HW.getHeight(16, context),
                                        bottom: HW.getHeight(16, context),
                                      ),
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
                                      child:
                                          ListView(shrinkWrap: true, children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 24, top: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 16),
                                                child: AutoSizeText(
                                                    infoDialogModel.subTitle
                                                        .toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3),
                                              ),
                                              AutoSizeText(
                                                infoDialogModel.description,
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
                                      .map((data) => charactersNameListWidget(
                                            title: data.title,
                                            image: data.image,
                                            text: data.description,
                                            subTitle: data.subTitle,
                                            imageText: data.imageDescription,
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
      ),
    );
  }

  Widget charactersNameListWidget(
      {String? title,
      String? image,
      String? text,
      String? subTitle,
      String? imageText}) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Clickable(
        onPressed: () {
          setState(() {
            infoDialogModel.chandeState(
              title: title,
              image: image,
              description: text,
              imageDescription: imageText,
              subTitle: subTitle,
            );
          });
        },
        child: AutoSizeText(title!.toUpperCase(),
            maxLines: 1,
            style: infoDialogModel.title == title
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
