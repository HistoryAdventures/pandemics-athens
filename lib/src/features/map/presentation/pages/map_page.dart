import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/theme.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_left.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_right.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  var _selectedItem = 400;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetsPath.mapImage),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                top: size.height * 0.09,
                right: 0,
                bottom: 150,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  height: constraints.maxHeight * 0.6,
                  width: constraints.maxWidth * 0.6,
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: constraints.maxHeight,
                        child: Image.asset(
                          'assets/image_back/image_71.png',
                          fit: BoxFit.cover,
                        ),
                      )),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: AutoSizeText(
                                          "plague & political Instability"
                                              .toUpperCase(),
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                      ),
                                      Flexible(
                                        child: AutoSizeText(
                                            "Chapter 1 / Plague & Political Instability",
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: ListView(shrinkWrap: true, children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                '415, Battle of Thermopylae\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
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
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                decoration:
                    BoxDecoration(color: AppColors.grey.withOpacity(0.9)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ArrowLeftTextWidget(
                          textSubTitle: 'chapter 1',
                          textTitle: 'nikos story',
                          onTap: () {
                            _scrollController.animateTo(0,
                                duration: const Duration(milliseconds: 50),
                                curve: Curves.easeIn);
                          }),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        child: Scrollbar(
                          isAlwaysShown: true,
                          controller: _scrollController,
                          child: ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 50,
                              itemBuilder: (context, index) {
                                return yearsWidget(
                                    index: index, selected: 400 + index);
                              }),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ArrowRightTextWidget(
                          textSubTitle: 'key people',
                          textTitle: 'Athens, 5th century BC',
                          onTap: () {
                            _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 50),
                                curve: Curves.easeIn);
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  void chandeState(int? selctedItem) {
    setState(() {
      _selectedItem = selctedItem!;
    });
  }

  Widget yearsWidget({int? index, int? selected}) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          left: 30,
        ),
        child: Clickable(
            onPressed: () {
              chandeState(selected);
            },
            child: Text(
              "${400 + index!}",
              style: _selectedItem == selected
                  ? const TextStyle(
                      color: AppColors.orange,
                      fontSize: 36,
                    )
                  : const TextStyle(color: AppColors.blackB, fontSize: 15),
            )));
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
