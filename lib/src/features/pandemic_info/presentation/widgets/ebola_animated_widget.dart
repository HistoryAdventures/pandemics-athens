import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

class EbolaAnimation extends StatefulWidget {
  final double height;
  final double width;
  const EbolaAnimation({
    Key? key,
    this.title,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String? title;

  @override
  _EbolaAnimationState createState() => _EbolaAnimationState();
}

class _EbolaAnimationState extends State<EbolaAnimation> {
  ImageSequenceAnimatorState? offlineImageSequenceAnimator;

  List<String>? _fullPathsOffline;

  void onOfflinePlaying(ImageSequenceAnimatorState _imageSequenceAnimator) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_fullPathsOffline == null) {
      _fullPathsOffline = [];
      for (int i = 0; i < 150; i++) {
        String _value = i.toString();
        while (_value.length < 5) {
          _value = "0$_value";
        }

        _fullPathsOffline!.add("assets/ebola/ebola$_value.png");
      }
    }
    return SizedBox(
      height: widget.height,
      width: widget.height,
      child: ImageSequenceAnimator(
        "assets/blob",
        "white",
        0,
        3,
        "png",
        40,
        key: const Key("offline"),
        fullPaths: _fullPathsOffline,
        onPlaying: onOfflinePlaying,
        isBoomerang: true,
      ),
    );
  }
}
