import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/widgets/animated_widgets/animtion_transform.dart';

class TransformPage extends StatefulWidget {
  const TransformPage({Key? key}) : super(key: key);

  @override
  _TransformPageState createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    final _cureveAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeIn);

    _animation = Tween<double>(begin: 0, end: 0.1).animate(_cureveAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 80),
      child: Stack(
        children: [
          const SizedBox(
            width: 600,
            height: 600,
          ),
          Positioned(
              top: 250,
              child: MainImage(
                animation: _animation,
                image: 'assets/viruses/virus1.png',
              )),
          Positioned(
              left: 110,
              child: Image.asset(
                'assets/viruses/virus2.png',
              )),
          Positioned(
              top: 50,
              left: 350,
              child: Image.asset(
                'assets/viruses/virus3.png',
              )),
          Positioned(
              child: MainImage(
            animation: _animation,
            image: 'assets/viruses/virus4.png',
          )),
          Positioned(
              top: 150,
              left: 300,
              child: MainImage(
                animation: _animation,
                image: 'assets/viruses/virus5.png',
              )),
        ],
      ),
    );
  }
}
