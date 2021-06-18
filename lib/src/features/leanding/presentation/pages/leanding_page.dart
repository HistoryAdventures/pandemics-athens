import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/animated_widgets/blob_animation.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class LeandingPage extends StatefulWidget {
  const LeandingPage({Key? key}) : super(key: key);

  @override
  _LeandingPageState createState() => _LeandingPageState();
}

class _LeandingPageState extends State<LeandingPage> {
  late AppLocalizations locales;
  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: AssetImage(AssetsPath.leandingBackgroundImage),
                      fit: BoxFit.cover)),
            ),
            const Positioned(
              top: 10,
              left: 10,
              child: BlobAnimation(
                width: 100,
                height: 100,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 500,
              child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(AssetsPath.blobWhiteImage1)),
            ),
            Positioned(
              bottom: -150,
              left: 300,
              child: BlobAnimation(
                height: constraints.maxHeight * 0.35,
                width: constraints.maxWidth * 0.35,
              ),
            ),
            Positioned(
              bottom: 100,
              right: 200,
              top: 10,
              child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset(AssetsPath.blobWhiteImage2)),
            ),
            Positioned(
              top: 10,
              right: 10,
              bottom: 10,
              child: BlobAnimation(
                height: constraints.maxHeight * 0.35,
                width: constraints.maxWidth * 0.35,
              ),
            ),
            Positioned(
              bottom: 100,
              right: constraints.maxHeight * 0.2,
              top: 100,
              child: SizedBox(
                  height: constraints.maxHeight * 0.2,
                  width: constraints.maxWidth * 0.2,
                  child: Image.asset(AssetsPath.blobBlackImage)),
            ),
            Positioned(
              bottom: 100,
              right: 40,
              top: 100,
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(AssetsPath.blobWhiteImage1)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: AutoSizeText(locales.spencerStrikerName,
                            style: DefaultTheme.standard.textTheme.headline1)),
                    Flexible(
                      child: AutoSizeText(
                        locales.historyAdventures.toUpperCase(),
                        style: Theme.of(context).textTheme.overline,
                      ),
                    ),
                    Flexible(
                      child: AutoSizeText(
                        locales.worldOfCharacters.toUpperCase(),
                        style: Theme.of(context).textTheme.overline,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: AppColors.red, width: 8))),
                        child: AutoSizeText(
                          locales.globalPandemicName,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                color: AppColors.blackB,
                iconSize: 40,
                icon: const Icon(Icons.south),
                onPressed: () {
                  context.router.push(const MapPageRoute());

                  // Navigator.of(context).push(PageRouteBuilder(
                  //     transitionDuration: const Duration(seconds: 1),
                  //     transitionsBuilder:
                  //         (context, animation, secondaryAnimation, child) {
                  //       const begin = Offset(0.0, 1.0);
                  //       const end = Offset.zero;

                  //       final tween = Tween(begin: begin, end: end);

                  //       return Align(
                  //         child: SlideTransition(
                  //           position: animation.drive(tween),
                  //           //opacity: animation,
                  //           child: child,
                  //         ),
                  //       );
                  // },
                  // pageBuilder: (BuildContext context,
                  //     Animation<double> animation,
                  //     Animation<double> secondaryAnimation) {
                  //   return const MapPage();
                  // }));
                },
              ),
            ),
            Positioned(
              top: 60,
              right: 60,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 45,
                ),
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    ));
  }
}
