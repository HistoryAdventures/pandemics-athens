import 'package:flutter/material.dart';

import 'leaf_detail_model.dart';

class ChapterDetails {
  final Vertex vertex;
  final String numberOfChapter;
  // final String nameOfChapter;
  final VoidCallback onTap;
  Offset? start;
  Offset? end;

  ChapterDetails(
      {required this.numberOfChapter,
      // required this.nameOfChapter,
      required this.vertex,
      required this.onTap,
      this.start,
      this.end});
  static List<int> visitedVertexes = [0];
  static int currentVertex = 0;
}
