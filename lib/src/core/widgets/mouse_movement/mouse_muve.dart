import 'dart:ui' as ui;

import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class MouseMovementGame extends BaseGame with MouseMovementDetector {
  static const speed = 100;
  static final Paint _blue = BasicPalette.blue.paint();
  static final Vector2 objSize = Vector2.all(300);

  Vector2 position = Vector2(0, 0);
  Vector2? target;

  bool onTarget = false;

  ui.Image? image;

  MouseMovementGame({this.image});
  @override
  void onMouseMove(PointerHoverInfo info) {
    target = info.eventPosition.game;
  }

  Rect _toRect() => position.toPositionedRect(objSize);

  @override
  void render(Canvas canvas) async {
    final Size imageSize =
        Size(image!.height.toDouble(), image!.height.toDouble());
    final FittedSizes sizes =
        applyBoxFit(BoxFit.cover, imageSize, _toRect().size);
    final Rect inputSubrect =
        Alignment.center.inscribe(sizes.source, Offset.zero & imageSize);
    final Rect outputSubrect =
        Alignment.center.inscribe(sizes.destination, _toRect());

    canvas.drawImageRect(image!, inputSubrect, outputSubrect, _blue);

    super.render(canvas);
    //canvas.drawImage(image!, Offset(position.x + 100, position.y + 100), _blue);
    //canvas.drawImage(image!, Offset(position.x, position.y), );
  }

  @override
  void update(double dt) {
    final target = this.target;
    super.update(dt);
    if (target != null) {
      onTarget = _toRect().contains(target.toOffset());

      if (!onTarget) {
        final dir = (target - position).normalized();
        position += dir * (speed * dt);
      }
    }
  }
}
