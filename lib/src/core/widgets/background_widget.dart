import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/blob_animation.dart';

class Background extends StatefulWidget {
  const Background({Key? key}) : super(key: key);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
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
            //top left Blob Animation
            const Positioned(
              top: 10,
              left: 10,
              child: BlobAnimation(
                width: 100,
                height: 100,
              ),
            ),
            //bottom left Blob image
            Positioned(
              bottom: 10,
              left: constraints.maxWidth * 0.35,
              child: SizedBox(
                  height: constraints.maxHeight * 0.35,
                  width: constraints.maxWidth * 0.35,
                  child: Image.asset(AssetsPath.blobWhiteImage1)),
            ),
            //bottom left Blob Animation
            Positioned(
              bottom: -150,
              left: constraints.maxWidth * 0.35,
              child: BlobAnimation(
                height: constraints.maxHeight * 0.35,
                width: constraints.maxWidth * 0.35,
              ),
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
                  child: Image.asset(AssetsPath.blobWhiteImage1)),
            ),
            Positioned(
              left: constraints.maxHeight * 0.2,
              top: 100,
              child: SizedBox(
                  height: constraints.maxHeight * 0.2,
                  width: constraints.maxWidth * 0.2,
                  child: Image.asset(AssetsPath.blobWhiteImage1)),
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
          ],
        );
      },
    ));
  }
}
