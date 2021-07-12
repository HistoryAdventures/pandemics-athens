import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage>
    with TickerProviderStateMixin {
  final TransformationController _transformationController =
      TransformationController();
  Animation<Matrix4>? _animationReset;
  late final AnimationController _controllerReset;
  double scale = 0.9;
  void _onAnimateReset() {
    _transformationController.value = _animationReset!.value;
    if (!_controllerReset.isAnimating) {
      _animationReset!.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _scaleUp() {
    final Matrix4 _matrix = _transformationController.value
        .clone()
        .multiplied(Matrix4.diagonal3Values(1.25, 1.25, 1.25));

    _controllerReset.reset();
    _animationReset =
        Matrix4Tween(begin: _transformationController.value, end: _matrix)
            .animate(_controllerReset);
    _animationReset!.addListener(_onAnimateReset);

    _transformationController.value =
        PointerEvent.removePerspectiveTransform(_matrix);

    _controllerReset.forward();
  }

  void _scaleDown() {
    final Matrix4 _matrix = _transformationController.value
        .clone()
        .multiplied(Matrix4.diagonal3Values(scale, scale, scale));
    _controllerReset.reset();
    _animationReset =
        Matrix4Tween(begin: _transformationController.value, end: _matrix)
            .animate(_controllerReset);
    _animationReset!.addListener(_onAnimateReset);
    _transformationController.value =
        PointerEvent.removePerspectiveTransform(_matrix);

    _controllerReset.forward();
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
      duration: const Duration(milliseconds: 100),
    );

    _transformationController.addListener(() {
      debugPrint('${_transformationController.value}');
    });
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.greyDeep,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: AppColors.white,
              onPressed: _scaleUp,
              child: const Icon(Icons.add, color: AppColors.blackB),
            ),
            const SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              backgroundColor: AppColors.white,
              onPressed: _scaleDown,
              child: const Icon(Icons.remove, color: AppColors.blackB),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
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
                  child: SizedBox(
                    height: constraints.maxHeight - 150,
                    width: constraints.maxWidth,
                    child: Image.asset(AssetsPath.document),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
