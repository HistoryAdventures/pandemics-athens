import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';

class DialoigMapImage extends StatefulWidget {
  String image;
  DialoigMapImage({Key? key, required this.image}) : super(key: key);

  @override
  _DialoigMapImageState createState() => _DialoigMapImageState();
}

class _DialoigMapImageState extends State<DialoigMapImage>
    with TickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();
  Animation<Matrix4>? _animationReset;
  late final AnimationController _controllerReset;

  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isInfoBorderOpen = true;

  // late List<DocumentModel> documentList;

  // late DocumentModel documentModel;

  double scaleDownIndex = 0.9;
  double scaleUpIndex = 1.25;

  void _onAnimateReset() {
    _transformationController.value = _animationReset!.value;
    if (!_controllerReset.isAnimating) {
      _animationReset!.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _scaleUp() {
    final Matrix4 _matrixUp = _transformationController.value
        .clone()
        .multiplied(
            Matrix4.diagonal3Values(scaleUpIndex, scaleUpIndex, scaleUpIndex));
    if (_matrixUp[0] < 3.5) {
      _controllerReset.reset();
      _animationReset =
          Matrix4Tween(begin: _transformationController.value, end: _matrixUp)
              .animate(_controllerReset);
      _animationReset!.addListener(_onAnimateReset);

      _transformationController.value =
          PointerEvent.removePerspectiveTransform(_matrixUp);

      _controllerReset.forward();
    } else {
      return;
    }
  }

  void _scaleDown() {
    final Matrix4 _matrixDown = _transformationController.value
        .clone()
        .multiplied(Matrix4.diagonal3Values(
            scaleDownIndex, scaleDownIndex, scaleDownIndex));
    if (_matrixDown[0] > 0.3) {
      _controllerReset.reset();
      _animationReset =
          Matrix4Tween(begin: _transformationController.value, end: _matrixDown)
              .animate(_controllerReset);
      _animationReset!.addListener(_onAnimateReset);
      _transformationController.value =
          PointerEvent.removePerspectiveTransform(_matrixDown);

      _controllerReset.forward();
    } else {
      return;
    }
  }

// Stop a running reset to home transform animation.
  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    // If the user tries to cause a transformation while the reset animation is
    // running, cancel the reset animation.
    if (_controllerReset.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  @override
  void initState() {
    super.initState();

    _controllerReset = AnimationController(
      vsync: this,
      duration: Times.fastest,
    );

    _transformationController.addListener(() {
      //debugPrint('${_transformationController.value}');
    });
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: AppColors.greyDeep,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn+",
            backgroundColor: AppColors.white,
            onPressed: _scaleUp,
            child: const Icon(Icons.add, color: AppColors.blackB),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            heroTag: "btn-",
            backgroundColor: AppColors.white,
            onPressed: _scaleDown,
            child: const Icon(Icons.remove, color: AppColors.blackB),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            InteractiveViewer(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              transformationController: _transformationController,
              onInteractionStart: _onInteractionStart,
              boundaryMargin: const EdgeInsets.all(double.infinity),
              minScale: 0.25,
              maxScale: 3,
              constrained: false,
              child: Container(
                alignment: Alignment.centerLeft,
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        //alignment: Alignment.centerLeft,
                        image: AssetImage(widget.image))),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: FloatingActionButton(
                  heroTag: "btn-",
                  backgroundColor: AppColors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.clear, color: AppColors.blackB),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
