import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

class TyphusAimation extends StatefulWidget {
  final double height;
  final double width;
  const TyphusAimation(
      {Key? key, this.title, required this.height, required this.width})
      : super(key: key);

  final String? title;

  @override
  _TyphusAimationState createState() => _TyphusAimationState();
}

class _TyphusAimationState extends State<TyphusAimation> {
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

        _fullPathsOffline!.add("assets/typhus/typhus$_value.png");
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
        60,
        key: const Key("offline"),
        fullPaths: _fullPathsOffline,
        onPlaying: onOfflinePlaying,
        isBoomerang: true,
      ),
    );
  }
}
