import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_right.dart';

import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/arrow_text_left.dart';
import '../../../../core/widgets/hero_photo_widget.dart';
import '../../../../core/widgets/widgets.dart';

class CharacrterPage extends StatefulWidget {
  const CharacrterPage({Key? key}) : super(key: key);

  @override
  _CharacrterPageState createState() => _CharacrterPageState();
}

class _CharacrterPageState extends State<CharacrterPage> {
  late AppLocalizations locale;

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    final List<CharacterModel> listCharacters = [
      CharacterModel(
        photo: AssetsPath.periclesImage,
        name: locale.namePericles,
      ),
      CharacterModel(
        photo: AssetsPath.thucididesImage,
        name: locale.thucididesName,
      ),
      CharacterModel(
        photo: AssetsPath.socratesImage,
        name: locale.socratesAndPlatoName,
      ),
      CharacterModel(
        photo: AssetsPath.aristophanesImage,
        name: locale.aristophanesAndSophocles,
      ),
    ];
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.charactersBackgroundImage),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, right: 50),
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    iconSize: 30,
                    onPressed: () {},
                  ),
                )),
            Positioned(
              left: 100,
              right: 100,
              child: Container(
                height: constraints.maxHeight * 0.1,
                width: constraints.maxWidth * 0.1,
                margin: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                child: Column(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        locale.athens5thCentury.toUpperCase(),
                        maxLines: 1,
                        style: DefaultTheme.standard.textTheme.headline2,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        locale.keyPeopleAthens5thCenturyBCE.toLowerCase(),
                        maxLines: 1,
                        style: DefaultTheme.standard.textTheme.subtitle2,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: constraints.maxHeight,
                  margin: EdgeInsets.only(
                      bottom: 80, top: constraints.maxHeight * 0.2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listCharacters
                          .map((photo) => CharacterModel(
                                name: photo.name,
                                photo: photo.photo,
                                onTap: () {
                                  context.router.push(CharacterInfoPageRoute(
                                      photoHero: photo,
                                      listCharacters: listCharacters));
                                },
                              ))
                          .toList()),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, left: 24),
                child: ArrowLeftTextWidget(
                    textSubTitle: locale.eventTimeline,
                    textTitle: locale.athens5thCentury,
                    onTap: () {
                      context.router.pop();
                    }),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10, left: 24),
                child: ArrowRightTextWidget(
                    textSubTitle: locale.quiz,
                    textTitle: locale.athens5thCentury,
                    onTap: () {
                      context.router.push(const QuizPageRoute());
                    }),
              ),
            ),
          ],
        ),
      );
    });
  }
}
