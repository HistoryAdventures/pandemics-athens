import 'package:flutter/material.dart';

class DragObject extends StatefulWidget {
  final String id;
  final Offset initPos;
  final Color itmColor;
  final GlobalKey key;

  const DragObject(
      {required this.key,
      required this.id,
      required this.initPos,
      required this.itmColor})
      : super(key: key);

  @override
  _DragObjectState createState() => _DragObjectState();
}

class _DragObjectState extends State<DragObject> {
  GlobalKey _key = GlobalKey();
  Offset position = Offset.zero;
  Offset posOffset = const Offset(0.0, 0.0);

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
    _key = widget.key;
    position = widget.initPos;
    super.initState();
  }

  void _getRenderOffsets() {
    final RenderBox renderBoxWidget =
        _key.currentContext!.findRenderObject() as RenderBox;
    ;
    final offset = renderBoxWidget.localToGlobal(Offset.zero);

    posOffset = offset - position;
  }

  void _afterLayout(_) {
    _getRenderOffsets();
  }

  void limitBoundaries(PointerEvent details) {
    if (details.position.dx < 0) {
      print(details.position);
      setState(() {
        position = Offset(0.0, position.dy);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Listener(
        onPointerMove: limitBoundaries,
        child: Draggable(
          child: Container(
            width: 80,
            height: 80,
            color: widget.itmColor,
          ),
          feedback: Container(
            width: 82,
            height: 82,
            color: widget.itmColor,
          ),
          childWhenDragging: Container(),
          onDragEnd: (drag) {
            setState(() {
              position = drag.offset - posOffset;
            });
          },
        ),
      ),
    );
  }
}
