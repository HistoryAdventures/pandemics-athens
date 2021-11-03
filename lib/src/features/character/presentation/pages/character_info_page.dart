import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:just_audio/just_audio.dart';
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
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  late CharacterModelNotifier characterModelNotifierprovider;

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
    super.initState();
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
          Positioned(
            top: HW.getHeight(202, context),
            right: HW.getWidth(160, context),
            left: HW.getWidth(960, context),
            child: Container(
              height: HW.getHeight(676, context),
              width: HW.getWidth(768, context),
              decoration: BoxDecoration(
                  color: AppColors.white, boxShadow: Shadows.universal),
              padding: EdgeInsets.all(HW.getHeight(24, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: HW.getHeight(68, context),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              bottom: HW.getHeight(8, context)),
                                          child: AutoSizeText(
                                            "${locale.chapter1Athens5thCentury}\n",
                                            maxLines: 1,
                                            minFontSize: 10,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                ?.copyWith(
                                                    color: AppColors.black54,
                                                    fontSize:
                                                        TextFontSize.getHeight(
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
                                                    fontSize:
                                                        TextFontSize.getHeight(
                                                            32, context))),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                    child: Clickable(
                                        onPressed: () {
                                          if (kIsWeb) {
                                            html.window.history.back();
                                            context.router.pop();
                                          } else {
                                            context.router.pop();
                                          }
                                        },
                                        child: const Icon(
                                          Icons.clear,
                                          color: AppColors.black54,
                                        )))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
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
                              child: ListView(shrinkWrap: true, children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(right: 24, top: 16),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          '${characterModelNotifierprovider.subTitle}\n\n'
                                              .toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          ?.copyWith(color: AppColors.black54),
                                    ),
                                    TextSpan(
                                      text: characterModelNotifierprovider
                                          .bodyText,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
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
                  Container(
                    height: HW.getHeight(19, context),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: widget.listCharacters
                                .map((data) => charactersNameListWidget(
                                    name: data.name,
                                    image: data.image,
                                    text: data.bodyText,
                                    selected: data.name,
                                    subTitle: data.subTitle))
                                .toList())),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: HW.getHeight(190, context),
            bottom: HW.getHeight(190, context),
            left: HW.getWidth(200, context),
            right: HW.getWidth(1000, context),
            child: Container(
              // color: Colors.red,
              child: SizedBox(
                child: AnimatedSwitcher(
                  duration: Times.medium,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: CharacterModel(
                    subTitle: characterModelNotifierprovider.subTitle,
                    key: ValueKey(characterModelNotifierprovider.name),
                    name: characterModelNotifierprovider.name,
                    photo: characterModelNotifierprovider.image,
                    description: characterModelNotifierprovider.bodyText,
                    onTap: () {
                      if (kIsWeb) {
                        html.window.history.back();
                        context.router.pop();
                      } else {
                        context.router.pop();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 24),
              child: ArrowLeftTextWidget(
                  textSubTitle: locale.timelineOfMainEvents,
                  textTitle: locale.athens5thCentury,
                  onTap: () {
                    if (kIsWeb) {
                      html.window.history.go(-2);
                      context.router.popUntilRouteWithName('MapPageRoute');
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
      required String text}) {
    return Container(
        margin: const EdgeInsets.only(right: 30),
        child: Clickable(
          onPressed: () {
            setState(() {
              characterModelNotifierprovider.changeCaracterInfo(
                  name: name, image: image, bodyText: text, subTitle: subTitle);
            });
          },
          child: AutoSizeText(name.toUpperCase(),
              maxLines: 1,
              style: characterModelNotifierprovider.name == selected
                  ? Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.orange)
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.greyDeep)),
        ));
  }
}
