import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/router.gr.dart';
import 'package:auto_route/auto_route.dart';

// void main() {
//   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
//       .then((_) {
//     runApp(MyApp());
//   });
// }

class ParalaxHistoryPage extends StatefulWidget {
  @override
  _ParalaxHistoryPageState createState() => _ParalaxHistoryPageState();
}

class _ParalaxHistoryPageState extends State<ParalaxHistoryPage> {
  double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 1200;
  double rateSix = 1000;
  double rateSeven = 600;
  double rateEight = 500;

  String? asset;
  double? top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (v) {
          if (v is ScrollUpdateNotification) {
            //only if scroll update notification is triggered
            setState(() {
              rateEight -= v.scrollDelta! / 1;
              rateSeven -= v.scrollDelta! / 1.5;
              rateSix -= v.scrollDelta! / 2;
              rateFive -= v.scrollDelta! / 2.5;
              rateFour -= v.scrollDelta! / 3;
              rateThree -= v.scrollDelta! / 3.5;
              rateTwo -= v.scrollDelta! / 4;
              rateOne -= v.scrollDelta! / 4.5;
              rateZero -= v.scrollDelta! / 5;
            });
          }
          return true;
        },
        child: Stack(
          children: <Widget>[
            ParallaxWidget(top: rateZero, asset: "parallax0"),
            ParallaxWidget(top: rateOne, asset: "parallax1"),
            ParallaxWidget(top: rateTwo, asset: "parallax2"),
            ParallaxWidget(top: rateThree, asset: "parallax3"),
            ParallaxWidget(top: rateFour, asset: "parallax4"),
            ParallaxWidget(top: rateFive, asset: "parallax5"),
            ParallaxWidget(top: rateSix, asset: "parallax6"),
            ParallaxWidget(top: rateSeven, asset: "parallax7"),
            ParallaxWidget(top: rateEight, asset: "parallax8"),
            ListView(
              children: <Widget>[
                Container(
                  height: 6000,
                  color: Colors.transparent,
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Parallax In",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "MontSerrat-ExtraLight",
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)),
                      ),
                      Text(
                        "Flutter",
                        style: TextStyle(
                            fontSize: 51,
                            fontFamily: "MontSerrat-Regular",
                            letterSpacing: 1.8,
                            color: Color(0xffffaf00)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 190,
                        child: Divider(
                          height: 1,
                          color: Color(0xffffaf00),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Made By",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Montserrat-Extralight",
                          letterSpacing: 1.3,
                          color: Color(0xffffaf00),
                        ),
                      ),
                      Text(
                        "The CS Guy",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat-Regular",
                          letterSpacing: 1.8,
                          color: Color(0xffffaf00),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                color: AppColors.blackB,
                iconSize: 40,
                icon: const Icon(Icons.east),
                onPressed: () {
                  context.router.push(const MapPageRoute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    required this.top,
    required this.asset,
  });

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:
            Image.asset("assets/paralax_images/$asset.png", fit: BoxFit.cover),
      ),
    );
  }
}
