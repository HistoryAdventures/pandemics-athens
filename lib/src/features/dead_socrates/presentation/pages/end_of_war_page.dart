import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_left.dart';
import 'package:history_of_adventures/src/features/dead_socrates/presentation/widgets/show_dialog.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/animated_widgets/background_widget.dart';
import '../../../../core/widgets/clickable_widget.dart';
import 'modesl/socrates_info_model.dart';

class EndOfWarPage extends StatefulWidget {
  const EndOfWarPage({Key? key}) : super(key: key);

  @override
  _EndOfWarPageState createState() => _EndOfWarPageState();
}

class _EndOfWarPageState extends State<EndOfWarPage> {
  late AppLocalizations locale;
  late String _selectedItem;
  late String _selectedImg;
  late String _selectedText;
  late List<SocratesInfoModel> socratesList;
  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    _selectedItem = locale.theSicilianExpedition;
    _selectedText = locale.theSicilianExpeditionText;
    _selectedImg = AssetsPath.endOfWar1;
    socratesList = [
      SocratesInfoModel(
          description: locale.theSicilianExpeditionText,
          image: AssetsPath.endOfWar1,
          name: locale.theSicilianExpedition,
          imageText: locale.theSicilianExpeditionTextImage),
      SocratesInfoModel(
        name: locale.theWallsCrumble,
        description: locale.theWallsCrumbleText,
        imageText: locale.theWallsCrumbleTextImage,
        image: AssetsPath.endOfWar2,
      ),
      SocratesInfoModel(
        name: locale.theAfterlifeOfClassicalAthens,
        description: locale.theAfterlifeOfClassicalAthensText,
        imageText: locale.theAfterlifeOfClassicalAthensTextImage,
        image: AssetsPath.endOfWar3,
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            const BackgroundWidget(),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 50, vertical: constraints.maxHeight * 0.1),
                decoration:
                    BoxDecoration(color: AppColors.white.withOpacity(0.5)),
                padding: const EdgeInsets.all(24),
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
                                              ShowDialog(
                                            selectedImg: _selectedImg,
                                            selectedText: _selectedText,
                                            size: Size(
                                              constraints.maxWidth,
                                              constraints.maxHeight,
                                            ),
                                            animation: animation,
                                          ),
                                        );
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 200),
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
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
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
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
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
                                        text:
                                            '$_selectedItem\n\n'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                      TextSpan(
                                        text: _selectedText,
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
                                      children: socratesList
                                          .map((data) =>
                                              deadofSocratesListWidget(
                                                  name: data.name,
                                                  text: data.description,
                                                  image: data.image,
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
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 24),
                child: ArrowLeftTextWidget(
                    textSubTitle: locale.deathOfSocrates,
                    textTitle: locale.plagueAndPersecution,
                    onTap: () {
                      context.router.pop();
                    }),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_up),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.apps))
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void chandeState(String? selctedItem, String? image, String? text) {
    setState(() {
      _selectedItem = selctedItem!;
      _selectedImg = image!;
      _selectedText = text!;
    });
  }

  Widget deadofSocratesListWidget(
      {String? name, String? selected, String? image, String? text}) {
    return Container(
        margin: const EdgeInsets.only(left: 30),
        child: Clickable(
          onPressed: () {
            chandeState(selected, image, text);
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
