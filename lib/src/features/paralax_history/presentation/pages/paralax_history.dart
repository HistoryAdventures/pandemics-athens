import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_left.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_right.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/features/panorama/prezentation/pages/panaroma_page.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/widgets/arrow_left.dart';
import 'package:history_of_adventures/src/features/paralax_history/presentation/widgets/arrow_right.dart';

class ParalaxHistoryPage extends StatefulWidget {
  @override
  _ParalaxHistoryPageState createState() => _ParalaxHistoryPageState();
}

class _ParalaxHistoryPageState extends State<ParalaxHistoryPage> {
  double rateZero = -100;
  double rateOne = 350;
  double rateTwo = 900;
  double rateThree = 1400;
  double rateFour = 2000;
  double rateFive = 2100;
  double rateSix = 2600;
  double rateSeven = 3000;
  double rateEight = 3050;
  double rateNine = 3600;
  double rateTen = 4400;

  String? asset;
  double? top;
  late AppLocalizations locals;
  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
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
                rateThree -= v.scrollDelta! / 1.25;
                rateTwo -= v.scrollDelta! / 1.3;
                rateOne -= v.scrollDelta! / 1.5;
                rateZero -= v.scrollDelta! / 2.5;
              });
            }
            return true;
          },
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(children: <Widget>[
              ParallaxWidget(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                boxFit: BoxFit.contain,
                top: rateZero,
                asset: "parallax1",
              ),
              ParallaxWidget(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                boxFit: BoxFit.contain,
                top: rateOne,
                asset: "parallax2",
              ),
              ParallaxWidget(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                boxFit: BoxFit.contain,
                top: rateTwo,
                asset: "parallax3",
              ),
              ParallaxWidget(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  boxFit: BoxFit.contain,
                  top: rateThree,
                  asset: "parallax4"),
              ParallaxWidget(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  boxFit: BoxFit.cover,
                  top: rateFour,
                  asset: "parallax5"),
              ParallaxWidget(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                top: rateFive,
                asset: "parallax6",
                boxFit: BoxFit.contain,
              ),
              ParallaxWidget(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                top: rateSix,
                asset: "parallax7",
                boxFit: BoxFit.cover,
              ),
              ParallaxWidget(
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: MediaQuery.of(context).size.width / 2.2,
                  top: rateSeven,
                  asset: "parallax8",
                  boxFit: BoxFit.contain),
              ParallaxWidget(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  top: rateEight,
                  asset: "parallax9",
                  boxFit: BoxFit.contain),
              ParallaxWidget(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  top: rateNine,
                  asset: "parallax10",
                  boxFit: BoxFit.contain),
              ParallaxWidget(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  top: rateTen,
                  asset: "parallax11",
                  boxFit: BoxFit.contain),
              ListView(padding: EdgeInsets.zero, children: <Widget>[
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
                              context.router.pop();
                            }),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              locals.whatNikosDo,
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
            ]),
          ),
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
      required this.height,
      required this.width});

  final double top;
  final String asset;
  final BoxFit boxFit;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Container(
        height: height,
        width: width,
        child: Image.asset("assets/paralax_images/$asset.png", fit: boxFit),
      ),
    );
  }
}
