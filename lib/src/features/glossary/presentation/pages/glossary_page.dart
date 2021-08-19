import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import "package:universal_html/html.dart" as html;

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
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
  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    _selectedtItem = 'DMDemocracy';
    _selectedtText = locales.glossaryDemocracytext;
    category = [
      GlossaryModel(title: "DMDemocracy", text: locales.glossaryDemocracytext),
      GlossaryModel(title: "HMHumours", text: locales.glossaryHumorsText),
      GlossaryModel(title: "OSOstracism", text: locales.glossaryOstracismText),
      GlossaryModel(
          title: "PHPhilosophy", text: locales.glossaryPhilosophyText),
      GlossaryModel(title: "TYTyphus", text: locales.glossaryTyphusText),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
      GlossaryModel(title: "", text: ""),
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
                  margin: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.1),
                  width: constraints.maxWidth * 0.75,
                  height: constraints.maxHeight * 0.5,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          color: AppColors.grey,
                          blurRadius: 5),
                      BoxShadow(
                          offset: Offset(1, 0),
                          color: AppColors.grey,
                          blurRadius: 5),
                      BoxShadow(
                          offset: Offset(1, -1),
                          color: AppColors.grey,
                          blurRadius: 5),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.03),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                    child: AutoSizeText(
                                  _selectedtItem.substring(2),
                                  maxLines: 1,
                                  minFontSize: 5,
                                  style: Theme.of(context).textTheme.headline5,
                                )),
                                Flexible(
                                    child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: Text(
                                      _selectedtText,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(fontSize: 20),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: constraints.maxHeight * 0.5,
                          width: constraints.maxHeight * 0.5,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent:
                                        constraints.maxHeight * 0.5 / 5,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1),
                            itemCount: 25,
                            itemBuilder: (context, index) {
                              return gridViewCard(
                                  name: category[index].title,
                                  text: category[index].text,
                                  category: category[index].title);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SoundAndMenuWidget(
                widget: Clickable(
                  onPressed: () {
                    LeafDetails.currentVertex = 0;
                    if (kIsWeb) {
                      html.window.history.back();
                      context.router.pop();
                    } else {
                      context.router.pop();
                    }
                  },
                  child: const Icon(
                    Icons.arrow_upward_sharp,
                    color: Colors.black,
                  ),
                ),
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
                onTapMenu: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Clickable(
                      onPressed: () {
                        LeafDetails.visitedVertexes.add(2);
                        LeafDetails.currentVertex = 2;
                        context.router.push(const ParalaxHistoryPageRoute());
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              locales.chapter1.toUpperCase(),
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                          Flexible(
                            child: AutoSizeText(
                              locales.todoNoHarm,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                          Flexible(
                            child: Icon(
                              Icons.south,
                              size: constraints.maxHeight * 0.04,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
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

  Widget gridViewCard(
      {required String name, required String category, required String text}) {
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
            gradient: _selectedtItem == name
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
