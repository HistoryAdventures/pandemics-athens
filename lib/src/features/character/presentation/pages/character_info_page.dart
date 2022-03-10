import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/widgets/custom_scroolbar.dart';
import 'package:history_of_adventures/src/features/navigation/presentation/models/leaf_detail_model.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../models/caracter_model.dart';

class CharacterInfoPage extends StatefulWidget {
  final CharacterModelNotifier photoHero;
  final List<CharacterModelNotifier> listCharacters;
  const CharacterInfoPage({
    required this.photoHero,
    required this.listCharacters,
  });

  @override
  _CharacterInfoPageState createState() => _CharacterInfoPageState();
}

class _CharacterInfoPageState extends State<CharacterInfoPage> {
  late AppLocalizations locale;
  final scaffoldkey = GlobalKey<ScaffoldState>();

  late CharacterModelNotifier characterModelNotifierprovider;
  String? hoveredItemIndex;
  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    characterModelNotifierprovider = CharacterModelNotifier(
      bodyText: widget.photoHero.bodyText,
      image: widget.photoHero.image,
      name: widget.photoHero.name,
      subTitle: widget.photoHero.subTitle,
    );
    firebaseScreenTracking();
    super.initState();
  }

  Future<void> firebaseScreenTracking() async {
    // await FirebaseAnalytics.instance.setCurrentScreen(screenName: '/glossary-pageeeee');
    await FirebaseAnalytics.instance.logEvent(
        name: "key-people-of-the-age",
        parameters: {
          "page_url":
              "https://pandemics.historyadventures.app/key-people-of-the-age"
        });
    await FirebaseAnalytics.instance
        .logScreenView(screenName: "key-people-of-the-age");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsPath.charactersBackgroundImage),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: AnimatedSwitcher(
                    duration: Times.slowest,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: CharacterModel(
                      height: HW.getHeight(870, context),
                      width: HW.getWidth(500, context),
                      subTitle: characterModelNotifierprovider.subTitle,
                      key: ValueKey(characterModelNotifierprovider.name),
                      name: characterModelNotifierprovider.name,
                      photo: characterModelNotifierprovider.image,
                      description: characterModelNotifierprovider.bodyText,
                      onTap: () {
                        if (kIsWeb) {
                          html.window.history.back();
                          context.router.pop();
                          AudioPlayerUtil().playSound(AssetsPath.infoClose);
                        } else {
                          context.router.pop();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: HW.getWidth(275, context),
                ),
                Container(
                  height: HW.getHeight(676, context),
                  width: HW.getWidth(800, context),
                  decoration: BoxDecoration(
                      color: AppColors.white, boxShadow: Shadows.universal),
                  padding: EdgeInsets.all(HW.getHeight(24, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: HW.getHeight(92, context),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom:
                                                    HW.getHeight(8, context)),
                                            child: AutoSizeText(
                                              "${locale.chapter1Athens5thCentury}\n",
                                              maxLines: 1,
                                              minFontSize: 10,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  ?.copyWith(
                                                      color: AppColors.black54,
                                                      fontSize: TextFontSize
                                                          .getHeight(
                                                              16, context)),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(locale.keyPeopleOfTheAge,
                                              maxLines: 1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2
                                                  ?.copyWith(
                                                      fontSize: TextFontSize
                                                          .getHeight(
                                                              32, context))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                      child: Clickable(
                                          onPressed: () {
                                            AudioPlayerUtil().playSound(
                                                AssetsPath.infoClose);
                                            LeafDetails.currentVertex = 4;
                                            LeafDetails.visitedVertexes.add(4);
                                            NavigationSharedPreferences
                                                .upDateShatedPreferences();

                                            context.router.pop();
                                          },
                                          child: SizedBox(
                                            height: HW.getHeight(19, context),
                                            width: HW.getHeight(19, context),
                                            child: Image.asset(
                                                AssetsPath.iconClose,
                                                fit: BoxFit.contain,
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                          )))
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                margin: EdgeInsets.only(
                                  top: HW.getHeight(16, context),
                                  bottom: HW.getHeight(16, context),
                                ),
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
                                  child: ListView(shrinkWrap: true, children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          right: 24, top: 16),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text:
                                              '${characterModelNotifierprovider.subTitle}\n\n'
                                                  .toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              ?.copyWith(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: characterModelNotifierprovider
                                              .bodyText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ])),
                                    )
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: HW.getHeight(22, context),
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: widget.listCharacters
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
                                          child: charactersNameListWidget(
                                              isHoverd:
                                                  hoveredItemIndex == data.name,
                                              name: data.name,
                                              image: data.image,
                                              text: data.bodyText,
                                              selected: data.name,
                                              subTitle: data.subTitle),
                                        ))
                                    .toList())),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: HW.getWidth(160, context),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ArrowLeftTextWidget(
                textSubTitle: locale.timelineOfMainEvents,
                textTitle: locale.athens5thCentury,
                onTap: () {
                  AudioPlayerUtil().playSound(AssetsPath.screenTransitionSound);
                  LeafDetails.currentVertex = 4;
                  LeafDetails.visitedVertexes.add(4);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.replace(const MapPageToLeft());
                }),
          ),
          SoundAndMenuWidget(
            icons: AudioPlayerUtil.isSoundOn
                ? AssetsPath.iconVolumeOn
                : AssetsPath.iconVolumeOff,
            onTapVolume: AudioPlayerUtil.isSoundOn
                ? () {
                    setState(() {
                      AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                    });
                  }
                : () {
                    setState(() {
                      AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                    });
                  },
            onTapMenu: () {
              scaffoldkey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
    );
  }

  Widget charactersNameListWidget(
      {required String name,
      required String selected,
      required String image,
      required String subTitle,
      required String text,
      bool isHoverd = false}) {
    return Container(
        margin: EdgeInsets.only(right: HW.getWidth(16, context)),
        child: Clickable(
          onPressed: () {
            AudioPlayerUtil().playSound(AssetsPath.changeIndex);
            setState(() {
              characterModelNotifierprovider.changeCaracterInfo(
                  name: name, image: image, bodyText: text, subTitle: subTitle);
            });
          },
          child: AutoSizeText(name.toUpperCase(),
              maxLines: 1,
              style: characterModelNotifierprovider.name == selected || isHoverd
                  ? Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.orange,
                      fontSize: TextFontSize.getHeight(16, context))
                  : Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.greyDeep,
                      fontSize: TextFontSize.getHeight(16, context))),
        ));
  }
}
