import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

////This widget We will delete in future;
///
//////Assets for this widgets deleted;

class BackgroundAnimation extends StatefulWidget {
  final double height;
  final double width;
  const BackgroundAnimation(
      {Key? key, this.title, required this.height, required this.width})
      : super(key: key);

  final String? title;

  @override
  _BackgroundAnimationState createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation> {
  ImageSequenceAnimatorState? offlineImageSequenceAnimator;

  List<String>? _fullPathsOffline;

  void onOfflinePlaying(ImageSequenceAnimatorState _imageSequenceAnimator) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_fullPathsOffline == null) {
      _fullPathsOffline = [];
      for (int i = 0; i < 70; i++) {
        String _value = i.toString();
        while (_value.length < 4) {
          _value = "0$_value";
        }

        _fullPathsOffline!.add("assets/background/white$_value.png");
      }
    }
    return SizedBox(
      height: widget.height,
      width: widget.height,
      child: ImageSequenceAnimator(
        "assets/blob",
        "white",
        0,
        4,
        "png",
        10,
        key: const Key("offline"),
        fullPaths: _fullPathsOffline,
        onPlaying: onOfflinePlaying,
        isBoomerang: true,
      ),
    );
  }
}
