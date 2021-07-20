import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/arrow_text_left.dart';
import '../../../../core/widgets/arrow_text_right.dart';
import '../../../../core/widgets/widgets.dart';
import '../models/year_info_model.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late String _selectedItem;
  late String _selectedImage;
  late String _selectedTitle;
  late String _selectedBody;
  final _scrollController = ScrollController();
  late AppLocalizations locals;
  late List<MapInfoModel> mapInfoList;
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    mapInfoList = [
      MapInfoModel(
          imageDescription: locals.y495imageText,
          image: AssetsPath.mapImage495,
          text: locals.y495bodyText,
          title: locals.y495,
          year: locals.y495),
      MapInfoModel(
          imageDescription: locals.y490imageText,
          image: AssetsPath.mapImage490,
          text: locals.y490bodyText,
          title: locals.y490,
          year: locals.y490),
      MapInfoModel(
          imageDescription: locals.y480imageText,
          image: AssetsPath.mapImage480,
          text: locals.y480bodyText,
          title: locals.y480bodyTextTitle,
          year: locals.y480),
      MapInfoModel(
          imageDescription: locals.y479imageText,
          image: AssetsPath.mapImage479,
          text: locals.y479bodyText,
          title: locals.y479bodyTextTitle,
          year: locals.y479),
      MapInfoModel(
          imageDescription: locals.y477imageText,
          image: AssetsPath.mapImage477,
          text: locals.y477bodyText,
          title: locals.y477bodyTextTitle,
          year: locals.y477),
      MapInfoModel(
          imageDescription: locals.y471imageText,
          image: AssetsPath.mapImage471,
          text: locals.y471bodyText,
          title: locals.y471bodyTextTitle,
          year: locals.y471),
      MapInfoModel(
          imageDescription: locals.y469imageText,
          image: AssetsPath.mapImage469,
          text: locals.y469bodyText,
          title: locals.y469bodyTextTitle,
          year: locals.y469),
      MapInfoModel(
          imageDescription: locals.y462imageText,
          image: AssetsPath.mapImage462,
          text: locals.y462bodyText,
          title: locals.y462bodyTextTitle,
          year: locals.y462),
      MapInfoModel(
          imageDescription: locals.y458imageText,
          image: AssetsPath.mapImage458,
          text: locals.y458bodyText,
          title: locals.y458bodyTextTitle,
          year: locals.y458),
      MapInfoModel(
          imageDescription: locals.y457imageText,
          image: AssetsPath.mapImage457,
          text: locals.y457bodyText,
          title: locals.y457bodyTextTitle,
          year: locals.y457),
      MapInfoModel(
          imageDescription: locals.y454imageText,
          image: AssetsPath.mapImage454,
          text: locals.y454bodyText,
          title: locals.y454bodyTextTitle,
          year: locals.y454),
      MapInfoModel(
          imageDescription: locals.y451imageText,
          image: AssetsPath.mapImage451,
          text: locals.y451bodyText,
          title: locals.y451bodyTextTitle,
          year: locals.y451),
      MapInfoModel(
          imageDescription: locals.y450imageText,
          image: AssetsPath.mapImage450,
          text: locals.y450bodyText,
          title: locals.y450bodyTextTitle,
          year: locals.y450),
      MapInfoModel(
          imageDescription: locals.y447_432imageText,
          image: AssetsPath.mapImage447_432,
          text: locals.y447_432bodyText,
          title: locals.y447_432bodyTextTitle,
          year: locals.y447_432),
      MapInfoModel(
          imageDescription: locals.y446imageText,
          image: AssetsPath.mapImage446,
          text: locals.y446bodyText,
          title: locals.y446bodyTextTitle,
          year: locals.y446),
      MapInfoModel(
          imageDescription: locals.y443imageText,
          image: AssetsPath.mapImage443,
          text: locals.y443bodyText,
          title: locals.y443bodyTextTitle,
          year: locals.y443),
      MapInfoModel(
          imageDescription: locals.y441imageText,
          image: AssetsPath.mapImage441,
          text: locals.y441bodyText,
          title: locals.y441bodyTextTitle,
          year: locals.y441),
      MapInfoModel(
          imageDescription: locals.y438imageText,
          image: AssetsPath.mapImage438,
          text: locals.y438bodyText,
          title: locals.y438bodyTextTitle,
          year: locals.y438),
      MapInfoModel(
          imageDescription: locals.y431imageText,
          image: AssetsPath.mapImage431,
          text: locals.y431bodyText,
          title: locals.y431bodyTextTitle,
          year: locals.y431),
      MapInfoModel(
          imageDescription: locals.y430imageText,
          image: AssetsPath.mapImage430,
          text: locals.y430bodyText,
          title: locals.y430bodyTextTitle,
          year: locals.y430),
      MapInfoModel(
          imageDescription: locals.y427imageText,
          image: AssetsPath.mapImage427,
          text: locals.y427bodyText,
          title: locals.y427bodyTextTitle,
          year: locals.y427),
      MapInfoModel(
          imageDescription: locals.y421imageText,
          image: AssetsPath.mapImage421,
          text: locals.y421bodyText,
          title: locals.y421bodyTextTitle,
          year: locals.y421),
      MapInfoModel(
          imageDescription: locals.y416imageText,
          image: AssetsPath.mapImage416,
          text: locals.y416bodyText,
          title: locals.y416bodyTextTitle,
          year: locals.y416),
      MapInfoModel(
          imageDescription: locals.y415imageText,
          image: AssetsPath.mapImage415,
          text: locals.y415bodyText,
          title: locals.y415bodyTextTitle,
          year: locals.y415),
      MapInfoModel(
          imageDescription: locals.y414imageText,
          image: AssetsPath.mapImage414,
          text: locals.y414bodyText,
          title: locals.y414bodyTextTitle,
          year: locals.y414),
      MapInfoModel(
          imageDescription: locals.y413imageText,
          image: AssetsPath.mapImage413,
          text: locals.y413bodyText,
          title: locals.y413bodyTextTitle,
          year: locals.y413),
      MapInfoModel(
          imageDescription: locals.y399imageText,
          image: AssetsPath.mapImage399,
          text: locals.y399bodyText,
          title: locals.y399bodyTextTitle,
          year: locals.y399),
    ];

    _selectedItem = mapInfoList[0].year;
    _selectedTitle = mapInfoList[0].title;
    _selectedImage = mapInfoList[0].image;
    _selectedBody = mapInfoList[0].text;
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
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  margin: EdgeInsets.only(
                      left: 50, top: constraints.maxHeight * 0.15),
                  height: constraints.maxHeight * 0.5,
                  width: constraints.maxWidth * 0.5,
                  color: AppColors.white,
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
                            child: Container(
                              key: ValueKey(_selectedImage),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(_selectedImage),
                                fit: BoxFit.cover,
                              )),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Clickable(
                                  onPressed: () {},
                                  child: Container(
                                    color: Colors.black,
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: AutoSizeText(
                                        locals.chapter1Athens5thCentury,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2),
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                      locals.timelineOfMainEvents.toUpperCase(),
                                      maxLines: 1,
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Scrollbar(
                                child: ListView(shrinkWrap: true, children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 30),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "$_selectedTitle\n",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3),
                                      TextSpan(
                                        text: _selectedBody,
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
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: 80,
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
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        child: ListView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: mapInfoList.length,
                            itemBuilder: (context, index) {
                              return yearsWidget(
                                year: mapInfoList[index].year,
                                image: mapInfoList[index].image,
                                text: mapInfoList[index].text,
                                selected: mapInfoList[index].year,
                                title: mapInfoList[index].title,
                              );
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

  void chandeState(
      String? selctedItem, String? image, String? text, String? title) {
    setState(() {
      _selectedItem = selctedItem!;
      _selectedImage = image!;
      _selectedBody = text!;
      _selectedTitle = title!;
    });
  }

  Widget yearsWidget(
      {String? year,
      String? selected,
      String? image,
      String? text,
      String? title}) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(left: 30),
      child: Clickable(
        onPressed: () {
          chandeState(selected, image, text, title);
        },
        child: AutoSizeText(
          year!,
          textAlign: TextAlign.end,
          style: _selectedItem == selected
              ? const TextStyle(
                  color: AppColors.orange,
                  fontSize: 36,
                )
              : const TextStyle(color: AppColors.blackB, fontSize: 15),
        ),
      ),
    );
  }
}
