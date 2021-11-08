import 'package:flutter/material.dart';

class Line {
  Offset start;
  Offset end;
  GlobalKey startKey;
  GlobalKey endKey;
  Size was;
  bool lineAccepted;
  Line(
    this.start,
    this.end,
    this.was,
    this.startKey,
    this.endKey,
    this.lineAccepted,
  );
}

class QuizItem {
  Question question;
  Target target;

  QuizItem({required this.question, required this.target});
}

class Question {
  final GlobalKey key;
  final String? text;

  Question({required this.key, this.text});
}

class Target {
  final GlobalKey key;
  Target({required this.key});
}

class LineToSave {
  final Line line;
  Offset curveOffset;
  Color color = const Color.fromRGBO(161, 161, 161, 1);
  double strokeWidth = 1;

  LineToSave({
    required this.line,
    required this.curveOffset,
  });
}
