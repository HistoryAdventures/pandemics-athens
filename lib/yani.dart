import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';
import 'package:lottie/lottie.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ImageSequenceAnimatorState? get imageSequenceAnimator =>
      offlineImageSequenceAnimator;
  ImageSequenceAnimatorState? offlineImageSequenceAnimator;

  bool wasPlaying = false;

  List<String>? _fullPathsOffline;

  void onOfflineReadyToPlay(ImageSequenceAnimatorState _imageSequenceAnimator) {
    offlineImageSequenceAnimator = _imageSequenceAnimator;
  }

  void onOfflinePlaying(ImageSequenceAnimatorState _imageSequenceAnimator) {
    setState(() {});
  }

  Widget row(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(3.125),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    if (_fullPathsOffline == null) {
      _fullPathsOffline = [];

      for (int i = 1; i < 91; i++) {
        String _value = i.toString();
        while (_value.length < 3) _value = "0" + _value;
        _fullPathsOffline!.add("assets/img/" + _value + ".png");
      }
    }
    print(_fullPathsOffline);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: ImageSequenceAnimator(
                "assets/img",
                "",
                1,
                3,
                "png",
                91,
                fullPaths: _fullPathsOffline,
                fps: 30,
                onReadyToPlay: onOfflineReadyToPlay,
                onPlaying: onOfflinePlaying,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CupertinoSlider(
                  value: imageSequenceAnimator == null
                      ? 0.0
                      : imageSequenceAnimator!.currentProgress,
                  min: 0.0,
                  max: imageSequenceAnimator == null
                      ? 100.0
                      : imageSequenceAnimator!.totalProgress,
                  onChangeStart: (double value) {
                    wasPlaying = imageSequenceAnimator!.isPlaying;
                    imageSequenceAnimator!.pause();
                  },
                  onChanged: (double value) {
                    imageSequenceAnimator!.skip(value);
                  },
                  onChangeEnd: (double value) {
                    if (wasPlaying) imageSequenceAnimator!.play();
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    imageSequenceAnimator == null
                        ? "0.0"
                        : ((imageSequenceAnimator!.currentTime.floor())
                                .toString() +
                            "/" +
                            (imageSequenceAnimator!.totalTime.floor())
                                .toString()),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LotieTest extends StatefulWidget {
  @override
  _LotieTestState createState() => _LotieTestState();
}

class _LotieTestState extends State<LotieTest>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _animate = false;
  double value = 0;
  late double minValue;
  late double maxValue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Future.delayed(_);
      _animationController
        ..addListener(() {
          minValue = _animationController.lowerBound;
          maxValue = _animationController.upperBound;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSlider(
          value: value,
          min: 0,
          max: 1,
          onChanged: (double _value) {
            value = _value;
            _animationController.value = value;
            setState(() {});
          },
        ),
        Expanded(
          child: Container(
            color: Colors.grey,
            child: Lottie.asset(
              'assets/map.json',
              animate: _animate,
              options: LottieOptions(enableMergePaths: true),
              repeat: false,
              controller: _animationController,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _animationController..duration = composition.duration;

                print("Lower  Bound ---  ${_animationController.lowerBound}");
                print("Upper  Bound ---  ${_animationController.upperBound}");
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
