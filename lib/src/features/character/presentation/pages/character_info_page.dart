import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/theme.dart';

import 'package:history_of_adventures/src/core/widgets/hero_photo_widget.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

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
  @override
  void initState() {
    _selectedItem = widget.photoHero.name;
    _selectedImg = widget.photoHero.photo;
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/image_back/characters_page_back.png"),
                        fit: BoxFit.cover)),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 50, top: 50),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    iconSize: 30,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(
                      top: 100, bottom: 100, left: 150, right: 100),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: constraints.maxHeight,
                          child: CharacterModel(
                            name: _selectedItem,
                            photo: _selectedImg,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.5)),
                          padding: EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: AutoSizeText(
                                        "Chapter 1 / Plague & Political Instability"
                                            .toUpperCase(),
                                        style: DefaultTheme
                                            .standard.textTheme.subtitle2,
                                      ),
                                    ),
                                    Flexible(
                                      child: AutoSizeText(_selectedItem,
                                          style: DefaultTheme
                                              .standard.textTheme.headline2),
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
                                              color: AppColors.grey, width: 1),
                                          bottom: BorderSide(
                                              color: AppColors.grey,
                                              width: 1))),
                                  child: ListView(shrinkWrap: true, children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                          text: '415, Battle of Thermopylae\n',
                                          style: DefaultTheme
                                              .standard.textTheme.headline3,
                                        ),
                                        TextSpan(
                                          text: text,
                                          style: DefaultTheme
                                              .standard.textTheme.bodyText1,
                                        ),
                                      ])),
                                    )
                                  ]),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    width: constraints.maxWidth,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: widget.listCharacters.length,
                                      itemBuilder: (contex, index) {
                                        var data = widget.listCharacters[index];
                                        return yearsWidget(
                                            name: data.name,
                                            image: data.photo,
                                            selected: data.name);
                                      },
                                    )),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void chandeState(String? selctedItem, String? image) {
    setState(() {
      _selectedItem = selctedItem!;
      _selectedImg = image!;
    });
  }

  Widget yearsWidget({String? name, String? selected, String? image}) {
    return Container(
        margin: const EdgeInsets.only(left: 30),
        child: Clickable(
            onPressed: () {
              chandeState(selected, image);
            },
            child: AutoSizeText(name!.toUpperCase(),
                style: _selectedItem == selected
                    ? DefaultTheme.standard.textTheme.bodyText1
                    : DefaultTheme.standard.textTheme.bodyText1
                        ?.copyWith(color: AppColors.grey))));
  }
}

const String text = '''
    
In the aftermath of Athens’ defeat and the recovery from the devastation wrought by both war and plague, the political landscape of the city fractured.

At first, democracy was a victim. Despite enduring through the year of plague, it had increasingly found starting to creak under the strain of war. In 406 BC for example, 
the Athenian navy had rallied, defeating the Spartans at the Battle of Arginusae. The failure of the commanders to capitalise on this victory however (through no fault of their own, merely bad weather), 
led to a trial in Athens at which six leading naval commanders were executed. This would severely undermine the capacity of the Athenian forces in future.
In the aftermath of Athens’ defeat and the recovery from the devastation wrought by both war and plague, the political landscape of the city fractured.

At first, democracy was a victim. Despite enduring through the year of plague, it had increasingly found starting to creak under the strain of war. In 406 BC for example, 
the Athenian navy had rallied, defeating the Spartans at the Battle of Arginusae. The failure of the commanders to capitalise on this victory however (through no fault of their own, merely bad weather), 
led to a trial in Athens at which six leading naval commanders were executed. This would severely undermine the capacity of the Athenian forces in future.''';
