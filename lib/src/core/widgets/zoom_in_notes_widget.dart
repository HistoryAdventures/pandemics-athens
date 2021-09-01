import 'package:flutter/material.dart';

class ZoomInNotesWidget extends StatelessWidget {
  const ZoomInNotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.zoom_in,
            color: Colors.white,
          ),
          Icon(
            Icons.notes,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
