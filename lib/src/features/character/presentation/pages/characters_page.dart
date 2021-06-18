import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/arrow_text_left.dart';
import '../../../../core/widgets/hero_photo_widget.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../map/presentation/pages/map_page.dart';
import 'character_info_page.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

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
                margin: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                child: Column(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        locale.athens5thCentury.toUpperCase(),
                        style: DefaultTheme.standard.textTheme.headline2,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        locale.keyPeopleAthens5thCenturyBCE.toLowerCase(),
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
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 1500),
                                      pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double>
                                              secondaryAnimation) {
                                        return CharacterInfoPage(
                                            photoHero: photo,
                                            listCharacters: listCharacters);
                                      },
                                      transitionsBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation,
                                          Widget child) {
                                        return Align(
                                          child: FadeTransition(
                                            opacity: animation.drive(
                                                Tween<double>(
                                                    begin: 0.0, end: 1.0)),
                                            child: child,
                                          ),
                                        );
                                      },
                                    ),
                                  );
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
                      // _scrollController.animateTo(
                      //     _scrollController.position.maxScrollExtent,
                      //     duration: const Duration(milliseconds: 50),
                      //     curve: Curves.easeIn);
                      Navigator.of(context).push(PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 1),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;

                            final tween = Tween(begin: begin, end: end);

                            return Align(
                              child: SlideTransition(
                                position: animation.drive(tween),
                                //opacity: animation,
                                child: child,
                              ),
                            );
                          },
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return const MapPage();
                          }));
                    }),
              ),
            ),
          ],
        ),
      );
    });
  }
}
