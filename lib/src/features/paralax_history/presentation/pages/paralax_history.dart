import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
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
  String? asset;
  double? top;
  late AppLocalizations locals;
  late Animation<double> animation;
  late AnimationController controller;
  final ScrollController _scrollController = ScrollController();
  @override
  void didChangeDependencies() {
    print('did change did');
    locals = AppLocalizations.of(context)!;
    rateOne = MediaQuery.of(context).size.height * 0.35;
    rateTwo = MediaQuery.of(context).size.height * 0.98;
    rateThree = MediaQuery.of(context).size.height * 1.4;
    rateFour = MediaQuery.of(context).size.height * 2;
    rateFive = MediaQuery.of(context).size.height * 2.4;
    rateSix = MediaQuery.of(context).size.height * 2.6;
    rateSeven = MediaQuery.of(context).size.height * 3;
    rateEight = MediaQuery.of(context).size.height * 3;
    rateNine = MediaQuery.of(context).size.height * 3.6;
    rateTen = MediaQuery.of(context).size.height * 4.4;
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
                rateFour -= v.scrollDelta! / 1.5;
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
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Image.asset(
                  'assets/paralax_images/cloudsBG.png',
                  fit: BoxFit.cover,
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
              Align(
                alignment: Alignment.centerLeft,
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
              ListView(
                  padding: EdgeInsets.zero,
                  controller: _scrollController,
                  children: <Widget>[
                    Container(
                      height: 10000,
                      color: Colors.transparent,
                    )
                  ]),
              Align(
                alignment: Alignment.bottomCenter,
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
                            margin: const EdgeInsets.symmetric(horizontal: 10),
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
      this.image});
  final double top;
  final String? image;
  final String asset;
  final BoxFit boxFit;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Container(
        width: width,
        child: Image.asset("assets/paralax_images/$asset.png", fit: boxFit),
      ),
    );
  }
}
