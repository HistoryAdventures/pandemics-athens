import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets_path.dart';
import '../widgets/navigation_tree.dart';

class NavigationPage extends StatefulWidget {
 const  NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late List<NavigationTree> navigationTree;
  late List<Widget> chapterNavigation;
  final height = window.physicalSize.height / window.devicePixelRatio;
  final width = window.physicalSize.width / window.devicePixelRatio;
  GlobalKey chaptersPartWidgetKey = GlobalKey();

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
    navigationTree = [
      const NavigationTree(
        left: 100,
        top: 0,
        start: Offset(12, 12),
        end: Offset(20, 50),
      ),
      const NavigationTree(
        left: 115,
        top: 50,
        start: Offset(12, 12),
        end: Offset(-21, 60),
      ),
      const NavigationTree(
        left: 90,
        top: 100,
        start: Offset(9, 12),
        end: Offset(25, 60),
      ),
      const NavigationTree(
        left: 154,
        top: 135,
        start: Offset(0, 10),
        end: Offset(-30, 25),
      ),
      const NavigationTree(
        left: 198,
        top: 155,
        start: Offset(0, 5),
        end: Offset(-30, -10),
      ),
      const NavigationTree(
        left: 110,
        top: 155,
        start: Offset(5, 12),
        end: Offset(-11, 50),
      ),
      const NavigationTree(
        left: 90,
        top: 200,
        start: Offset(2, 5),
        end: Offset(-41, 30),
      ),
      const NavigationTree(
        left: 37,
        top: 222,
        start: Offset(2, 5),
        end: Offset(-31, -25),
      ),
      const NavigationTree(
        left: 0,
        top: 190,
        start: Offset(0, 0),
        end: Offset(0, 0),
      ),
      const NavigationTree(
        left: 135,
        top: 220,
        start: Offset(2, 5),
        end: Offset(-33, -9),
      ),
      const NavigationTree(
        left: 110,
        top: 265,
        start: Offset(8, 1),
        end: Offset(30, -30),
      ),
      const NavigationTree(
        left: 160,
        top: 255,
        start: Offset(2, 8),
        end: Offset(-38, 17),
      ),
      const NavigationTree(
        left: 215,
        top: 265,
        start: Offset(2, 8),
        end: Offset(-40, 0),
      ),
      const NavigationTree(
        left: 265,
        top: 245,
        start: Offset(2, 8),
        end: Offset(-36, 30),
      ),
      const NavigationTree(
        left: 135,
        top: 325,
        start: Offset(5, 3),
        end: Offset(-17, -45),
      ),
      const NavigationTree(
        left: 105,
        top: 375,
        start: Offset(8, 3),
        end: Offset(38, -38),
      ),
      const NavigationTree(
        left: 160,
        top: 385,
        start: Offset(4, 6),
        end: Offset(-42, 0),
      ),
      const NavigationTree(
        left: 130,
        top: 435,
        start: Offset(5, 3),
        end: Offset(-17, -45),
      ),
      const NavigationTree(
        left: 105,
        top: 485,
        start: Offset(8, 3),
        end: Offset(33, -38),
      ),
      const NavigationTree(
        left: 160,
        top: 535,
        start: Offset(4, 6),
        end: Offset(-42, -38),
      ),
      const NavigationTree(
        left: 220,
        top: 505,
        start: Offset(4, 5),
        end: Offset(-47, 33),
      ),
      const NavigationTree(
        left: 260,
        top: 535,
        start: Offset(4, 6),
        end: Offset(-30, -20),
      ),
      const NavigationTree(
        left: 320,
        top: 505,
        start: Offset(4, 6),
        end: Offset(-50, 35),
      ),
      const NavigationTree(
        left: 380,
        top: 535,
        start: Offset(4, 6),
        end: Offset(-48, -25),
      ),
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
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
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
              const SizedBox(
                height: 50,
              ),
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  height: 700,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        key: chaptersPartWidgetKey,
                        children: chapterNavigation,
                      ),
                      FutureBuilder<Size>(
                        future: waitLayoutBuildsFuture(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return const SizedBox();

                          return SizedBox(
                            width: MediaQuery.of(context).size.width -
                                snapshot.data!.width -
                                50,
                            child: Center(
                              child: SizedBox(
                                height: 600,
                                width: 600,
                                child: Stack(
                                  children: navigationTree,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Size> waitLayoutBuildsFuture() async {
    await Future.delayed(const Duration(milliseconds: 10));

    final RenderBox renderBox =
        chaptersPartWidgetKey.currentContext!.findRenderObject()! as RenderBox;

    return renderBox.size;
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
}
