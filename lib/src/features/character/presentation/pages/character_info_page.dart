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
import '../../../navigation/presentation/pages/navigation_page.dart';

class CharacterInfoPage extends StatefulWidget {
  final CharacterModel photoHero;
  final List<CharacterModel> listCharacters;
  const CharacterInfoPage(
      {required this.photoHero, required this.listCharacters});

  @override
  _CharacterInfoPageState createState() => _CharacterInfoPageState();
}

class _CharacterInfoPageState extends State<CharacterInfoPage> {
  late String _selectedItem;
  late String _selectedImg;
  late String _infoText;
  late AppLocalizations locale;
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _selectedItem = widget.photoHero.name;
    _selectedImg = widget.photoHero.photo;
    _infoText = widget.photoHero.description;
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
                          image:
                              AssetImage(AssetsPath.charactersBackgroundImage),
                          fit: BoxFit.cover))),
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
                              key: ValueKey(_selectedImg),
                              name: _selectedItem,
                              photo: _selectedImg,
                              description: _infoText,
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
                                                    child: AutoSizeText(
                                                        locale
                                                            .keyPeopleOfTheAge,
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
                                                          right: 10),
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                      text: '$_selectedItem\n\n'
                                                          .toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline3
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .black54),
                                                    ),
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
                                        children: widget.listCharacters
                                            .map((data) =>
                                                charactersNameListWidget(
                                                    name: data.name,
                                                    image: data.photo,
                                                    text: data.description,
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

  void chandeState(
      String? selctedItem, String? image, String? textDescription) {
    setState(() {
      _selectedItem = selctedItem!;
      _selectedImg = image!;
      _infoText = textDescription!;
    });
  }

  Widget charactersNameListWidget(
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
                      ?.copyWith(color: AppColors.greyDeep)),
        ));
  }
}
