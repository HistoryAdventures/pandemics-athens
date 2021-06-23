import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/widgets/animated_widgets/blob_animation.dart';

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

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/video_back.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    //_controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // Container(
            //   width: constraints.maxWidth,
            //   height: constraints.maxHeight,
            //   decoration: const BoxDecoration(
            //       color: Colors.grey,
            //       image: DecorationImage(
            //           image: AssetImage(AssetsPath.leandingBackgroundImage),
            //           fit: BoxFit.cover)),
            // ),
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return VideoPlayer(_controller);
                    },
                  ),
                ),
              ),
            ),
            // Container(
            //   // height: constraints.maxHeight,
            //   // width: constraints.maxWidth,
            //   child: Image.asset(
            //     'assets/image_back/image_back.png',
            //   ),
            // ),
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
                          maxLines: 1,
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
