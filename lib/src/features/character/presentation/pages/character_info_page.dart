import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/theme.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_left.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_right.dart';

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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetsPath.charactersBackgroundImage),
                        fit: BoxFit.cover)),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    iconSize: 30,
                  ),
                ),
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
                                        "Chapter 1 / Plague & Political Instability"
                                            .toUpperCase(),
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
                                          text: '415, Battle of Thermopylae\n',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        TextSpan(
                                          text: text,
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
                      textSubTitle: 'key people',
                      textTitle: 'Athens, 5th century BC',
                      onTap: () {}),
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

  Widget charactersNameListWidget(
      {String? name, String? selected, String? image}) {
    return Container(
        margin: const EdgeInsets.only(left: 30),
        child: Clickable(
          onPressed: () {
            chandeState(selected, image);
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

const String text = '''
    
In the aftermath of Athens’ defeat and the recovery from the devastation wrought by both war and plague, the political landscape of the city fractured.

At first, democracy was a victim. Despite enduring through the year of plague, it had increasingly found starting to creak under the strain of war. In 406 BC for example, 
the Athenian navy had rallied, defeating the Spartans at the Battle of Arginusae. The failure of the commanders to capitalise on this victory however (through no fault of their own, merely bad weather), 
led to a trial in Athens at which six leading naval commanders were executed. This would severely undermine the capacity of the Athenian forces in future.
In the aftermath of Athens’ defeat and the recovery from the devastation wrought by both war and plague, the political landscape of the city fractured.

At first, democracy was a victim. Despite enduring through the year of plague, it had increasingly found starting to creak under the strain of war. In 406 BC for example, 
the Athenian navy had rallied, defeating the Spartans at the Battle of Arginusae. The failure of the commanders to capitalise on this victory however (through no fault of their own, merely bad weather), 
led to a trial in Athens at which six leading naval commanders were executed. This would severely undermine the capacity of the Athenian forces in future.''';
