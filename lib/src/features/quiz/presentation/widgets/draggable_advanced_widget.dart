import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/widgets/draggable_widget.dart';
import 'package:history_of_adventures/src/features/quiz/data/model/quiz_model.dart';

class DraggableAdvancedWidget extends StatefulWidget {
  @override
  _DraggableAdvancedWidgetState createState() =>
      _DraggableAdvancedWidgetState();
}

class _DraggableAdvancedWidgetState extends State<DraggableAdvancedWidget> {
  final List<AnswerText> all = allAnswerTexts;
  final List<AnswerText> land = [];
  final List<AnswerText> air = [];

  void removeAll(AnswerText toRemove) {
    all.removeWhere((animal) => animal.answers == toRemove.answers);
    land.removeWhere((animal) => animal.answers == toRemove.answers);
    air.removeWhere((animal) => animal.answers == toRemove.answers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox(
          // color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: all
                    .map(
                      (e) => buildTarget(
                        context: context,
                        animals: [e],
                        onAccept: (data) => setState(() {
                          removeAll(data);
                          all.add(data);
                        }),
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildTarget(
                    context: context,
                    animals: land,
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      land.add(data);
                    }),
                  ),
                  buildTarget(
                    context: context,
                    animals: air,
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      air.add(data);
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildTarget({
    required BuildContext context,
    required List<AnswerText> animals,
    required DragTargetAccept<AnswerText> onAccept,
  }) =>
      Container(
        width: MediaQuery.of(context).size.width * 0.1,
        height: 30,
        color: Colors.blue,
        child: DragTarget<AnswerText>(
          builder: (context, candidateData, rejectedData) => Stack(
            children: [
              ...animals
                  .map((animal) => DraggableWidget(animal: animal))
                  .toList(),
            ],
          ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            onAccept(data);
          },
        ),
      );

  Widget buildText(String text) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 12,
          )
        ]),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
