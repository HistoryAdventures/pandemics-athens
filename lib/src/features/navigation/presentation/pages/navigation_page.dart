import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../models/leaf_detail_model.dart';
import '../widgets/drow_circle_line.dart';
import '../widgets/navigation_tree.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List<Widget> chapterNavigation = [];
  final height = window.physicalSize.height / window.devicePixelRatio;
  final width = window.physicalSize.width / window.devicePixelRatio;
  List<LeafDetails> navigationTreeLeafs = [];
  List<Widget> navigationTreeWidget = [];

  @override
  void initState() {
    super.initState();

    chapterNavigation = [
      chapterNavigationPoints(
          nameOfChapter: ' to do no harm', numberOfChapter: 'chapter1 '),
      chapterNavigationPoints(
          nameOfChapter: ' forty days', numberOfChapter: 'chapter2 '),
      chapterNavigationPoints(
          nameOfChapter: ' beard of life', numberOfChapter: 'chapter3 '),
      chapterNavigationPoints(
          nameOfChapter: ' red pepper and black pepper',
          numberOfChapter: 'chapter4 '),
      chapterNavigationPoints(
          nameOfChapter: ' positive',
          numberOfChapter: 'chapter5 ',
          start: const Offset(0, 0),
          end: const Offset(0, 0)),
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

          context.router.push(const LeandingPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 1;
          LeafDetails.visitedVertexes.add(1);
          context.router.push(const GlossaryPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 2;
          LeafDetails.visitedVertexes.add(2);
          context.router.push(const ParalaxHistoryPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 3;
          LeafDetails.visitedVertexes.add(3);
          context.router.push(const DocumentPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 4;
          LeafDetails.visitedVertexes.add(4);
          context.router.push(const MapPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 5;
          LeafDetails.visitedVertexes.add(5);
          context.router.push(const CharacrterPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 2;
          LeafDetails.visitedVertexes.add(2);
          context.router.push(const ParalaxHistoryPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 2;
          LeafDetails.visitedVertexes.add(2);
          context.router.push(const ParalaxHistoryPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 8;
          LeafDetails.visitedVertexes.add(8);
          context.router.push(const PanaromaLeftPageRoute());
        },
        lineStartOffset: const Offset(2, 5),
        lineEndOffset: const Offset(-27, -20),
        alignment: Alignment.bottomCenter,
        title: 'medical tools and knowladge',
      ),

      LeafDetails(
        Vertex(
            index: 9,
            visited: LeafDetails.visitedVertexes.contains(9),
            path: PanaromaLeftPageRoute.name,
            adjacentEdges: [10],
            currentVertex: LeafDetails.currentVertex),
        pointOffset: const Offset(175, 220),
        onTap: () {
          LeafDetails.currentVertex = 9;
          LeafDetails.visitedVertexes.add(9);
          context.router.push(const PanaromaRightPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 10;
          LeafDetails.visitedVertexes.add(10);
          context.router.push(const PathogenProfilePageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 11;
          LeafDetails.visitedVertexes.add(11);
          context.router.push(const VirusLocationPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 12;
          LeafDetails.visitedVertexes.add(12);
          context.router.push(const BodyInfoPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 13;
          LeafDetails.visitedVertexes.add(13);
          context.router.push(const VirusesInfoPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 14;
          LeafDetails.visitedVertexes.add(14);
          context.router.push(const PracticeMedicineRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 15;
          LeafDetails.visitedVertexes.add(15);
          context.router.push(const DeadOfSocratesPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 16;
          LeafDetails.visitedVertexes.add(16);
          context.router.push(const EndOfWarPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 17;
          LeafDetails.visitedVertexes.add(17);
          context.router.push(const QuizPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 18;
          LeafDetails.visitedVertexes.add(18);
          context.router.push(const IrlNikosPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 19;
          LeafDetails.visitedVertexes.add(19);
          context.router.push(const AboutBookPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 20;
          LeafDetails.visitedVertexes.add(20);
          context.router.push(const CreditsPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 21;
          LeafDetails.visitedVertexes.add(21);
          context.router.push(const SoursePageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 22;
          LeafDetails.visitedVertexes.add(22);
          context.router.push(const FurtherReadingPageRoute());
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
        onTap: () {
          LeafDetails.currentVertex = 23;
          LeafDetails.visitedVertexes.add(23);
          context.router.push(const CopyrightPageRoute());
        },
        lineStartOffset: const Offset(3, 5),
        lineEndOffset: const Offset(-47, -24),
        alignment: Alignment.bottomCenter,
        title: 'copyright',
      ),
    ];
  }

  @override
  void didChangeDependencies() {
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

    super.didChangeDependencies();
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
                  if (kIsWeb) {
                    html.window.history.back();
                    context.router.pop();
                  } else {
                    context.router.pop();
                  }
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
            const SizedBox(height: 50),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth < 600) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: height,
                            child: Stack(
                                clipBehavior: Clip.none,
                                children: navigationTreeWidget),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: chapterNavigation,
                          ),
                        ],
                      ),
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: chapterNavigation,
                        ),
                      ),
                      Expanded(
                        child: Stack(children: navigationTreeWidget),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chapterNavigationPoints(
      {required String numberOfChapter,
      required String nameOfChapter,
      Offset? start,
      Offset? end}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Row(
        children: [
          Text(numberOfChapter),
          SizedBox(
            child: CustomPaint(
              painter: DrowCircleAndLine(
                currentColor: Colors.black,
                color: Colors.white,
                strat: start ?? const Offset(8, 30),
                end: end ?? const Offset(8, 60),
              ),
              child: const SizedBox(
                height: 15,
                width: 15,
                child: Center(
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Text(nameOfChapter),
        ],
      ),
    );
  }
}
