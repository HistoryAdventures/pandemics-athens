import 'dart:math';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

import '../colors.dart';
import 'assets_path.dart';

class ImageFill extends StatefulWidget {
  final Duration loadDuration;
  final Duration waveDuration;

  final double? boxHeight;

  final double? boxWidth;

  final Color boxBackgroundColor;

  final Color waveColor;
  double loadUntil;

  final int loadingCount;

  ImageFill({
    Key? key,
    this.loadDuration = const Duration(seconds: 27),
    this.waveDuration = const Duration(seconds: 2),
    this.boxHeight,
    this.boxWidth,
    this.boxBackgroundColor = Colors.black,
    this.waveColor = Colors.orange,
    this.loadUntil = 1.0,
    required this.loadingCount,
  })  : assert(loadUntil > 0 && loadUntil <= 1.0),
        super(key: key);

  @override
  _ImageFillState createState() => _ImageFillState();
}

class _ImageFillState extends State<ImageFill> with TickerProviderStateMixin {
  final _imageKey = GlobalKey();

  late AnimationController _waveController, _loadController;

  late Animation<double> _loadValue;

  @override
  void initState() {
    super.initState();

    _waveController = AnimationController(
      vsync: this,
      duration: widget.waveDuration,
    );

    _loadController = AnimationController(
      vsync: this,
      duration: widget.loadDuration,
    );

    _loadValue = Tween<double>(
      begin: 0.0,
      end: widget.loadUntil,
    ).animate(_loadController);
    if (1.0 == widget.loadUntil) {
      _loadValue.addStatusListener((status) {
        if (AnimationStatus.completed == status) {
          // Stop the repeating wave when the load has completed to 100%
          _waveController.stop();
        }
      });
    }

    _waveController.repeat();
    _loadController.forward();
  }

  @override
  void dispose() {
    _waveController.dispose();
    _loadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(180),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.red,
            ),
            height: widget.boxHeight,
            width: widget.boxWidth,
            child: AnimatedBuilder(
              animation: _waveController,
              builder: (BuildContext context, Widget? child) {
                return CustomPaint(
                  painter: _WavePainter(
                      imageKey: _imageKey,
                      loadValue: _loadValue.value,
                      boxHeight: widget.boxHeight!,
                      waveColor: widget.waveColor,
                      loadingCount: widget.loadingCount),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            height: widget.boxHeight,
            width: widget.boxWidth,
            child: ShaderMask(
              blendMode: BlendMode.srcOut,
              shaderCallback: (bounds) => RadialGradient(
                colors: [Colors.black],
                stops: [1.0],
              ).createShader(bounds),
              child: Image.asset(
                AssetsPath.loadingVirus1,
                key: _imageKey,
                fit: BoxFit.contain,
                // color: Colors.transparent,
                colorBlendMode: BlendMode.src,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final GlobalKey imageKey;
  final double loadValue;
  final double boxHeight;
  final Color waveColor;
  final int loadingCount;

  _WavePainter({
    required this.imageKey,
    required this.loadValue,
    required this.boxHeight,
    required this.waveColor,
    required this.loadingCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final RenderBox imageBox =
        imageKey.currentContext!.findRenderObject() as RenderBox;
    final imageHeight = imageBox.size.height;
    final baseHeight = (boxHeight / 2) +
        (imageHeight / 2) -
        (loadingCount * 0.01 * imageHeight + 1);

    final width = size.width;
    final height = size.height;
    final path = Path();
    
    path.moveTo(0.0, baseHeight);
    for (var i = 0.0; i < width; i++) {
      path.lineTo(i, baseHeight);
    }

    path.lineTo(width, height);
    path.lineTo(0.0, height);

    path.close();
    final wavePaint = Paint()..color = waveColor;
    final backgroundPaint = Paint()..color = Colors.white;
    canvas.drawPaint(backgroundPaint);
    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
