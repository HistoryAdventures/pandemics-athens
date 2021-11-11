import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
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
        left: 24,
        top: 16,
        bottom: 116,
        bodyText: locale.periclesTextDescription,
        image: AssetsPath.periclesImage,
        name: locale.namePericles,
        subTitle: locale.namePericles,
      ),
      CharacterModelNotifier(
        top: 24,
        left: 307,
        bottom: 18,
        image: AssetsPath.thucydidesImage,
        name: locale.thucididesName,
        bodyText: locale.thucydidesTextDescription,
        subTitle: locale.thucididesName,
      ),
      CharacterModelNotifier(
        left: 562,
        top: 24,
        bottom: 110,
        image: AssetsPath.socratesPlatoImage,
        name: locale.socratesAndPlatoName,
        bodyText: locale.socratesAndPlatoTextDescription,
        subTitle: locale.subTitleSocratesAndPlatoName,
      ),
      CharacterModelNotifier(
        top: 43,
        left: 883,
        bottom: 0,
        image: AssetsPath.aristophanesSophoclesImage,
        name: locale.aristophanesAndSophocles,
        bodyText: locale.aristophanesAndSophoclesTextDescription,
        subTitle: locale.subTitleAristophanesAndSophocles,
      ),
      CharacterModelNotifier(
        top: 0,
        left: 1318,
        bottom: 64,
        image: AssetsPath.phidiasImage,
        name: locale.phidias,
        bodyText: locale.phidiasTextDescription,
        subTitle: locale.subTitlePhidias,
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
                      icons: isSoundOn ? AssetsPath.iconVolumeOn : AssetsPath.iconVolumeOff,
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
              top: HW.getHeight(196, context),
              left: 0,
              right: 0,
              child: Container(
                height: HW.getHeight(76, context),
                width: HW.getWidth(276, context),
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
                                fontSize: TextFontSize.getHeight(24, context)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: HW.getWidth(160.03, context),
              right: HW.getWidth(148, context),
              top: HW.getHeight(359, context),
              child: Container(
                width: HW.getWidth(1611, context),
                height: HW.getHeight(666, context),
                child: Stack(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: list
                        .map((photo) => Positioned(
                              top: HW.getHeight(photo.top!, context),
                              left: HW.getWidth(photo.left!, context),
                              bottom: HW.getHeight(photo.bottom!, context),
                              child: CharacterModel(
                                subTitle: photo.subTitle,
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
          ],
        ),
      );
    });
  }
}
