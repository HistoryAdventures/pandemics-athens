import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_bottom.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../model/glossary_model.dart';

class GlossaryPage extends StatefulWidget {
  const GlossaryPage({Key? key}) : super(key: key);

  @override
  _GlossaryPageState createState() => _GlossaryPageState();
}

class _GlossaryPageState extends State<GlossaryPage> {
  late String _selectedtItem;
  late String _selectedtText;
  late List<GlossaryModel> category;
  late AppLocalizations locales;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final globalKey = GlobalKey();
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  int? hoveredItemIndex;
  @override
  void initState() {
    NavigationSharedPreferences.getNavigationListFromSF();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    _selectedtItem = 'DMDemocracy';
    _selectedtText = locales.glossaryDemocracytext;
    category = [
      GlossaryModel(
        title: "DMDemocracy",
        text: locales.glossaryDemocracytext,
        index: 0,
      ),
      GlossaryModel(
        title: "HMHumours",
        text: locales.glossaryHumorsText,
        index: 1,
      ),
      GlossaryModel(
        title: "OSOstracism",
        text: locales.glossaryOstracismText,
        index: 2,
      ),
      GlossaryModel(
        title: "PHPhilosophy",
        text: locales.glossaryPhilosophyText,
        index: 3,
      ),
      GlossaryModel(
        title: "TYTyphus",
        text: locales.glossaryTyphusText,
        index: 4,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 5,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 6,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 7,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 8,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 9,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 10,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 11,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 12,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 13,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 14,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 15,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 16,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 17,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 18,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 19,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 20,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 21,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 22,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 23,
      ),
      GlossaryModel(
        title: "",
        text: "",
        index: 24,
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const NavigationPage(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsPath.glossaryBk), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              // const BackgroundWidget(),
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: constraints.maxHeight * 0.09,
                    margin: EdgeInsets.only(
                      top: constraints.maxHeight * 0.15,
                    ),
                    child: AutoSizeText(
                      locales.glossary.toUpperCase(),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )),
              Align(
                child: Container(
                  height: HW.getHeight(500, context),
                  width: HW.getWidth(1000, context),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: Shadows.universal,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: HW.getWidth(48, context),
                            vertical: HW.getHeight(48, context)),
                        height: HW.getHeight(500, context),
                        width: HW.getWidth(500, context),
                        child: AnimatedSwitcher(
                          duration: Times.medium,
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Column(
                            key: ValueKey(_selectedtItem),
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _selectedtItem.substring(2),
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .overline
                                    ?.copyWith(fontSize: 24),
                              ),
                              Expanded(
                                  child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 18.0, top: 16),
                                  child: Text(
                                    _selectedtText,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: HW.getHeight(500, context),
                          width: HW.getWidth(500, context),
                          child: Wrap(
                            children: category
                                .map(
                                  (item) => MouseRegion(
                                    onHover: (_) {
                                      hoveredItemIndex = item.index;
                                      setState(() {});
                                    },
                                    onExit: (_) {
                                      hoveredItemIndex = null;
                                      setState(() {});
                                    },
                                    child: InkWell(
                                      child: SizedBox(
                                        height: HW.getHeight(100, context),
                                        width: HW.getWidth(100, context),
                                        child: gridViewCard(
                                            isHovered:
                                                hoveredItemIndex == item.index,
                                            name: item.title,
                                            text: item.text,
                                            category: item.title),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          )),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: ArrowTextBottomWidget(
                  onPressed: () {
                    LeafDetails.visitedVertexes.add(2);
                    LeafDetails.currentVertex = 2;
                    NavigationSharedPreferences.upDateShatedPreferences();
                    context.router.push(const ParalaxHistoryPageRoute());
                  },
                  textChapter: locales.chapter1,
                  textChapterName: locales.todoNoHarm,
                ),
              ),
              SoundAndMenuWidget(
                widget: IconButtonWidget(
                    color: AppColors.black100,
                    iconSize: HW.getHeight(40, context),
                    icon: const Icon(Icons.arrow_upward_sharp),
                    onPressed: () {
                      LeafDetails.currentVertex = 0;
                      NavigationSharedPreferences.upDateShatedPreferences();
                      // if (kIsWeb) {
                      //   html.window.history.back();
                      //   context.router.pop();
                      // } else {
                      //   context.router.pop();
                      // }
                      LeafDetails.currentVertex = 0;

                      context.router.replace(
                          LeandingPageRoute(navigateFromNavigatorPage: true));
                    }),
                icons: isSoundOn
                    ? AssetsPath.iconVolumeOn
                    : AssetsPath.iconVolumeOff,
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
                onTapMenu: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  void selectedItem({required String cardTitele, required String text}) {
    setState(() {
      _selectedtItem = cardTitele;
      _selectedtText = text;
    });
  }

  Widget gridViewCard({
    required String name,
    required String category,
    required String text,
    bool isHovered = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: category == ""
          ? null
          : () {
              selectedItem(cardTitele: name, text: text);
            },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.3),
            gradient: _selectedtItem == name || isHovered
                ? AppColors.linearGradient1
                : AppColors.linearGradient2,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AutoSizeText(
                  category == "" ? "" : category.substring(0, 2),
                  maxLines: 1,
                  minFontSize: 5,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: AppColors.white)),
            ),
            Flexible(
              child: AutoSizeText(
                  category == "" ? "" : category.substring(2).toUpperCase(),
                  maxLines: category.split(" ").length == 1 ? 1 : 2,
                  minFontSize: 5,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: AppColors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
