import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_right.dart';
import 'package:history_of_adventures/src/core/widgets/sound_and_menu_widget.dart';
import 'package:history_of_adventures/src/features/dead_socrates/presentation/widgets/show_dialog.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/animated_widgets/background_widget.dart';
import '../../../../core/widgets/clickable_widget.dart';
import 'modesl/socrates_info_model.dart';

class DeadOfSocratesPage extends StatefulWidget {
  const DeadOfSocratesPage({Key? key}) : super(key: key);

  @override
  _DeadOfSocratesPageState createState() => _DeadOfSocratesPageState();
}

class _DeadOfSocratesPageState extends State<DeadOfSocratesPage> {
  late AppLocalizations locale;
  late String _selectedItem;
  late String _selectedImg;
  late String _selectedText;
  late List<SocratesInfoModel> socratesList;

  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    _selectedItem = locale.athenianDefeat;
    _selectedText = locale.athenianDefeatText;
    _selectedImg = AssetsPath.deadOfSocrates1;
    socratesList = [
      SocratesInfoModel(
          description: locale.athenianDefeatText,
          image: AssetsPath.deadOfSocrates1,
          name: locale.athenianDefeat,
          imageText: locale.athenianDefeatImageText),
      SocratesInfoModel(
        name: locale.timeOfTyrants,
        description: locale.timeOfTyrantsText,
        imageText: locale.timeOfTyrantsImageText,
        image: AssetsPath.deadOfSocrates2,
      ),
      SocratesInfoModel(
        name: locale.deathPhilosopher,
        description: locale.deathPhilosopherText,
        imageText: locale.deathPhilosopherImageText,
        image: AssetsPath.deadOfSocrates3,
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
                    horizontal: 50, vertical: constraints.maxHeight * 0.2),
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
                                                    animation: animation,
                                                    size: Size(
                                                      constraints.maxWidth,
                                                      constraints.maxHeight,
                                                    )));
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
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Clickable(
                  onPressed: () {
                    //context.router.push(const EndOfWarPageRoute());
                  },
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        AssetsPath.arrowDounImage,
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 24),
                child: ArrowRightTextWidget(
                    textSubTitle: locale.endOfThePeloponneseanWar,
                    textTitle: locale.plagueAndPersecution,
                    onTap: () {
                      context.router.push(const EndOfWarPageRoute());
                    }),
              ),
            ),
            SoundAndMenuWidget(
              widget: Clickable(
                onPressed: () {
                  context.router.pop();
                },
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                      AssetsPath.arrowUpImage,
                      color: Colors.black,
                    )),
              ),
              icons: isSoundOn ? Icons.volume_up : Icons.volume_mute,
              onTapVolume: isSoundOn
                  ? () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                        backgroundplayer.pause();
                      });
                    }
                  : () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                        backgroundplayer.play();
                      });
                    },
              onTapMenu: () {},
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
