import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/widgets/arrow_left.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/widgets/arrow_right.dart';

class ParalaxHistoryPage extends StatefulWidget {
  @override
  _ParalaxHistoryPageState createState() => _ParalaxHistoryPageState();
}

class _ParalaxHistoryPageState extends State<ParalaxHistoryPage>
    with SingleTickerProviderStateMixin {
  late double rateZero = 0;
  late double rateOne;
  late double rateTwo;
  late double rateThree;
  late double rateFour;
  late double rateFive;
  late double rateSix;
  late double rateSeven;
  late double rateEight;
  late double rateNine;
  late double rateTen;
  double _topTextOpasyty = 0;
  double _bottomFieldOpasity = 0;
  double _paralaxTextOpasyty1 = 0;
  double _paralaxTextOpasyty2 = 0;
  double _paralaxTextOpasyty3 = 0;
  double _paralaxTextOpasyty4 = 0;
  double _paralaxTextOpasyty5 = 0;
  bool _visibility = true;

  String? asset;
  double? top;
  late AppLocalizations locals;
  late Animation<double> animation;
  late AnimationController controller;
  final ScrollController _scrollController = ScrollController();
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    rateOne = MediaQuery.of(context).size.height * 0.35;
    rateTwo = MediaQuery.of(context).size.height * 0.98;
    rateThree = MediaQuery.of(context).size.height * 1.4;
    rateFour = MediaQuery.of(context).size.height * 1.3;
    rateFive = MediaQuery.of(context).size.height * 2.6;
    rateSix = MediaQuery.of(context).size.height * 3;
    rateSeven = MediaQuery.of(context).size.height * 3.8;
    rateEight = MediaQuery.of(context).size.height * 3.8;
    rateNine = MediaQuery.of(context).size.height * 4.8;
    rateTen = MediaQuery.of(context).size.height * 5.8;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 80, end: 50).animate(controller);
    Future.delayed(const Duration(milliseconds: 1500), () {
      animation.addListener(() {
        setState(() {
          _topTextOpasyty = 1;
        });
      });
      controller.forward();

      _scrollController.addListener(() {
        if (_scrollController.offset > 10) {
          _topTextOpasyty = 0;
        } else {
          _topTextOpasyty = 1;
        }
        if (_scrollController.offset <=
                _scrollController.position.maxScrollExtent &&
            _scrollController.offset >=
                _scrollController.position.maxScrollExtent - 100) {
          _bottomFieldOpasity = 1;
        } else {
          _bottomFieldOpasity = 0;
        }
        if (_scrollController.offset > rateFour &&
            _scrollController.offset < rateFour + 500) {
          _paralaxTextOpasyty1 = 1;
        } else {
          _paralaxTextOpasyty1 = 0;
        }
        if (_scrollController.offset > rateTen - 500 &&
            _scrollController.offset < rateTen + 1000) {
          _paralaxTextOpasyty2 = 1;
        } else {
          _paralaxTextOpasyty2 = 0;
        }
        if (_scrollController.offset > rateTen + 1400 &&
            _scrollController.offset < rateTen + 3000) {
          _paralaxTextOpasyty3 = 1;
          setState(() {
            _visibility = false;
          });
        } else {
          _paralaxTextOpasyty3 = 0;
        }
        if (_scrollController.offset > rateTen + 4800 &&
            _scrollController.offset < rateTen + 5400) {
          _paralaxTextOpasyty4 = 1;
        } else {
          _paralaxTextOpasyty4 = 0;
        }
        if (_scrollController.offset > rateTen + 7400 &&
            _scrollController.offset < rateTen + 8000) {
          _paralaxTextOpasyty5 = 1;
        } else {
          _paralaxTextOpasyty5 = 0;
        }
        print(_scrollController.offset);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (constex, constraints) => Scaffold(
        body: NotificationListener(
          onNotification: (v) {
            if (v is ScrollUpdateNotification) {
              //only if scroll update notification is triggered
              setState(() {
                rateTen -= v.scrollDelta! / 2;
                rateNine -= v.scrollDelta! / 2;
                rateEight -= v.scrollDelta! / 2;
                rateSeven -= v.scrollDelta! / 2;
                rateSix -= v.scrollDelta! / 2;
                rateFive -= v.scrollDelta! / 1.6;
                rateFour -= v.scrollDelta! / 2.5;
                rateThree -= v.scrollDelta! / 0.85;
                rateTwo -= v.scrollDelta! / 1;
                rateOne -= v.scrollDelta! / 1.5;
                rateZero -= v.scrollDelta! / 2.5;
              });
            }
            return true;
          },
          child: LayoutBuilder(builder: (context, constraints) {
            return Stack(children: <Widget>[
              Visibility(
                visible: _visibility,
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Image.asset(
                    'assets/paralax_images/cloudsBG.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ParallaxWidget(
                image: 'assets/paralax_images/cloudsBG.png',
                width: MediaQuery.of(context).size.width,
                boxFit: BoxFit.contain,
                top: rateZero,
                asset: "parallax1",
              ),
              ParallaxWidget(
                //height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                boxFit: BoxFit.contain,
                image: 'assets/paralax_images/cloudsBG.png',
                top: rateOne,
                asset: "parallax2",
              ),
              ParallaxWidget(
                paralaxText: locals.paralaxText1,
                width: MediaQuery.of(context).size.width,
                boxFit: BoxFit.contain,
                image: 'assets/paralax_images/cloudsBG.png',
                top: rateTwo,
                asset: "parallax3",
              ),
              ParallaxWidget(
                  width: MediaQuery.of(context).size.width,
                  boxFit: BoxFit.contain,
                  top: rateThree,
                  asset: "parallax4"),
              ParallaxWidget(
                  width: MediaQuery.of(context).size.width,
                  boxFit: BoxFit.cover,
                  top: rateFour,
                  asset: "parallax5"),
              ParallaxWidget(
                width: MediaQuery.of(context).size.width,
                top: rateFive,
                asset: "parallax6",
                boxFit: BoxFit.contain,
              ),
              ParallaxWidget(
                width: MediaQuery.of(context).size.width,
                top: rateSix,
                asset: "parallax7",
                boxFit: BoxFit.cover,
              ),
              ParallaxWidget(
                  width: MediaQuery.of(context).size.width / 2.2,
                  top: rateSeven,
                  asset: "parallax8",
                  boxFit: BoxFit.contain),
              ParallaxWidget(
                  width: MediaQuery.of(context).size.width / 2,
                  top: rateEight,
                  left: 120,
                  // color: Colors.red,
                  asset: "parallax9",
                  boxFit: BoxFit.contain),
              ParallaxWidget(
                  width: MediaQuery.of(context).size.width,
                  top: rateNine,
                  asset: "parallax10",
                  boxFit: BoxFit.contain),
              ParallaxWidget(
                  width: MediaQuery.of(context).size.width,
                  top: rateTen,
                  asset: "parallax11",
                  boxFit: BoxFit.contain),
              Positioned(
                top: constraints.maxHeight * 0.3,
                left: constraints.maxWidth * 0.01,
                child: Container(
                  width: constraints.maxWidth * 0.4,
                  padding: EdgeInsets.only(left: constraints.maxWidth * 0.01),
                  child: AnimatedOpacity(
                    opacity: _topTextOpasyty,
                    duration: const Duration(milliseconds: 2000),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: AutoSizeText(locals.chapter1.toUpperCase()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: AutoSizeText(
                            locals.todoNoHarm.toUpperCase(),
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontSize: animation.value),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      color: AppColors.red, width: 3))),
                          child: AutoSizeText(
                            locals.athens429Bc,
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      fontSize: 80,
                                      fontWeight: FontWeight.w100,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _paralaxTextOpasyty1,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: constraints.maxWidth * 0.05,
                        bottom: constraints.maxHeight * 0.05),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Scaffold(
                        backgroundColor: AppColors.blackG.withOpacity(0.75),
                        body: Padding(
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText(
                              locals.paralaxText1,
                              minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: AppColors.white),
                            ))),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _paralaxTextOpasyty2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: constraints.maxWidth * 0.05,
                        bottom: constraints.maxHeight * 0.05),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Scaffold(
                        backgroundColor: AppColors.blackG.withOpacity(0.75),
                        body: Padding(
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText(
                              locals.paralaxText1,
                              minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: AppColors.white),
                            ))),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _paralaxTextOpasyty3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: constraints.maxWidth * 0.05,
                        bottom: constraints.maxHeight * 0.05),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Scaffold(
                        backgroundColor: AppColors.blackG.withOpacity(0.75),
                        body: Padding(
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText(
                              locals.paralaxText3,
                              minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: AppColors.white),
                            ))),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _paralaxTextOpasyty4,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(
                        right: constraints.maxWidth * 0.05,
                        bottom: constraints.maxHeight * 0.05),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Scaffold(
                        backgroundColor: AppColors.blackG.withOpacity(0.75),
                        body: Padding(
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText(
                              locals.paralaxText4,
                              minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: AppColors.white),
                            ))),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _paralaxTextOpasyty5,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: constraints.maxWidth * 0.05,
                        bottom: constraints.maxHeight * 0.05),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Scaffold(
                        backgroundColor: AppColors.blackG.withOpacity(0.75),
                        body: Padding(
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText(
                              locals.paralaxText5,
                              minFontSize: 5,
                              // maxLines: 20,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(color: AppColors.white),
                            ))),
                  ),
                ),
              ),
              ListView(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  controller: _scrollController,
                  children: <Widget>[
                    Container(
                      height: constraints.maxHeight * 12.5,
                      color: Colors.transparent,
                    )
                  ]),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  duration: const Duration(microseconds: 1000),
                  opacity: _bottomFieldOpasity,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 100,
                    decoration:
                        BoxDecoration(color: AppColors.grey.withOpacity(0.9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ArrowLeftWidget(
                              textSubTitle: locals.stickToTheOath,
                              textTitle: '',
                              onTap: () {
                                context.router.push(const MapPageRoute());
                              }),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: AutoSizeText(
                                locals.whatNikosDo,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        fontSize: 36,
                                        fontWeight: FontWeight.normal),
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: ArrowRightWidget(
                              textSubTitle: locals.helpTheSenator,
                              textTitle: '',
                              onTap: () {
                                context.router.push(const PanaromaPageRoute());
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _paralaxTextOpasyty2,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Clickable(
                        onPressed: () {
                          //context.router.push(const LearnmorePageRoute());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: AppColors.white,
                          )),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18.0, vertical: 5),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        locals.learnMore.toUpperCase(),
                                        minFontSize: 5,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            ?.copyWith(
                                                color: AppColors.white,
                                                fontSize: 10),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            locals.athens5thCentury
                                                .toUpperCase(),
                                            minFontSize: 5,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                ?.copyWith(
                                                    color: AppColors.white),
                                          ),
                                          SizedBox(
                                            height: 10,
                                            width: 10,
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color: AppColors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.volume_up),
                      ),
                      Clickable(
                        onPressed: () {
                          context.router.pop();
                        },
                        child: Column(
                          children: [
                            const Icon(
                              Icons.arrow_upward_sharp,
                              color: AppColors.black54,
                            ),
                            AutoSizeText("BOOK INTO"),
                          ],
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.apps))
                    ],
                  ),
                ),
              )
            ]);
          }),
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget(
      {required this.top,
      required this.asset,
      required this.boxFit,
      required this.width,
      this.image,
      this.left,
      this.color,
      this.paralaxText});
  final double top;
  final String? image;
  final double? left;
  final String? paralaxText;
  final String asset;
  final BoxFit boxFit;
  final double width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left ?? 0,
      child: Container(
        width: width,
        color: color ?? AppColors.transpatent,
        child: Image.asset("assets/paralax_images/$asset.png", fit: boxFit),
      ),
    );
  }
}
