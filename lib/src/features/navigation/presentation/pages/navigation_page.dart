import 'dart:ui';
import 'package:history_of_adventures/src/core/utils/shared_preferenses.dart';
import "package:universal_html/html.dart" as html;
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/navigation/presentation/models/chapter_tree.dart';
import 'package:history_of_adventures/src/features/navigation/presentation/widgets/chapter_navigation_tree.dart';

import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../models/leaf_detail_model.dart';
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
  void initState() {
    super.initState();

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
          nameOfChapter: ' to do no harm',
          numberOfChapter: 'chapter1 '),
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
          nameOfChapter: ' forty days',
          numberOfChapter: 'chapter2 '),
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
          nameOfChapter: ' beard of life',
          numberOfChapter: 'chapter3 '),
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
          nameOfChapter: ' red pepper and black pepper',
          numberOfChapter: 'chapter4 '),
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
        nameOfChapter: ' positive',
        numberOfChapter: 'chapter5 ',
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
          // print("object");

          context.router.replace(const LeandingPageRoute());
        },
        pointOffset: const Offset(140, 0),
        lineStartOffset: const Offset(12, 12),
        lineEndOffset: const Offset(20, 50),
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
        onTap: () async {
          LeafDetails.currentVertex = 1;
          LeafDetails.visitedVertexes.add(1);

          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);

          context.router.replace(const GlossaryPageRoute());
        },
        pointOffset: const Offset(155, 50),
        lineStartOffset: const Offset(12, 12),
        lineEndOffset: const Offset(-21, 60),
        alignment: Alignment.centerRight,
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
        pointOffset: const Offset(130, 100),
        onTap: () async {
          LeafDetails.currentVertex = 2;
          LeafDetails.visitedVertexes.add(2);

          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const ParalaxHistoryPageRoute());
        },
        lineStartOffset: const Offset(9, 12),
        lineEndOffset: const Offset(25, 60),
        alignment: Alignment.centerLeft,
        title: 'to do no harm',
      ),
      LeafDetails(
        Vertex(
          index: 3,
          visited: LeafDetails.visitedVertexes.contains(3),
          path: DocumentPageRoute.name,
          currentVertex: LeafDetails.currentVertex,
          adjacentEdges: [],
        ),
        pointOffset: const Offset(40, 190),
        onTap: () async {
          LeafDetails.currentVertex = 3;
          LeafDetails.visitedVertexes.add(3);

          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const DocumentPageRoute());
        },
        lineStartOffset: const Offset(0, 0),
        lineEndOffset: const Offset(0, 0),
        alignment: Alignment.topCenter,
        title: 'source analysis',
      ),
      LeafDetails(
        Vertex(
            index: 4,
            visited: LeafDetails.visitedVertexes.contains(4),
            path: MapPageRoute.name,
            adjacentEdges: [5],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(220, 135),
        onTap: () async {
          LeafDetails.currentVertex = 4;
          LeafDetails.visitedVertexes.add(4);

          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const MapPageRoute());
        },
        lineStartOffset: const Offset(0, 10),
        lineEndOffset: const Offset(-55, 25),
        alignment: Alignment.topCenter,
        title: 'timeline of man events',
      ),
      LeafDetails(
        Vertex(
            index: 5,
            visited: LeafDetails.visitedVertexes.contains(5),
            path: CharacrterPageRoute.name,
            adjacentEdges: [],
            currentVertex: LeafDetails.currentVertex),
        alignment: Alignment.bottomCenter,
        pointOffset: const Offset(278, 155),
        onTap: () async {
          LeafDetails.currentVertex = 5;
          LeafDetails.visitedVertexes.add(5);

          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const CharacrterPageRoute());
        },
        lineStartOffset: const Offset(0, 5),
        lineEndOffset: const Offset(-45, -13),
        title: 'key people of the age',
      ),
      LeafDetails(
        Vertex(
          index: 2,
          visited: LeafDetails.visitedVertexes.contains(2),
          path: MapPageRoute.name,
          currentVertex: LeafDetails.currentVertex,
          adjacentEdges: [4, 9, 8],
        ),
        pointOffset: const Offset(150, 155),
        onTap: () async {
          LeafDetails.currentVertex = 2;
          LeafDetails.visitedVertexes.add(2);

          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const ParalaxHistoryPageRoute());
        },
        lineStartOffset: const Offset(5, 12),
        lineEndOffset: const Offset(-11, 50),
        alignment: Alignment.centerLeft,
        title: 'athens, 5th century bce',
      ),
      LeafDetails(
        Vertex(
            index: 2,
            visited: LeafDetails.visitedVertexes.contains(2),
            path: ParalaxHistoryPageRoute.name,
            adjacentEdges: [9, 8],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(130, 200),
        onTap: () async {
          LeafDetails.currentVertex = 2;
          LeafDetails.visitedVertexes.add(2);

          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const ParalaxHistoryPageRoute());
        },
        lineStartOffset: const Offset(2, 5),
        lineEndOffset: const Offset(-41, 30),
        title: '',
      ),
      LeafDetails(
        Vertex(
            index: 8,
            visited: LeafDetails.visitedVertexes.contains(8),
            path: PanaromaRightPageRoute.name,
            adjacentEdges: [3],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(77, 222),
        onTap: () async {
          LeafDetails.currentVertex = 8;
          LeafDetails.visitedVertexes.add(8);

          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const PanaromaLeftPageRoute());
        },
        lineStartOffset: const Offset(2, 5),
        lineEndOffset: const Offset(-27, -20),
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
        pointOffset: const Offset(175, 220),
        onTap: () async {
          LeafDetails.currentVertex = 9;
          LeafDetails.visitedVertexes.add(9);

          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const PanaromaRightPageRoute());
        },
        lineStartOffset: const Offset(2, 5),
        lineEndOffset: const Offset(-33, -9),
        alignment: Alignment.centerRight,
        title: 'plague and political instability',
      ),
      LeafDetails(
        Vertex(
            index: 10,
            visited: LeafDetails.visitedVertexes.contains(10),
            path: PathogenProfilePageRoute.name,
            adjacentEdges: [11, 14],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(150, 285),
        onTap: () async {
          LeafDetails.currentVertex = 10;
          LeafDetails.visitedVertexes.add(10);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const PathogenProfilePageRoute());
        },
        lineStartOffset: const Offset(8, 1),
        lineEndOffset: const Offset(28, -52),
        alignment: Alignment.centerLeft,
        title: 'pathogen profile',
      ),
      LeafDetails(
        Vertex(
            index: 11,
            visited: LeafDetails.visitedVertexes.contains(11),
            path: VirusLocationPageRoute.name,
            adjacentEdges: [12],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(230, 275),
        onTap: () async {
          LeafDetails.currentVertex = 11;
          LeafDetails.visitedVertexes.add(11);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const VirusLocationPageRoute());
        },
        lineStartOffset: const Offset(2, 8),
        lineEndOffset: const Offset(-68, 17),
        alignment: Alignment.topCenter,
        title: 'where did it come from?',
      ),
      LeafDetails(
        Vertex(
            index: 12,
            visited: LeafDetails.visitedVertexes.contains(12),
            path: BodyInfoPageRoute.name,
            adjacentEdges: [13],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(305, 285),
        onTap: () async {
          LeafDetails.currentVertex = 12;
          LeafDetails.visitedVertexes.add(12);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const BodyInfoPageRoute());
        },
        lineStartOffset: const Offset(2, 8),
        lineEndOffset: const Offset(-60, 0),
        alignment: Alignment.bottomCenter,
        title: 'what did it do?',
      ),
      LeafDetails(
        Vertex(
            index: 13,
            visited: LeafDetails.visitedVertexes.contains(13),
            path: VirusesInfoPageRoute.name,
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(355, 265),
        onTap: () async {
          LeafDetails.currentVertex = 13;
          LeafDetails.visitedVertexes.add(13);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const VirusesInfoPageRoute());
        },
        lineStartOffset: const Offset(2, 8),
        lineEndOffset: const Offset(-36, 30),
        alignment: Alignment.topCenter,
        title: 'what was it?',
      ),
      //TODO look into this one
      LeafDetails(
        Vertex(
            index: 14,
            visited: LeafDetails.visitedVertexes.contains(14),
            path: PracticeMedicineRoute.name,
            adjacentEdges: [15],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(175, 325),
        onTap: () async {
          LeafDetails.currentVertex = 14;
          LeafDetails.visitedVertexes.add(14);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const PracticeMedicineRoute());
        },
        lineStartOffset: const Offset(5, 3),
        lineEndOffset: const Offset(-17, -28),
        alignment: Alignment.centerRight,
        title: 'to do no harm',
      ),
      LeafDetails(
        Vertex(
            index: 15,
            visited: LeafDetails.visitedVertexes.contains(15),
            path: DeadOfSocratesPageRoute.name,
            adjacentEdges: [16, 17],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(145, 375),
        onTap: () async {
          LeafDetails.currentVertex = 15;
          LeafDetails.visitedVertexes.add(15);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const DeadOfSocratesPageRoute());
        },
        lineStartOffset: const Offset(8, 3),
        lineEndOffset: const Offset(38, -38),
        alignment: Alignment.centerLeft,
        title: 'death of socrates',
      ),
      LeafDetails(
        Vertex(
            index: 16,
            visited: LeafDetails.visitedVertexes.contains(16),
            path: EndOfWarPageRoute.name,
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(200, 385),
        onTap: () async {
          LeafDetails.currentVertex = 16;
          LeafDetails.visitedVertexes.add(16);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const EndOfWarPageRoute());
        },
        lineStartOffset: const Offset(4, 6),
        lineEndOffset: const Offset(-42, 0),
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
        pointOffset: const Offset(170, 435),
        onTap: () async {
          LeafDetails.currentVertex = 17;
          LeafDetails.visitedVertexes.add(17);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const QuizPageRoute());
        },
        lineStartOffset: const Offset(5, 3),
        lineEndOffset: const Offset(-17, -45),
        alignment: Alignment.centerRight,
        title: 'assesment',
      ),
      LeafDetails(
        Vertex(
            index: 18,
            visited: LeafDetails.visitedVertexes.contains(18),
            path: IrlNikosPageRoute.name,
            adjacentEdges: [19],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(145, 485),
        onTap: () async {
          LeafDetails.currentVertex = 18;
          LeafDetails.visitedVertexes.add(18);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const IrlNikosPageRoute());
        },
        lineStartOffset: const Offset(8, 3),
        lineEndOffset: const Offset(33, -38),
        alignment: Alignment.centerLeft,
        title: '#irl',
      ),
      LeafDetails(
        Vertex(
            index: 19,
            visited: LeafDetails.visitedVertexes.contains(19),
            path: AboutBookPageRoute.name,
            adjacentEdges: [20],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(200, 535),
        onTap: () async {
          LeafDetails.currentVertex = 19;
          LeafDetails.visitedVertexes.add(19);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const AboutBookPageRoute());
        },
        lineStartOffset: const Offset(4, 6),
        lineEndOffset: const Offset(-42, -38),
        alignment: Alignment.centerLeft,
        title: 'about the book',
      ),
      LeafDetails(
        Vertex(
            index: 20,
            visited: LeafDetails.visitedVertexes.contains(20),
            path: CreditsPageRoute.name,
            adjacentEdges: [21],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(260, 505),
        onTap: () async {
          LeafDetails.currentVertex = 20;
          LeafDetails.visitedVertexes.add(20);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const CreditsPageRoute());
        },
        lineStartOffset: const Offset(4, 5),
        lineEndOffset: const Offset(-47, 33),
        alignment: Alignment.topCenter,
        title: 'credits',
      ),
      //TODO look into this
      LeafDetails(
        Vertex(
            index: 21,
            visited: LeafDetails.visitedVertexes.contains(21),
            path: SoursePageRoute.name,
            adjacentEdges: [22],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(300, 535),
        onTap: () async {
          LeafDetails.currentVertex = 21;
          LeafDetails.visitedVertexes.add(21);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const SoursePageRoute());
        },
        lineStartOffset: const Offset(3, 5),
        lineEndOffset: const Offset(-29, -19),
        alignment: Alignment.bottomCenter,
        title: 'sources',
      ),
      LeafDetails(
        Vertex(
            index: 22,
            visited: LeafDetails.visitedVertexes.contains(22),
            path: FurtherReadingPageRoute.name,
            adjacentEdges: [23],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(360, 505),
        onTap: () async {
          LeafDetails.currentVertex = 22;
          LeafDetails.visitedVertexes.add(22);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const FurtherReadingPageRoute());
        },
        lineStartOffset: const Offset(3, 5),
        lineEndOffset: const Offset(-49, 34),
        alignment: Alignment.topCenter,
        title: 'further reading',
      ),
      LeafDetails(
        Vertex(
            index: 23,
            visited: LeafDetails.visitedVertexes.contains(23),
            path: CopyrightPageRoute.name,
            adjacentEdges: [23],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(420, 535),
        onTap: () async {
          LeafDetails.currentVertex = 23;
          LeafDetails.visitedVertexes.add(23);
          final List<String> navigationList =
              LeafDetails.visitedVertexes.map((e) => e.toString()).toList();

          await NavigationSharedPreferences.addListToSF(navigationList);
          context.router.replace(const CopyrightPageRoute());
        },
        lineStartOffset: const Offset(3, 5),
        lineEndOffset: const Offset(-47, -24),
        alignment: Alignment.bottomCenter,
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
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    // if (kIsWeb) {
                    //   html.window.history.back();
                    //   context.router.pop();
                    // } else {
                    context.router.pop();
                    //}
                  },
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: AutoSizeText(
                    "Table of contents".toUpperCase(),
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline2,
                  )),
              const SizedBox(height: 76),
              Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 600,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // scrollDirection: Axis.horizontal,
                        // physics: const ClampingScrollPhysics(),
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: chapterNavigationWidgets,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          SizedBox(
                            width: 500,
                            child: SizedBox(
                              child: Stack(children: navigationTreeWidget),
                            ),
                          ),
                        ],
                      ),
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
}
