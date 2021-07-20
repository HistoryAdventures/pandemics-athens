import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

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
                alignment: Alignment.topRight,
                child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                      iconSize: 30,
                    )),
              ),
              Align(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 80,
                  ),
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
                              vertical: constraints.maxHeight * 0.1),
                          decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.5)),
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(
                                height: 30,
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
        margin: const EdgeInsets.only(left: 30),
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
