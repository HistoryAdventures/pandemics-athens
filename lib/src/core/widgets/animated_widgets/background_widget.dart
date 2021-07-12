import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:video_player/video_player.dart';

import '../widget_circle.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  _BackgroundWidgetState createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>
    with SingleTickerProviderStateMixin {
  late AppLocalizations locales;
  late AnimationController animatinController;
  late Animation<double> animation;
  late List<CircleWidgets> randomCircleList;
  late ui.Image image;
  @override
  void didChangeDependencies() {
    locales = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;
  bool isVideoLoaded = false;
  bool isImageloaded = false;

  @override
  void initState() {
    super.initState();
    init();

    animatinController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addStatusListener(_onAnimationStatusChanged)
          ..forward();

    animation = Tween<double>(begin: 0, end: 30).animate(animatinController);
    randomCircleList = List<CircleWidgets>.generate(1000, (i) {
      final random = Random();
      final List<Color> listColors = [
        Colors.grey,
        Colors.black,
        Colors.white,
        Colors.grey.shade200,
        Colors.grey.shade500,
        Colors.grey.shade600,
        Colors.grey.shade700,
      ];
      return CircleWidgets(
        height: random.nextInt(15).toDouble(),
        width: random.nextInt(15).toDouble(),
        animation: animation,
        color: listColors[random.nextInt(listColors.length)],
        top: i.toDouble() * random.nextInt(20),
        left: i.toDouble() * random.nextInt(50),
        right: i.toDouble() * random.nextInt(50),
        bottom: i.toDouble() * random.nextInt(50),
      );
    });
    _videoController =
        VideoPlayerController.asset('assets/video/video_back.mp4');
    _initializeVideoPlayerFuture = _videoController.initialize().then((_) {
      _videoController.setLooping(true);
      _videoController.play();
      _videoController.setVolume(0);
      setState(() {});
    });
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (!mounted) return;
    if (status == AnimationStatus.completed) {
      if (mounted) animatinController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      if (mounted) animatinController.forward();
    }
  }

  Future<Null> init() async {
    final ByteData data = await rootBundle.load('images/white0000.png');
    image = await loadImage(Uint8List.view(data.buffer));
  }

  Future<ui.Image> loadImage(Uint8List img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageloaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  @override
  void dispose() {
    _videoController.dispose();
    animatinController.dispose();

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
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return VideoPlayer(_videoController);
                      }

                      return Container();
                    },
                  ),
                ),
              ),
            ),
            Stack(
              children: randomCircleList,
            ),
            // SizedBox.expand(
            //   child: FittedBox(
            //     fit: BoxFit.cover,
            //     child: SizedBox(
            //         width: constraints.maxWidth,
            //         height: constraints.maxHeight,
            //         child: GameWidget(game: MouseMovementGame())),
            //   ),
            // ),
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
