import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/features/navigation/presentation/pages/navigation_page.dart';
import 'package:history_of_adventures/src/features/navigation/presentation/widgets/navigation_tree.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/widgets.dart';

class CharacrterPage extends StatefulWidget {
  const CharacrterPage({Key? key}) : super(key: key);

  @override
  _CharacrterPageState createState() => _CharacrterPageState();
}

class _CharacrterPageState extends State<CharacrterPage> {
  late AppLocalizations locale;

  final backgroundplayer = AudioPlayer();
  bool isSoundOn = false;

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: _body(),
    );
  }

  Widget _body() {
    final List<CharacterModel> listCharacters = [
      CharacterModel(
        photo: AssetsPath.periclesImage,
        name: locale.namePericles,
        description: locale.periclesTextDescription,
      ),
      CharacterModel(
        photo: AssetsPath.thucididesImage,
        name: locale.thucididesName,
        description: locale.thucydidesTextDescription,
      ),
      CharacterModel(
        photo: AssetsPath.socratesImage,
        name: locale.socratesAndPlatoName,
        description: locale.socratesAndPlatoTextDescription,
      ),
      CharacterModel(
        photo: AssetsPath.aristophanesImage,
        name: locale.aristophanesAndSophocles,
        description: locale.aristophanesAndSophoclesTextDescription,
      ),
      // CharacterModel(
      //   photo: AssetsPath.aristophanesImage,
      //   name: locale.phidias,
      //   description: locale.phidiasTextDescription,
      // ),
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
                        locale.keyPeopleOfTheAge.toLowerCase(),
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
                                description: photo.description,
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
                    textSubTitle: locale.timelineOfMainEvents,
                    textTitle: locale.athens5thCentury,
                    onTap: () {
                      LeafDetails.visitedVertexes.removeLast();
                      LeafDetails.currentVertex = 4;
                      context.router.pop();
                    }),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Container(
            //     padding: const EdgeInsets.only(bottom: 10, right: 24),
            //     child: ArrowRightTextWidget(
            //         textSubTitle: locale.quiz,
            //         textTitle: locale.athens5thCentury,
            //         onTap: () {
            //           context.router.push(const QuizPageRoute());
            //         }),
            //   ),
            // ),
          ],
        ),
      );
    });
  }
}
