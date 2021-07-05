import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:video_player/video_player.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
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
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Image.asset(
                      "assets/background/white0000.png",
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetsPath.spheresBackImage),
                      fit: BoxFit.cover)),
            ),
          ],
        );
      },
    ));
  }
}
