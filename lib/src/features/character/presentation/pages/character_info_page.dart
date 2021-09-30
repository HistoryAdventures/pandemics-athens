import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
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
    characterModelNotifierprovider = CharacterModelNotifier(
      bodyText: widget.photoHero.bodyText,
      image: widget.photoHero.image,
      name: widget.photoHero.name,
    );
    super.didChangeDependencies();
  }

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetsPath.charactersBackgroundImage),
                      fit: BoxFit.cover),
                ),
              ),
              Align(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 80,
                    top: constraints.maxHeight * 0.18,
                    left: constraints.maxWidth * 0.1,
                    right: constraints.maxWidth * 0.1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
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
                            child: CharacterModel(
                              key:
                                  ValueKey(characterModelNotifierprovider.name),
                              name: characterModelNotifierprovider.name,
                              photo: characterModelNotifierprovider.image,
                              description:
                                  characterModelNotifierprovider.bodyText,
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
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.05,
                              vertical: constraints.maxHeight * 0.03),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              boxShadow: Shadows.universal),
                          padding:
                              EdgeInsets.all(constraints.maxHeight * 0.024),
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
                                    children: [
                                      Flexible(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                    child: AutoSizeText(
                                                      "${locale.chapter1Athens5thCentury}\n",
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
                                                          bottom: constraints
                                                                  .maxHeight *
                                                              0.01),
                                                      child: AutoSizeText(
                                                          locale
                                                              .keyPeopleOfTheAge,
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
                                                      if (kIsWeb) {
                                                        html.window.history
                                                            .back();
                                                        context.router.pop();
                                                      } else {
                                                        context.router.pop();
                                                      }
                                                    },
                                                    child: const Icon(
                                                        Icons.clear)))
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
                                              shrinkWrap: true,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 24, top: 16),
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                      text:
                                                          '${characterModelNotifierprovider.name}\n\n'
                                                              .toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline3
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .black54),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          characterModelNotifierprovider
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
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: widget.listCharacters
                                            .map((data) =>
                                                charactersNameListWidget(
                                                    name: data.name,
                                                    image: data.image,
                                                    text: data.bodyText,
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
                  padding: const EdgeInsets.only(bottom: 24, left: 24),
                  child: ArrowLeftTextWidget(
                      textSubTitle: locale.timelineOfMainEvents,
                      textTitle: locale.athens5thCentury,
                      onTap: () {
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
                  scaffoldkey.currentState!.openEndDrawer();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget charactersNameListWidget(
      {required String name,
      required String selected,
      required String image,
      required String text}) {
    return Container(
        margin: const EdgeInsets.only(right: 30),
        child: Clickable(
          onPressed: () {
            setState(() {
              characterModelNotifierprovider.changeCaracterInfo(
                  name: name, image: image, bodyText: text);
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
