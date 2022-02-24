import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/utils/shared_preferances_managment.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/clickable_widget.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/features/map/presentation/pages/map_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../models/chapter_tree.dart';
import '../models/leaf_detail_model.dart';
import '../widgets/chapter_navigation_tree.dart';
import '../widgets/navigation_tree.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final height = window.physicalSize.height / window.devicePixelRatio;
  final width = window.physicalSize.width / window.devicePixelRatio;
  GlobalKey chaptersPartWidgetKey = GlobalKey();

  List<LeafDetails> navigationTreeLeafs = [];
  List<Widget> navigationTreeWidget = [];

  List<ChapterDetails> chapterNavigation = [];
  List<Widget> chapterNavigationWidgets = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    AudioPlayerUtil().playMenuOntapSound();
    chapterNavigation = [
      ChapterDetails(
          vertex: Vertex(
            index: 0,
            currentVertex: ChapterDetails.currentVertex,
            path: '',
            adjacentEdges: [1],
            visited: ChapterDetails.visitedVertexes.contains(0),
          ),
          onTap: () {
            // print('0');
          },
          numberOfChapter: 'chapter 1 '),
      ChapterDetails(
          vertex: Vertex(
            index: 1,
            adjacentEdges: [2],
            currentVertex: ChapterDetails.currentVertex,
            path: '',
            visited: ChapterDetails.visitedVertexes.contains(1),
          ),
          onTap: () {
            // print('1');
          },
          numberOfChapter: 'chapter 2 '),
      ChapterDetails(
          vertex: Vertex(
            index: 2,
            adjacentEdges: [3],
            currentVertex: ChapterDetails.currentVertex,
            path: '',
            visited: ChapterDetails.visitedVertexes.contains(2),
          ),
          onTap: () {
            // print('2');
          },
          numberOfChapter: 'chapter 3 '),
      ChapterDetails(
          vertex: Vertex(
            index: 3,
            adjacentEdges: [4],
            currentVertex: ChapterDetails.currentVertex,
            path: '',
            visited: ChapterDetails.visitedVertexes.contains(3),
          ),
          onTap: () {
            // print('3');
          },
          numberOfChapter: 'chapter 4 '),
      ChapterDetails(
        vertex: Vertex(
          index: 4,
          currentVertex: ChapterDetails.currentVertex,
          path: '',
          visited: ChapterDetails.visitedVertexes.contains(4),
        ),
        onTap: () {
          // print('4');
        },
        numberOfChapter: 'chapter 5 ',
        end: const Offset(0, 0),
        start: const Offset(0, 0),
      ),
    ];

    navigationTreeLeafs = [
      LeafDetails(
        Vertex(
            index: 0,
            visited: LeafDetails.visitedVertexes.contains(0),
            path: LeandingPageRoute.name,
            currentVertex: LeafDetails.currentVertex,
            adjacentEdges: [1]),
        onTap: () {
          LeafDetails.currentVertex = 0;

          context.router
              .replace(LeandingPageRoute(navigateFromNavigatorPage: true));
        },
        pointOffset: const Offset(338, 3),
        lineStartOffset: const Offset(0, 0),
        lineEndOffset: const Offset(0, 0),
        alignment: Alignment.centerLeft,
        title: 'home',
      ),
      LeafDetails(
        Vertex(
            index: 1,
            visited: LeafDetails.visitedVertexes.contains(1),
            path: GlossaryPageRoute.name,
            currentVertex: LeafDetails.currentVertex,
            adjacentEdges: [2]),
        onTap: () {
          LeafDetails.currentVertex = 1;
          LeafDetails.visitedVertexes.add(1);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const GlossaryPageRoute());
        },
        pointOffset: const Offset(340, 55),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(2, -38),
        alignment: Alignment.centerLeft,
        title: 'glossary',
      ),
      LeafDetails(
        Vertex(
          index: 2,
          visited: LeafDetails.visitedVertexes.contains(2),
          path: ParalaxHistoryPageRoute.name,
          currentVertex: LeafDetails.currentVertex,
          adjacentEdges: [4, 9, 8],
        ),
        onTap: () {
          SharedPreferences _sharedPrefs = SharedPreferancesManagment().prefs;
          _sharedPrefs.setBool("showVideo", false);
          LeafDetails.currentVertex = 2;
          LeafDetails.visitedVertexes.add(2);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(ParalaxHistoryPageRoute());
        },
        pointOffset: const Offset(325, 105),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(20, -40),
        alignment: Alignment.centerLeft,
        title: 'to do no harm',
      ),
      LeafDetails(
        Vertex(
          index: 2,
          visited: LeafDetails.visitedVertexes.contains(2),
          path: MapPageRoute.name,
          currentVertex: LeafDetails.currentVertex,
          adjacentEdges: [4, 9, 8],
        ),
        onTap: () {
          LeafDetails.currentVertex = 2;
          LeafDetails.visitedVertexes.add(2);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router
              .replace(ParalaxHistoryPageRoute(mustScrollToMiddle: true));
        },
        pointOffset: const Offset(330, 157),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(0, -42),
        alignment: Alignment.centerLeft,
        title: 'athens, 500 bce',
      ),

      LeafDetails(
        Vertex(
            index: 4,
            visited: LeafDetails.visitedVertexes.contains(4),
            path: MapPageRoute.name,
            adjacentEdges: [5],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 4;
          LeafDetails.visitedVertexes.add(4);
          NavigationSharedPreferences.upDateShatedPreferences();
          MapPage.mapPageRestarted = false;
          context.router.replace(const MapPageRoute());
        },
        pointOffset: const Offset(520, 123),
        lineStartOffset: const Offset(0, 6),
        lineEndOffset: const Offset(-180, 40),
        alignment: Alignment.topCenter,
        title: 'timeline of main events        ',
      ),
      LeafDetails(
        Vertex(
            index: 2,
            visited: LeafDetails.visitedVertexes.contains(2),
            path: ParalaxHistoryPageRoute.name,
            adjacentEdges: [4, 9, 8],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 2;
          LeafDetails.visitedVertexes.add(2);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router
              .replace(ParalaxHistoryPageRoute(mustScrollToEnd: true));
        },
        alignment: Alignment.centerLeft,
        pointOffset: const Offset(325, 209),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(10, -43),
        title: 'to do no harm  ',
      ),
      LeafDetails(
        Vertex(
            index: 5,
            visited: LeafDetails.visitedVertexes.contains(5),
            path: CharacrterPageRoute.name,
            currentVertex: LeafDetails.currentVertex),
        alignment: Alignment.bottomCenter,
        onTap: () {
          LeafDetails.currentVertex = 5;
          LeafDetails.visitedVertexes.add(5);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const CharacrterPageRoute());
        },
        pointOffset: const Offset(650, 160),
        lineStartOffset: const Offset(0, 5),
        lineEndOffset: const Offset(-120, -33),
        title: 'key people of the age',
      ),

      LeafDetails(
        Vertex(
          index: 3,
          visited: LeafDetails.visitedVertexes.contains(3),
          path: DocumentPageRoute.name,
          currentVertex: LeafDetails.currentVertex,
        ),
        onTap: () {
          LeafDetails.currentVertex = 3;
          LeafDetails.visitedVertexes.add(3);

          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const DocumentPageRoute());
        },
        pointOffset: const Offset(73, 270),
        lineStartOffset: const Offset(10, 5),
        lineEndOffset: const Offset(162, 15),
        alignment: Alignment.topCenter,
        title: 'source analysis',
      ),
      LeafDetails(
        Vertex(
            index: 8,
            visited: LeafDetails.visitedVertexes.contains(8),
            path: PanaromaRightPageRoute.name,
            adjacentEdges: [3],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 8;
          LeafDetails.visitedVertexes.add(8);

          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const PanaromaLeftPageRoute());
        },
        pointOffset: const Offset(235, 280),
        lineStartOffset: const Offset(8, 2),
        lineEndOffset: const Offset(90, -65),
        alignment: Alignment.bottomCenter,
        title: 'medical tools and knowledge',
      ),

      LeafDetails(
        Vertex(
            index: 9,
            visited: LeafDetails.visitedVertexes.contains(9),
            path: PanaromaLeftPageRoute.name,
            adjacentEdges: [10],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 9;
          LeafDetails.visitedVertexes.add(9);

          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const PanaromaRightPageRoute());
        },
        pointOffset: const Offset(420, 270),
        lineStartOffset: const Offset(0, 5),
        lineEndOffset: const Offset(-85, -52),
        alignment: Alignment.centerRight,
        title: 'plague and political \ninstability',
      ),

      LeafDetails(
        Vertex(
            index: 10,
            visited: LeafDetails.visitedVertexes.contains(10),
            path: PathogenProfilePageBottomRoute.name,
            adjacentEdges: [11, 14],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          print("NAVIGATION FROM PATHOGEN");
          LeafDetails.currentVertex = 10;
          LeafDetails.visitedVertexes.add(10);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.push(PathogenProfilePageBottomRoute());
        },
        pointOffset: const Offset(425, 375),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(0, -95),
        alignment: Alignment.centerLeft,
        title: 'pathogen profile     ',
      ),
      LeafDetails(
        Vertex(
            index: 11,
            visited: LeafDetails.visitedVertexes.contains(11),
            path: VirusLocationPageRoute.name,
            adjacentEdges: [12],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 11;
          LeafDetails.visitedVertexes.add(11);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const VirusLocationPageRoute());
        },
        pointOffset: const Offset(540, 397),
        lineStartOffset: const Offset(0, 5),
        lineEndOffset: const Offset(-105, -15),
        alignment: Alignment.bottomCenter,
        title: 'where did it come from?           ',
      ),
      LeafDetails(
        Vertex(
            index: 12,
            visited: LeafDetails.visitedVertexes.contains(12),
            path: BodyInfoPageRoute.name,
            adjacentEdges: [13],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 12;
          LeafDetails.visitedVertexes.add(12);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const BodyInfoPageRoute());
        },
        pointOffset: const Offset(660, 380),
        lineStartOffset: const Offset(1, 6),
        lineEndOffset: const Offset(-110, 20),
        alignment: Alignment.topCenter,
        title: 'what did it do?   ',
      ),
      LeafDetails(
        Vertex(
            index: 13,
            visited: LeafDetails.visitedVertexes.contains(13),
            path: VirusesInfoPageRoute.name,
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 13;
          LeafDetails.visitedVertexes.add(13);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const VirusesInfoPageRoute());
        },
        pointOffset: const Offset(765, 395),
        lineStartOffset: const Offset(2, 8),
        lineEndOffset: const Offset(-95, -9),
        alignment: Alignment.bottomCenter,
        title: 'what was it?',
      ),
      // //TODO look into this one
      LeafDetails(
        Vertex(
            index: 14,
            visited: LeafDetails.visitedVertexes.contains(14),
            path: PracticeMedicineRoute.name,
            adjacentEdges: [15],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 14;
          LeafDetails.visitedVertexes.add(14);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.push(PathogenProfilePageBottomRoute(
              needJumpToPracticeMedicinePart: true));
        },
        pointOffset: const Offset(350, 430),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(75, -48),
        alignment: Alignment.centerLeft,
        title: 'to do no harm',
      ),
      LeafDetails(
        Vertex(
            index: 15,
            visited: LeafDetails.visitedVertexes.contains(15),
            path: DeadOfSocratesPageRoute.name,
            adjacentEdges: [16, 17],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 15;
          LeafDetails.visitedVertexes.add(15);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(DeadOfSocratesPageRoute(
            fromKeepGoing: false,
          ));
        },
        pointOffset: const Offset(340, 500),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(13, -60),
        alignment: Alignment.centerLeft,
        title: 'death of socrates     ',
      ),
      LeafDetails(
        Vertex(
            index: 16,
            visited: LeafDetails.visitedVertexes.contains(16),
            path: EndOfWarPageRoute.name,
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 16;
          LeafDetails.visitedVertexes.add(16);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const EndOfWarPageRoute());
        },
        pointOffset: const Offset(390, 505),
        lineStartOffset: const Offset(0, 5),
        lineEndOffset: const Offset(-40, 0),
        alignment: Alignment.centerRight,
        title: 'end of war',
      ),
      LeafDetails(
        Vertex(
            index: 17,
            visited: LeafDetails.visitedVertexes.contains(17),
            path: QuizPageRoute.name,
            adjacentEdges: [18],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 17;
          LeafDetails.visitedVertexes.add(17);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const QuizPageRoute());
        },
        pointOffset: const Offset(345, 560),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(2, -50),
        alignment: Alignment.centerLeft,
        title: 'assessment',
      ),
      LeafDetails(
        Vertex(
            index: 18,
            visited: LeafDetails.visitedVertexes.contains(18),
            path: IrlNikosPageRoute.name,
            adjacentEdges: [23, 19],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 18;
          LeafDetails.visitedVertexes.add(18);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const IrlNikosPageRoute());
        },
        pointOffset: const Offset(342, 620),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(8, -49),
        alignment: Alignment.centerRight,
        title: '#irl nikos',
      ),
      LeafDetails(
        Vertex(
            index: 19,
            visited: LeafDetails.visitedVertexes.contains(19),
            path: IrlNikosPageRoute.name,
            adjacentEdges: [20],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 19;
          LeafDetails.visitedVertexes.add(19);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const IrlNikosPageRoute());
        },
        pointOffset: const Offset(255, 640),
        lineStartOffset: const Offset(10, 5),
        lineEndOffset: const Offset(92, -12),
        alignment: Alignment.bottomCenter,
        title: 'giana',
      ),
      LeafDetails(
        Vertex(
            index: 20,
            visited: LeafDetails.visitedVertexes.contains(20),
            path: IrlNikosPageRoute.name,
            adjacentEdges: [21],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 20;
          LeafDetails.visitedVertexes.add(20);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const IrlNikosPageRoute());
        },
        pointOffset: const Offset(190, 630),
        lineStartOffset: const Offset(10, 5),
        lineEndOffset: const Offset(65, 15),
        alignment: Alignment.topCenter,
        title: 'Xoquauhtli',
      ),
      LeafDetails(
        Vertex(
            index: 21,
            visited: LeafDetails.visitedVertexes.contains(21),
            path: IrlNikosPageRoute.name,
            adjacentEdges: [22],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 21;
          LeafDetails.visitedVertexes.add(21);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const IrlNikosPageRoute());
        },
        pointOffset: const Offset(105, 640),
        lineStartOffset: const Offset(10, 5),
        lineEndOffset: const Offset(85, -5),
        alignment: Alignment.bottomCenter,
        title: 'achraj',
      ),
      LeafDetails(
        Vertex(
            index: 22,
            visited: LeafDetails.visitedVertexes.contains(22),
            path: IrlNikosPageRoute.name,
            adjacentEdges: [23],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 22;
          LeafDetails.visitedVertexes.add(22);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const IrlNikosPageRoute());
        },
        pointOffset: const Offset(40, 640),
        lineStartOffset: const Offset(10, 5),
        lineEndOffset: const Offset(65, 5),
        alignment: Alignment.topCenter,
        title: 'brian',
      ),
      LeafDetails(
        Vertex(
            index: 23,
            visited: LeafDetails.visitedVertexes.contains(23),
            path: AboutBookPageRoute.name,
            adjacentEdges: [24],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 23;
          LeafDetails.visitedVertexes.add(23);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const AboutBookPageRoute());
        },
        pointOffset: const Offset(345, 720),
        lineStartOffset: const Offset(5, 0),
        lineEndOffset: const Offset(4, -90),
        alignment: Alignment.centerLeft,
        title: 'about the book',
      ),
      LeafDetails(
        Vertex(
            index: 24,
            visited: LeafDetails.visitedVertexes.contains(24),
            path: CreditsPageRoute.name,
            adjacentEdges: [25],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 24;
          LeafDetails.visitedVertexes.add(24);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const CreditsPageRoute());
        },
        pointOffset: const Offset(460, 745),
        lineStartOffset: const Offset(0, 5),
        lineEndOffset: const Offset(-105, -18),
        alignment: Alignment.bottomCenter,
        title: 'credits',
      ),
      // //TODO look into this
      LeafDetails(
        Vertex(
            index: 25,
            visited: LeafDetails.visitedVertexes.contains(25),
            path: SourcePageRoute.name,
            adjacentEdges: [26],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 25;
          LeafDetails.visitedVertexes.add(25);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const SourcePageRoute());
        },
        pointOffset: const Offset(550, 730),
        lineStartOffset: const Offset(0, 5),
        lineEndOffset: const Offset(-80, 20),
        alignment: Alignment.topCenter,
        title: 'sources',
      ),
      LeafDetails(
        Vertex(
            index: 26,
            visited: LeafDetails.visitedVertexes.contains(26),
            path: CopyrightPageRoute.name,
            adjacentEdges: [27],
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 26;
          LeafDetails.visitedVertexes.add(26);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const FurtherReadingPageRoute());
        },
        pointOffset: const Offset(655, 745),
        lineStartOffset: const Offset(0, 5),
        lineEndOffset: const Offset(-95, -10),
        alignment: Alignment.bottomCenter,
        title: 'further reading',
      ),
      LeafDetails(
        Vertex(
            index: 27,
            visited: LeafDetails.visitedVertexes.contains(27),
            path: FurtherReadingPageRoute.name,
            currentVertex: LeafDetails.currentVertex),
        onTap: () {
          LeafDetails.currentVertex = 27;
          LeafDetails.visitedVertexes.add(27);
          NavigationSharedPreferences.upDateShatedPreferences();
          context.router.replace(const CopyrightPageRoute());
        },
        pointOffset: const Offset(745, 730),
        lineStartOffset: const Offset(0, 5),
        lineEndOffset: const Offset(-80, 20),
        alignment: Alignment.topCenter,
        title: 'copyright',
      ),
    ];

    for (int index = 0; index < navigationTreeLeafs.length; index++) {
      navigationTreeWidget.add(
        NavigationTree(
          details: navigationTreeLeafs[index],
          onTap: navigationTreeLeafs[index].onTap,
          isAbleToNavigate: isAbleToNavigate(
            vertex: navigationTreeLeafs[index].vertex,
          ),
        ),
      );
    }

    for (int index = 0; index < chapterNavigation.length; index++) {
      chapterNavigationWidgets.add(
        ChapterNavigationTree(
          details: chapterNavigation[index],
          isAbleToNavigate: isAbleToNavigateCapter(),
          onTap: chapterNavigation[index].onTap,
        ),
      );
    }
  }

  bool isAbleToNavigateCapter() {
    return false;
  }

  bool isAbleToNavigate({required Vertex vertex}) {
    return navigationTreeLeafs[LeafDetails.currentVertex]
        .vertex
        .adjacentEdges
        .contains(vertex.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.gradient), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _menu,
              const SizedBox(height: 76),
              Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: SizedBox(
                    //  color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // scrollDirection: Axis.horizontal,
                      // physics: const ClampingScrollPhysics(),
                      children: [
                        Container(
                          width: HW.getWidth(66, context),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: chapterNavigationWidgets,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Stack(
                              children: [
                                // Image.asset("assets/navTree.png"),
                                Container(
                                  width: 819,
                                  height: 781,
                                  child: SizedBox(
                                    child:
                                        Stack(children: navigationTreeWidget),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isSoundOn = false;
  Widget get _menu => Container(
        height: HW.getHeight(43, context),
        margin: EdgeInsets.only(
          top: HW.getHeight(48, context),
          left: HW.getWidth(66, context),
          right: HW.getWidth(66, context),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Clickable(
              onPressed: () {
                setState(() {
                  isSoundOn = !isSoundOn;
                });
              },
              child: Container(
                height: HW.getHeight(40, context),
                width: HW.getWidth(40, context),
                child: Image.asset(
                  isSoundOn
                      ? AssetsPath.iconVolumeOn
                      : AssetsPath.iconVolumeOff,
                  color: Colors.black,
                ),
              ),
            ),
            AutoSizeText(
              "Table of contents".toUpperCase(),
              maxLines: 1,
              style: Theme.of(context).textTheme.headline2,
            ),
            IconButton(
                focusColor: AppColors.transpatent,
                splashColor: AppColors.transpatent,
                highlightColor: AppColors.transpatent,
                hoverColor: AppColors.transpatent,
                icon: Icon(
                  Icons.close,
                  size: HW.getHeight(40, context),
                ),
                onPressed: () {
                  print("on click");
                  AudioPlayerUtil().playMenuCloseSound();

                  context.router.pop();
                }),
          ],
        ),
      );
}
