import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../modesl/socrates_info_model.dart';

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
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
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
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            const BackgroundWidget(),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.15,
                    vertical: constraints.maxHeight * 0.2),
                decoration: BoxDecoration(
                    boxShadow: Shadows.universal, color: AppColors.white),
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: constraints.maxHeight,
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
                                            selectedImage: _selectedImg,
                                            selectedImageText: _selectedText,
                                            constraints: constraints,
                                            animation: animation,
                                          ),
                                        );
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: AutoSizeText(
                                              "${locale.chapter1EndOfWar}\n",
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  ?.copyWith(
                                                      color: AppColors.black25),
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                                locale.endOfThePeloponneseanWar,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                            shrinkWrap: true,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 10),
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
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
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
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 24),
                child: ArrowLeftTextWidget(
                    textSubTitle: locale.deathOfSocrates,
                    textTitle: locale.plagueAndPersecution,
                    onTap: () {
                      LeafDetails.currentVertex = 15;
                      if (kIsWeb) {
                        html.window.history.back();
                        context.router.pop();
                      } else {
                        context.router.pop();
                      }
                    }),
              ),
            ),
            SoundAndMenuWidget(
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
              onTapMenu: () {
                Scaffold.of(context).openEndDrawer();
              },
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
        margin: const EdgeInsets.only(right: 30),
        child: Clickable(
          onPressed: () {
            chandeState(selected, image, text);
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
                      ?.copyWith(color: AppColors.black54)),
        ));
  }
}
