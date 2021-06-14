import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Animator extends StatefulWidget {
  const Animator({
    Key? key,
    required this.path,
    this.height = 200,
    this.repeat = false,
  }) : super(key: key);

  final String path;
  final double height;
  final bool repeat;

  @override
  _AnimatorState createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        widget.path,
        options: LottieOptions(enableMergePaths: true),
        repeat: widget.repeat,
        height: widget.height,
        controller: _animationController,
        onLoaded: (composition) {
          // Configure the AnimationController with the duration of the
          // Lottie file and start the animation.
          _animationController
            ..duration = composition.duration
            ..forward()
            ..repeat();
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
