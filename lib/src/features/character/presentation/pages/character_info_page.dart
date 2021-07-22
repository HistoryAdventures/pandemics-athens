import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import '../../../../core/widgets/sound_and_menu_widget.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/arrow_text_left.dart';
import '../../../../core/widgets/hero_photo_widget.dart';
import '../../../../core/widgets/widgets.dart';

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
                      bottom: 80, top: constraints.maxHeight * 0.18),
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              height: constraints.maxHeight,
                              child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
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
                                        Navigator.of(context).pop();
                                        // window.history.go(-1);

                                        //window.history.back();
                                      })))),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: constraints.maxHeight * 0.05),
                          decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.5)),
                          padding:
                              EdgeInsets.all(constraints.maxHeight * 0.024),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: AutoSizeText(
                                        locale.chapter1Name.toUpperCase(),
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ),
                                    Flexible(
                                      child: AutoSizeText(_selectedItem,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: AppColors.grey,
                                              width: 1.2),
                                          bottom: BorderSide(
                                              color: AppColors.grey,
                                              width: 1.2))),
                                  child: ListView(shrinkWrap: true, children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: locale.battleOfThermopylae,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
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
                      textSubTitle: locale.keyPeople,
                      textTitle: locale.athens5thCentury,
                      onTap: () {}),
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
                onTapMenu: () {},
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
                  ? Theme.of(context).textTheme.bodyText1
                  : Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: AppColors.grey)),
        ));
  }
}
