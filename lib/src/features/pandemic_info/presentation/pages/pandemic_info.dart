import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/theme.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/transform_page.dart';
import 'package:history_of_adventures/src/core/widgets/background_widget.dart';
import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';
import 'package:history_of_adventures/src/core/widgets/hero_photo_widget.dart';

class PandemicInfoPage extends StatefulWidget {
  const PandemicInfoPage({Key? key}) : super(key: key);

  @override
  _PandemicInfoPageState createState() => _PandemicInfoPageState();
}

class _PandemicInfoPageState extends State<PandemicInfoPage> {
  String _selectedItem = "Pericles";
  List<CharacterModel> listCharacters = [
    const CharacterModel(
      photo: AssetsPath.periclesImage,
      name: "Pericles",
    ),
    const CharacterModel(
      photo: AssetsPath.thucididesImage,
      name: "thucidides",
    ),
    const CharacterModel(
      photo: AssetsPath.socratesImage,
      name: "socrates and plato",
    ),
    const CharacterModel(
      photo: AssetsPath.aristophanesImage,
      name: "Aristophanes and Sophocles",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          Align(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 80,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(
                            right: 50,
                            top: size.height * 0.1,
                            bottom: size.height * 0.1),
                        child: const TransformPage()),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 50,
                          top: size.height * 0.1,
                          bottom: size.height * 0.1),
                      decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.5)),
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
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: AppColors.grey, width: 1.2),
                                      bottom: BorderSide(
                                          color: AppColors.grey, width: 1.2))),
                              child: Scrollbar(
                                isAlwaysShown: true,
                                child: ListView(shrinkWrap: true, children: [
                                  Container(
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
                          ),
                          SizedBox(
                            height: 30,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: listCharacters
                                        .map((data) => charactersNameListWidget(
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
        ],
      ),
    );
  }

  void chandeState(String? selctedItem, String? image) {
    setState(() {
      _selectedItem = selctedItem!;
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
