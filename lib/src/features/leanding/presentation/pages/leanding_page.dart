import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/theme.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/blob_animation.dart';

class LeandingPage extends StatefulWidget {
  const LeandingPage({Key? key}) : super(key: key);

  @override
  _LeandingPageState createState() => _LeandingPageState();
}

class _LeandingPageState extends State<LeandingPage> {
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
                        child: AutoSizeText('Spencer Striker, PHD',
                            style: DefaultTheme.standard.textTheme.headline1)),
                    Flexible(
                      child: AutoSizeText(
                        "History Adventures".toUpperCase(),
                        style: Theme.of(context).textTheme.overline,
                      ),
                    ),
                    Flexible(
                      child: AutoSizeText(
                        "World Of Characters".toUpperCase(),
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
                          " global pandemic",
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
                onPressed: () {},
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
