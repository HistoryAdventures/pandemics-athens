import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_sequence_animator/image_sequence_animator.dart';

class Plaguenimation extends StatefulWidget {
  final double height;
  final double width;
  const Plaguenimation(
      {Key? key, this.title, required this.height, required this.width})
      : super(key: key);

  final String? title;

  @override
  _PlaguenimationState createState() => _PlaguenimationState();
}

class _PlaguenimationState extends State<Plaguenimation> {
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

        _fullPathsOffline!.add("assets/plague/plague$_value.png");
      }
    }
    return SizedBox(
      height: widget.height,
      width: widget.height,
      child: ImageSequenceAnimator(
        "assets/blob",
        "white",
        0,
        5,
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
