import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/character/presentation/pages/character_info_page.dart';

import '../../../../core/theme.dart';
import '../../../../core/widgets/hero_photo_widget.dart';
import '../../../../core/widgets/widgets.dart';

class CharacrterPage extends StatefulWidget {
  const CharacrterPage({Key? key}) : super(key: key);

  @override
  _CharacrterPageState createState() => _CharacrterPageState();
}

class _CharacrterPageState extends State<CharacrterPage> {
  List<PhotoHero> listCharacters = [
    const PhotoHero(
      photo: "assets/characters/character_1.png",
      name: "Pericles",
    ),
    const PhotoHero(
      photo: "assets/characters/character_2.png",
      name: "thucidides",
    ),
    const PhotoHero(
      photo: "assets/characters/character_3.png",
      name: "socrates and plato",
    ),
    const PhotoHero(
      photo: "assets/characters/character_4.png",
      name: "Aristophanes and Sophocles",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              image: AssetImage("assets/image_back/characters_page_back.png"),
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
              //alignment: Alignment.topCenter,
              child: Container(
                //width: constraints.maxWidth,
                height: constraints.maxHeight * 0.1,
                margin: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                child: Column(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "Athens, 5th Century BC".toUpperCase(),
                        style: DefaultTheme.standard.textTheme.headline2,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        "Key people in Athens 5th century BCE".toLowerCase(),
                        // maxLines: 1,
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
                          .map((photo) => PhotoHero(
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
                                        );
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
                height: constraints.maxHeight * 0.15,
                margin: const EdgeInsets.only(bottom: 14, left: 24),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 24),
                      height: 30,
                      width: 30,
                      child: Clickable(
                          onPressed: () {},
                          child: Image.asset('assets/icons/arrow_back.png')),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              'Athens, 5th century BC'.toUpperCase(),
                              style: DefaultTheme.standard.textTheme.caption
                                  ?.copyWith(fontSize: 14),
                            ),
                          ),
                          Flexible(
                            child: AutoSizeText(
                              'event timeline'.toUpperCase(),
                              style: DefaultTheme.standard.textTheme.headline2
                                  ?.copyWith(fontSize: 26),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
