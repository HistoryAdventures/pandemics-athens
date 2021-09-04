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
          width: widget.constraints.maxWidth,
          height: widget.constraints.maxHeight,
          margin: EdgeInsets.symmetric(
              horizontal: widget.constraints.maxWidth * 0.15,
              vertical: widget.constraints.maxHeight * 0.2),
          child: Scaffold(
              backgroundColor: AppColors.white.withOpacity(0.9),
              body: Container(
                padding: EdgeInsets.all(widget.constraints.maxHeight * 0.024),
                child: Row(
                  children: [
                    Expanded(
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
                                    image: AssetImage(infoDialogModel.image),
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
                                              builder: (context, constraints) =>
                                                  DialogImageWidget(
                                                    animation: animation,
                                                    selectedImage:
                                                        infoDialogModel.image,
                                                    selectedImageText:
                                                        infoDialogModel
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
                            )),
                      ),
                    )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 10,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: AppColors.grey,
                                              width: 1.2))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          flex: 1,
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: AutoSizeText(
                                                          "${widget.titleText}\n",
                                                          maxLines: 2,
                                                          minFontSize: 10,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline1
                                                              ?.copyWith(
                                                                  color: AppColors
                                                                      .black54),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              bottom: widget
                                                                      .constraints
                                                                      .maxHeight *
                                                                  0.01),
                                                          child: AutoSizeText(
                                                              widget
                                                                  .subTitleText,
                                                              minFontSize: 13,
                                                              maxLines: 1,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline2),
                                                        ),
                                                      ),
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
                                        flex: 5,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            top: BorderSide(
                                                color: AppColors.grey,
                                                width: 1.2),
                                          )),
                                          child: ListView(
                                              shrinkWrap: true,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16,
                                                          right: 38,
                                                          bottom: 16),
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                            '${infoDialogModel.subTitle}\n\n'
                                                                .toUpperCase(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline3),
                                                    TextSpan(
                                                      text: infoDialogModel
                                                          .description,
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
                                ),
                              ),
                              Flexible(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: widget.listDialogInfo
                                          .map((data) =>
                                              charactersNameListWidget(
                                                title: data.title,
                                                image: data.image,
                                                text: data.description,
                                                subTitle: data.subTitle,
                                                imageText:
                                                    data.imageDescription,
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
                ? Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.orange)
                : Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.grey)),
      ),
    );
  }
}
