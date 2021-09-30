import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../models/caracter_model.dart';

class CharacrterPage extends StatefulWidget {
  const CharacrterPage({Key? key}) : super(key: key);

  @override
  _CharacrterPageState createState() => _CharacrterPageState();
}

class _CharacrterPageState extends State<CharacrterPage> {
  late List<CharacterModelNotifier> list;
  late AppLocalizations locale;

  final backgroundplayer = AudioPlayer();
  bool isSoundOn = false;

  @override
  void didChangeDependencies() {
    locale = AppLocalizations.of(context)!;
    setList(context);

    super.didChangeDependencies();
  }

  void setList(BuildContext context) {
    list = [
      CharacterModelNotifier(
        left: -30,
        bodyText: locale.periclesTextDescription,
        image: AssetsPath.periclesImage,
        name: locale.namePericles,
      ),
      CharacterModelNotifier(
        left: MediaQuery.of(context).size.width * 0.13,
        image: AssetsPath.thucydidesImage,
        name: locale.thucididesName,
        bodyText: locale.thucydidesTextDescription,
      ),
      CharacterModelNotifier(
        left: MediaQuery.of(context).size.width * 0.3,
        image: AssetsPath.socratesPlatoImage,
        name: locale.socratesAndPlatoName,
        bodyText: locale.socratesAndPlatoTextDescription,
      ),
      CharacterModelNotifier(
        left: MediaQuery.of(context).size.width * 0.55,
        image: AssetsPath.aristophanesSophoclesImage,
        name: locale.aristophanesAndSophocles,
        bodyText: locale.aristophanesAndSophoclesTextDescription,
      ),
      CharacterModelNotifier(
        left: MediaQuery.of(context).size.width * 0.8,
        image: AssetsPath.phidiasImage,
        name: locale.phidias,
        bodyText: locale.phidiasTextDescription,
      ),
    ];
  }

  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigationPage(),
      body: _body(),
    );
  }

  Widget _body() {
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
                      child: Text(
                        locale.athens5thCentury.toUpperCase(),
                        maxLines: 1,
                        style: DefaultTheme.standard.textTheme.headline2
                            ?.copyWith(
                                fontSize: TextFontSize.getHeight(36, context)),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        locale.keyPeopleOfTheAge.toLowerCase(),
                        maxLines: 1,
                        style: DefaultTheme.standard.textTheme.subtitle2
                            ?.copyWith(
                                fontSize: TextFontSize.getHeight(36, context)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: constraints.maxHeight,
                margin: EdgeInsets.only(),
                child: Stack(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: list
                        .map((photo) => Positioned(
                              top: constraints.maxHeight * 0.2,
                              left: photo.left,
                              bottom: 80,
                              child: CharacterModel(
                                name: photo.name,
                                photo: photo.image,
                                description: photo.bodyText,
                                onTap: () {
                                  context.router.push(CharacterInfoPageRoute(
                                    listCharacters: list,
                                    photoHero: photo,
                                  ));
                                },
                              ),
                            ))
                        .toList()),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(bottom: 24, left: 24),
                child: ArrowLeftTextWidget(
                    textSubTitle: locale.timelineOfMainEvents,
                    textTitle: locale.athens5thCentury,
                    onTap: () {
                      LeafDetails.currentVertex = 4;
                      NavigationSharedPreferences.upDateShatedPreferences();
                      if (kIsWeb) {
                        html.window.history.back();
                        context.router.pop();
                      } else {
                        context.router.pop();
                      }
                    }),
              ),
            ),
          ],
        ),
      );
    });
  }
}
