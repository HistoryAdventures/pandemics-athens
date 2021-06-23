import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/arrow_text_left.dart';
import '../../../../core/widgets/arrow_text_right.dart';
import '../../../../core/widgets/widgets.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _selectedItem = 400;
  final _scrollController = ScrollController();
  late AppLocalizations locals;
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

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
                                          locals.chapter1Name.toUpperCase(),
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                      ),
                                      Flexible(
                                        child: AutoSizeText(locals.chapter1Name,
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
                                  child: Scrollbar(
                                    child:
                                        ListView(shrinkWrap: true, children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 30),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: locals.battleOfThermopylae,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3),
                                          TextSpan(
                                            text: locals.bodyText,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ])),
                                      )
                                    ]),
                                  ),
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
                          textSubTitle: locals.chapter1,
                          textTitle: locals.nikosStory,
                          onTap: () {
                            context.router.pop();
                          }),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        // color: Colors.blue,
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
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
                    Expanded(
                      flex: 2,
                      child: ArrowRightTextWidget(
                          textSubTitle: locals.keyPeople,
                          textTitle: locals.athens5thCentury,
                          onTap: () {
                            context.router.push(const CharacrterPageRoute());
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
        //padding: const EdgeInsets.only(),
        alignment: Alignment.center,
        // color: Colors.red,
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
