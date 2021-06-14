import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// {@template clickable}
/// Makes the given [child] tappable and clickable.
/// {@endtemplate}
class Clickable extends StatelessWidget {
  /// {@macro clickable}
  const Clickable(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.opaque = true})
      : super(key: key);

  /// Child to be rendered
  final Widget child;

  /// Callback that notifies when the widget has been clicked or tapped
  final VoidCallback onPressed;

  /// If `true` Opaque targets can be hit by hit tests, causing them to both receive
  /// events within their bounds and prevent targets visually behind them
  /// from also receiving events.
  /// On the contrary, when `false` HitTestBehavior targets that defer to their
  /// children receive events within their bounds only if one of their children
  /// is hit by the hit test.
  final bool opaque;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior:
            opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
