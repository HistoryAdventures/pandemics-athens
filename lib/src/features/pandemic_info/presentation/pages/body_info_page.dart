import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/body_widget.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/animated_widgets/background_widget.dart';
import '../../../../core/widgets/arrow_text_left.dart';
import '../../../../core/widgets/arrow_text_right.dart';
import '../../../../core/widgets/clickable_widget.dart';
import '../../../../core/widgets/man_body_widget.dart';

class BodyInfoPage extends StatefulWidget {
  const BodyInfoPage({Key? key}) : super(key: key);

  @override
  _BodyInfoPageState createState() => _BodyInfoPageState();
}

class _BodyInfoPageState extends State<BodyInfoPage>
    with SingleTickerProviderStateMixin {
  late String _selectedItem;
  late String _selectedImg;
  late AppLocalizations locale;
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _selectedItem = "intro";
    _selectedImg = AssetsPath.manfillImage;
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 80, end: 50).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    final List<ManBodyModel> listCharacters = [
      ManBodyModel(
        photo: AssetsPath.manfillImage,
        name: locale.bodyIntro,
      ),
      ManBodyModel(
        photo: AssetsPath.manheadImage,
        name: locale.bodyHead,
      ),
      ManBodyModel(
        photo: AssetsPath.manthroatImage,
        name: locale.bodyThroat,
      ),
      ManBodyModel(
        photo: AssetsPath.manChestImage,
        name: locale.bodyCheast,
      ),
      ManBodyModel(
        photo: AssetsPath.manstomachImage,
        name: locale.bodyStomach,
      ),
      ManBodyModel(
        photo: AssetsPath.manhandsImage,
        name: locale.bodyhands,
      ),
    ];
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              const BackgroundWidget(),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    iconSize: 30,
                  ),
                ),
              ),
              Align(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 80,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: constraints.maxHeight,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: BodyModel(
                              key: ValueKey(_selectedItem),
                              name: _selectedItem,
                              photo: _selectedImg,
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              onTapStomach: () {
                                setState(() {
                                  _selectedImg = AssetsPath.manstomachImage;
                                });
                              },
                              onTapHends: () {
                                setState(() {
                                  _selectedImg = AssetsPath.manhandsImage;
                                });
                              },
                              onTapChest: () {
                                setState(() {
                                  _selectedImg = AssetsPath.manChestImage;
                                });
                              },
                              onTapThroat: () {
                                setState(() {
                                  _selectedImg = AssetsPath.manthroatImage;
                                });
                              },
                              onTapHead: () {
                                setState(() {
                                  _selectedImg = AssetsPath.manheadImage;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: constraints.maxHeight * 0.1),
                          decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.5)),
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: AutoSizeText(
                                        locale.chapter1Pathogenprofile
                                            .toUpperCase(),
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ),
                                    Flexible(
                                      child: AutoSizeText(_selectedItem,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    top: BorderSide(
                                        color: AppColors.grey, width: 1.2),
                                  )),
                                  child: ListView(shrinkWrap: true, children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: '$_selectedItem\n\n'
                                              .toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        TextSpan(
                                          text: locale.bodyText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ])),
                                    )
                                  ]),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: listCharacters
                                            .map((data) => bodiesNameListWidget(
                                                name: data.name,
                                                image: data.photo,
                                                selected: data.name))
                                            .toList())),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ArrowLeftTextWidget(
                      textSubTitle: locale.whereDidItComeFrom,
                      textTitle: locale.pathogenProfile,
                      onTap: () {
                        context.router.pop();
                      }),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ArrowRightTextWidget(
                      textSubTitle: locale.whatWasIt,
                      textTitle: locale.pathogenProfile,
                      onTap: () {
                        context.router.push(const VirusesInfoPageRoute());
                      }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void chandeState(String? selctedItem, String? image) {
    setState(() {
      _selectedItem = selctedItem!;
      _selectedImg = image!;
    });
  }

  Widget bodiesNameListWidget({String? name, String? selected, String? image}) {
    return Container(
        margin: const EdgeInsets.only(left: 30),
        child: Clickable(
          onPressed: () {
            chandeState(selected, image);
          },
          child: AutoSizeText(name!.toUpperCase(),
              maxLines: 1,
              style: _selectedItem == selected
                  ? Theme.of(context).textTheme.bodyText1
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.grey)),
        ));
  }
}
