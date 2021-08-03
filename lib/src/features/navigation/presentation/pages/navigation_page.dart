import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';

import '../../../../core/utils/assets_path.dart';
import '../widgets/navigation_tree.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late List<Widget> chapterNavigation;
  final height = window.physicalSize.height / window.devicePixelRatio;
  final width = window.physicalSize.width / window.devicePixelRatio;
  int currentVertex = 0;
  List<int> visitedVertexes = [];

  @override
  void initState() {
    super.initState();

    navigationTreeLeafs = [
      LeafDetails(
        Vertex(
          index: 0,
          visited: visitedVertexes.contains(0),
          path: CharacrterPageRoute.name,
          currentVertex: currentVertex,
        ),
        pointOffset: Offset(100, 0),
        lineStartOffset: Offset(12, 12),
        lineEndOffset: Offset(20, 50),
        alignment: Alignment.centerLeft,
        title: 'home',
      ),
      LeafDetails(
        Vertex(
          index: 1,
          visited: visitedVertexes.contains(1),
          path: GlossaryPageRoute.name,
          currentVertex: currentVertex,
        ),
        pointOffset: Offset(115, 50),
        lineStartOffset: Offset(12, 12),
        lineEndOffset: Offset(-21, 60),
        alignment: Alignment.centerRight,
        title: 'glossary',
      ),
      LeafDetails(
        Vertex(
          index: 2,
          visited: visitedVertexes.contains(2),
          path: ParalaxHistoryPageRoute.name,
          currentVertex: currentVertex,
        ),
        pointOffset: Offset(90, 100),
        lineStartOffset: Offset(9, 12),
        lineEndOffset: Offset(25, 60),
        alignment: Alignment.topCenter,
        title: 'to do no harm',
      ),
      LeafDetails(
        Vertex(
            index: 3,
            visited: visitedVertexes.contains(3),
            path: MapPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(154, 135),
        lineStartOffset: Offset(0, 10),
        lineEndOffset: Offset(-30, 25),
        alignment: Alignment.topCenter,
        title: '',
      ),
      LeafDetails(
        Vertex(
            index: 4,
            visited: visitedVertexes.contains(4),
            path: MapPageRoute.name,
            currentVertex: currentVertex),
        alignment: Alignment.bottomCenter,
        pointOffset: Offset(198, 155),
        lineStartOffset: Offset(0, 5),
        lineEndOffset: Offset(-30, -10),
        title: 'key people of the age',
      ),
      LeafDetails(
        Vertex(
            index: 5,
            visited: visitedVertexes.contains(5),
            path: CharacrterPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(110, 155),
        lineStartOffset: Offset(5, 12),
        lineEndOffset: Offset(-11, 50),
        alignment: Alignment.centerLeft,
        title: '',
      ),
      LeafDetails(
        Vertex(
            index: 6,
            visited: visitedVertexes.contains(6),
            path: CharacterInfoPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(90, 200),
        lineStartOffset: Offset(2, 5),
        lineEndOffset: Offset(-41, 30),
        title: '',
      ),
      LeafDetails(
        Vertex(
            index: 7,
            visited: visitedVertexes.contains(7),
            path: PanaromaRightPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(37, 222),
        lineStartOffset: Offset(2, 5),
        lineEndOffset: Offset(-31, -25),
        alignment: Alignment.bottomCenter,
        title: 'medical tools and knowladge',
      ),
      LeafDetails(
        Vertex(
            index: 8,
            visited: visitedVertexes.contains(8),
            path: DocumentPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(0, 190),
        lineStartOffset: Offset(0, 0),
        lineEndOffset: Offset(0, 0),
        alignment: Alignment.topCenter,
        title: 'source analysis',
      ),
      LeafDetails(
        Vertex(
            index: 9,
            visited: visitedVertexes.contains(9),
            path: PanaromaLeftPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(135, 220),
        lineStartOffset: Offset(2, 5),
        lineEndOffset: Offset(-33, -9),
        alignment: Alignment.centerRight,
        title: 'plague and political instability',
      ),
      LeafDetails(
        Vertex(
            index: 10,
            visited: visitedVertexes.contains(10),
            path: PathogenProfilePageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(110, 265),
        lineStartOffset: Offset(8, 1),
        lineEndOffset: Offset(30, -30),
        alignment: Alignment.centerLeft,
        title: 'pathogen profile',
      ),
      LeafDetails(
        Vertex(
            index: 11,
            visited: visitedVertexes.contains(11),
            path: VirusLocationPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(160, 255),
        lineStartOffset: Offset(2, 8),
        lineEndOffset: Offset(-38, 17),
        alignment: Alignment.topCenter,
        title: 'where did it come from?',
      ),
      LeafDetails(
        Vertex(
            index: 12,
            visited: visitedVertexes.contains(12),
            path: BodyInfoPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(215, 265),
        lineStartOffset: Offset(2, 8),
        lineEndOffset: Offset(-40, 0),
        alignment: Alignment.bottomCenter,
        title: 'what did it do?',
      ),
      LeafDetails(
        Vertex(
            index: 13,
            visited: visitedVertexes.contains(13),
            path: VirusesInfoPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(265, 245),
        lineStartOffset: Offset(2, 8),
        lineEndOffset: Offset(-36, 30),
        alignment: Alignment.topCenter,
        title: 'what was it?',
      ),
      //TODO look into this one
      LeafDetails(
        Vertex(
            index: 14,
            visited: visitedVertexes.contains(14),
            path: PracticeMedicineRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(135, 325),
        lineStartOffset: Offset(5, 3),
        lineEndOffset: Offset(-17, -45),
        alignment: Alignment.centerRight,
        title: 'to do no harm',
      ),
      LeafDetails(
        Vertex(
            index: 15,
            visited: visitedVertexes.contains(15),
            path: DeadOfSocratesPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(105, 375),
        lineStartOffset: Offset(8, 3),
        lineEndOffset: Offset(38, -38),
        alignment: Alignment.centerLeft,
        title: 'death of socrates',
      ),
      LeafDetails(
        Vertex(
            index: 16,
            visited: visitedVertexes.contains(16),
            path: EndOfWarPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(160, 385),
        lineStartOffset: Offset(4, 6),
        lineEndOffset: Offset(-42, 0),
        alignment: Alignment.centerRight,
        title: 'end of war',
      ),
      LeafDetails(
        Vertex(
            index: 17,
            visited: visitedVertexes.contains(17),
            path: QuizPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(130, 435),
        lineStartOffset: Offset(5, 3),
        lineEndOffset: Offset(-17, -45),
        alignment: Alignment.centerRight,
        title: 'assesment',
      ),
      LeafDetails(
        Vertex(
            index: 18,
            visited: visitedVertexes.contains(18),
            path: IrlNikosPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(105, 485),
        lineStartOffset: Offset(8, 3),
        lineEndOffset: Offset(33, -38),
        alignment: Alignment.centerLeft,
        title: '#irl',
      ),
      LeafDetails(
        Vertex(
            index: 19,
            visited: visitedVertexes.contains(19),
            path: AboutBookPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(160, 535),
        lineStartOffset: Offset(4, 6),
        lineEndOffset: Offset(-42, -38),
        alignment: Alignment.centerLeft,
        title: 'about the book',
      ),
      LeafDetails(
        Vertex(
            index: 20,
            visited: visitedVertexes.contains(20),
            path: CreditsPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(220, 505),
        lineStartOffset: Offset(4, 5),
        lineEndOffset: Offset(-47, 33),
        alignment: Alignment.topCenter,
        title: 'credits',
      ),
      //TODO look into this
      LeafDetails(
        Vertex(
            index: 21,
            visited: visitedVertexes.contains(21),
            path: CreditsPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(260, 535),
        lineStartOffset: Offset(4, 6),
        lineEndOffset: Offset(-30, -20),
        alignment: Alignment.bottomCenter,
        title: 'sources',
      ),
      LeafDetails(
        Vertex(
            index: 22,
            visited: visitedVertexes.contains(22),
            path: CreditsPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(320, 505),
        lineStartOffset: Offset(4, 6),
        lineEndOffset: Offset(-50, 35),
        alignment: Alignment.topCenter,
        title: 'further reading',
      ),
      LeafDetails(
        Vertex(
            index: 23,
            visited: visitedVertexes.contains(23),
            path: CreditsPageRoute.name,
            currentVertex: currentVertex),
        pointOffset: Offset(380, 535),
        lineStartOffset: Offset(4, 6),
        lineEndOffset: Offset(-48, -25),
        alignment: Alignment.bottomCenter,
        title: 'copyright',
      ),
    ];
  }

  @override
  void didChangeDependencies() {
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

    super.didChangeDependencies();
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
                  context.router.pop();
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
                              children: List.generate(
                                navigationTreeLeafs.length,
                                (index) => NavigationTree(
                                  key: ValueKey('leaf-$index'),
                                  details: navigationTreeLeafs[index],
                                ),
                              ),
                            ),
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
                        child: Stack(
                          children: List.generate(
                            navigationTreeLeafs.length,
                            (index) => Stack(
                              children: [
                                NavigationTree(
                                  key: ValueKey('leaf-$index'),
                                  details: navigationTreeLeafs[index],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // SingleChildScrollView(
            //   physics: const ClampingScrollPhysics(),
            //   scrollDirection: Axis.vertical,
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     physics: const ClampingScrollPhysics(),
            //     child: SizedBox(
            //       height: 500,
            //       width: width,
            //       child:
            //     ),
            //   ),
            // ),
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

  List<LeafDetails> navigationTreeLeafs = [];
}
