import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/zoom_in_notes_widget.dart';

import '../colors.dart';
import '../utils/styles.dart';
import 'clickable_widget.dart';
import 'dialog_image.dart';

class CardTextAndImageWidget<T> extends StatefulWidget {
  final BoxConstraints constraints;
  final T slectedInfoDialog;
  final List<T> listDialogInfo;
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
  late String _selectedItem;
  late String _selectedImg;

  late String _infoText;
  late String _selectedImageText;

  late AppLocalizations locals;

  @override
  void initState() {
    _selectedItem = widget.slectedInfoDialog.name as String;
    _selectedImg = widget.slectedInfoDialog.image as String;
    _infoText = widget.slectedInfoDialog.description as String;
    _selectedImageText = widget.slectedInfoDialog.imageText as String;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  void chandeState(String? selctedItem, String? image, String? textDescription,
      String? imageText, String? subTitle) {
    setState(() {
      _selectedItem = selctedItem!;
      _selectedImg = image!;
      _infoText = textDescription!;
      _selectedImageText = imageText!;
    });
  }

  Widget buttomItemsList(
      {String? name,
      String? selected,
      String? image,
      String? text,
      String? subTitle,
      String? imageText}) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Clickable(
        onPressed: () {
          chandeState(selected, image, text, imageText, subTitle);
        },
        child: AutoSizeText(name!.toUpperCase(),
            maxLines: 1,
            style: _selectedItem == selected
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.constraints.maxWidth,
      height: widget.constraints.maxHeight,
      margin: EdgeInsets.symmetric(
          horizontal: widget.constraints.maxWidth * 0.2,
          vertical: widget.constraints.maxHeight * 0.15),
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
                        key: ValueKey(_selectedImg),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(_selectedImg),
                                fit: BoxFit.cover)),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Clickable(
                              onPressed: () {
                                showGeneralDialog(
                                    context: context,
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    transitionBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return LayoutBuilder(
                                          builder: (context, constraints) =>
                                              DialogImageWidget(
                                                animation: animation,
                                                selectedImage: _selectedImg,
                                                selectedImageText:
                                                    _selectedImageText,
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
                    flex: 2,
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
                                          color: AppColors.grey, width: 1.2))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 1,
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
                                                    child: AutoSizeText(
                                                      "${widget.titleText}\n",
                                                      maxLines: 2,
                                                      minFontSize: 10,
                                                      style: Theme.of(context)
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
                                                          widget.subTitleText,
                                                          minFontSize: 13,
                                                          maxLines: 1,
                                                          style:
                                                              Theme.of(context)
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
                                            color: AppColors.grey, width: 1.2),
                                      )),
                                      child:
                                          ListView(shrinkWrap: true, children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16, right: 38, bottom: 16),
                                          child: RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                text: '$_selectedItem\n\n'
                                                    .toUpperCase(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3),
                                            TextSpan(
                                              text: _infoText,
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
                                      .map((data) => buttomItemsList(
                                            name: data.name as String,
                                            image: data.image as String,
                                            text: data.description as String,
                                            subTitle: data.name as String,
                                            imageText: data.imageText as String,
                                            selected: data.name as String,
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
    );
  }
}
