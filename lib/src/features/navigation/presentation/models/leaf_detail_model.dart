
import 'package:flutter/material.dart';

class LeafDetails {
  final Vertex vertex;
  final Offset pointOffset;
  final Offset lineStartOffset;
  final Offset lineEndOffset;
  final Alignment alignment;
  final String title;
  final VoidCallback onTap;

  static List<int> visitedVertexes = [0];
  static int currentVertex = 0;

  const LeafDetails(
    this.vertex, {
    required this.pointOffset,
    required this.onTap,
    this.lineStartOffset = Offset.zero,
    this.lineEndOffset = Offset.zero,
    this.alignment = Alignment.bottomCenter,
    required this.title,
  });
}

class Vertex {
  final int index;
  final int currentVertex;
  final bool visited;
  final String path;
  final List<int> adjacentEdges;
  bool isCurrent = false;
  Vertex({
    required this.index,
    required this.visited,
    required this.path,
    required this.currentVertex,
    this.adjacentEdges = const [],
  }) : isCurrent = currentVertex == index;
}
