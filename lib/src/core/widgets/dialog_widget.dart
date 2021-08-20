import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../../features/panarama_left/presentation/models/dialog_model.dart';
import '../colors.dart';
import '../utils/styles.dart';
import 'clickable_widget.dart';
import 'dialog_image.dart';

class DialogWidget extends StatefulWidget {
  final Animation<double> animation;
  final BoxConstraints constraints;

  final InfoDialogModel slectedInfoDialog;
  final List<InfoDialogModel> listDialogInfo;

  const DialogWidget({
    Key? key,
    required this.animation,
    required this.slectedInfoDialog,
    required this.listDialogInfo,
    required this.constraints,
  }) : super(key: key);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  late String _selectedItem;
  late String _selectedImg;
  late String _selectedSubTitle;
  late String _infoText;
  late String _selectedImageText;

  late AppLocalizations locals;

  @override
  void initState() {
    _selectedItem = widget.slectedInfoDialog.title;
    _selectedImg = widget.slectedInfoDialog.image;
    _infoText = widget.slectedInfoDialog.description;
    _selectedImageText = widget.slectedInfoDialog.imageDescription;

    _selectedSubTitle = widget.slectedInfoDialog.subTitle;
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
      _selectedSubTitle = subTitle!;
    });
  }

  Widget charactersNameListWidget(
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
              backgroundColor: AppColors.white,
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
                                child: Container(
                                  color: Colors.black,
                                  child: const Icon(
                                    Icons.zoom_in,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  flex: 2,
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
                                                  "${locals.chapter1Name}\n"
                                                      .toUpperCase(),
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
                                                child: AutoSizeText(
                                                    locals
                                                        .plaguePoliticalInstability,
                                                    minFontSize: 13,
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                            child: Clickable(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Icon(Icons.clear)))
                                      ])),
                              Expanded(
                                flex: 8,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: AppColors.grey,
                                              width: 1.2),
                                          bottom: BorderSide(
                                              color: AppColors.grey,
                                              width: 1.2))),
                                  child: ListView(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 30),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: '$_selectedSubTitle\n\n'
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
                              Flexible(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: widget.listDialogInfo
                                          .map((data) =>
                                              charactersNameListWidget(
                                                  name: data.title,
                                                  image: data.image,
                                                  text: data.description,
                                                  subTitle: data.subTitle,
                                                  imageText:
                                                      data.imageDescription,
                                                  selected: data.title))
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
}
