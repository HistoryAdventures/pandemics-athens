import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/draggable_widget.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/text_question_widget.dart';

class QuizDragDropWidget extends StatefulWidget {
  final int questionIndex;
  final String question;

  final List<Answers> answers;

  QuizDragDropWidget(
      {Key? key,
      required this.answers,
      required this.question,
      required this.questionIndex})
      : super(key: key);

  @override
  _QuizDragDropWidgetState createState() => _QuizDragDropWidgetState();
}

class _QuizDragDropWidgetState extends State<QuizDragDropWidget> {
  @override
  void dispose() {
    // print(answer1.first.text);
    // print(answer2.first.text);
    // print(answer3.first.text);
    // print(answer4.first.text);
    // print(answer5.first.text);
    // print(answer6.first.text);
    // print(answer7.first.text);
    // print(answer8.first.text);
    super.dispose();
  }

  final List<Answers> answer1 = [];
  final List<Answers> answer2 = [];
  final List<Answers> answer3 = [];
  final List<Answers> answer4 = [];
  final List<Answers> answer5 = [];
  final List<Answers> answer6 = [];
  final List<Answers> answer7 = [];
  final List<Answers> answer8 = [];

  @override
  void initState() {
    super.initState();
  }

  void removeAll(Answers toRemove) {
    widget.answers.removeWhere((answer) => answer.text == toRemove.text);
    answer1.removeWhere((answer) => answer.text == toRemove.text);
    answer2.removeWhere((answer) => answer.text == toRemove.text);
    answer3.removeWhere((answer) => answer.text == toRemove.text);
    answer4.removeWhere((answer) => answer.text == toRemove.text);
    answer5.removeWhere((answer) => answer.text == toRemove.text);
    answer6.removeWhere((answer) => answer.text == toRemove.text);
    answer7.removeWhere((answer) => answer.text == toRemove.text);
    answer8.removeWhere((answer) => answer.text == toRemove.text);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        margin: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.05,
          vertical: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: constraints.maxHeight * 0.01),
                child: Text(
                  'QUESTION ${widget.questionIndex}',
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              Text(
                widget.question,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: TextFontSize.getHeight(45, context)),
              ),
              Column(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      // padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blueDeep)),
                      child: Row(children: [
                        ...widget.answers
                            .map(
                              (answer) => Expanded(
                                child: buildTarget(
                                  inTopContainer: true,
                                  context: context,
                                  answers: [answer],
                                  onAccept: (data) => setState(() {
                                    removeAll(data);
                                    widget.answers.add(data);
                                    print(widget.answers);
                                  }),
                                ),
                              ),
                            )
                            .toList(),
                      ])),
                  const SizedBox(
                    height: 60,
                  ),
                  if (widget.questionIndex == 3)
                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: <Widget>[
                        const TextQuestion(
                            text:
                                'In the 5th century BC, Athens was a democracy. It was not a monarchy, ruled by a '),
                        buildTarget(
                          context: context,
                          answers: answer1,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer1.add(data);
                          }),
                        ),
                        const TextQuestion(
                            text:
                                ', nor was it ruled by a small band of aritocrats (an '),
                        buildTarget(
                          context: context,
                          answers: answer2,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer2.add(data);
                          }),
                        ),
                        const TextQuestion(
                            text:
                                '). Instead, the people represented themselves.\n Democracy derives from two Greek words '),
                        buildTarget(
                          context: context,
                          answers: answer3,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer3.add(data);
                          }),
                        ),
                        const TextQuestion(
                            text: ' meaning people, and kratos, which means '),
                        buildTarget(
                          context: context,
                          answers: answer4,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer4.add(data);
                          }),
                        ),
                        const TextQuestion(
                            text:
                                'Athenian democracy was very different to modern democracy, however. Only adult male '),
                        buildTarget(
                          context: context,
                          answers: answer5,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer5.add(data);
                          }),
                        ),
                        const TextQuestion(text: ' could take part. '),
                        buildTarget(
                          context: context,
                          answers: answer6,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer6.add(data);
                          }),
                        ),
                        const TextQuestion(text: ' could take part. '),
                        buildTarget(
                          context: context,
                          answers: answer7,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer7.add(data);
                          }),
                        ),
                        const TextQuestion(text: ' and non-Athenians '),
                        buildTarget(
                          context: context,
                          answers: answer8,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer8.add(data);
                          }),
                        ),
                        const TextQuestion(text: ' were excluded. '),
                      ],
                    ),
                  if (widget.questionIndex == 7)
                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: <Widget>[
                        const TextQuestion(text: 'Galen was a  '),
                        buildTarget(
                          context: context,
                          answers: answer1,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer1.add(data);
                          }),
                        ),
                        const TextQuestion(
                            text:
                                ' doctor who was influenced by and developed the theories of '),
                        buildTarget(
                          context: context,
                          answers: answer2,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer2.add(data);
                          }),
                        ),
                        const TextQuestion(
                            text: '. He studied the body through '),
                        buildTarget(
                          context: context,
                          answers: answer3,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer3.add(data);
                          }),
                        ),
                        const TextQuestion(
                            text:
                                '. Because this was illegal, he encouraged his students to investigate the corpses of '),
                        buildTarget(
                          context: context,
                          answers: answer4,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer4.add(data);
                          }),
                        ),
                        const TextQuestion(text: '!\n'),
                        const TextQuestion(text: 'Galen also lived through a '),
                        buildTarget(
                          context: context,
                          answers: answer5,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer5.add(data);
                          }),
                        ),
                        const TextQuestion(
                            text:
                                ' . His ideas were very influential, and were only challenged and developed during the '),
                        buildTarget(
                          context: context,
                          answers: answer6,
                          onAccept: (data) => setState(() {
                            removeAll(data);
                            answer6.add(data);
                          }),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

Widget buildTarget({
  bool inTopContainer = false,
  required BuildContext context,
  required List<Answers> answers,
  required DragTargetAccept<Answers> onAccept,
}) =>
    Container(
      decoration: BoxDecoration(
        border: inTopContainer ? null : Border.all(color: AppColors.blueDeep),
        boxShadow: inTopContainer
            ? null
            : const [
                BoxShadow(
                    blurRadius: 1,
                    offset: Offset(1, 1),
                    color: AppColors.black25),
              ],
        borderRadius: inTopContainer ? null : BorderRadius.circular(5),
        color: inTopContainer ? null : AppColors.white,
      ),
      width: inTopContainer ? null : 100,
      height: 30,
      child: DragTarget<Answers>(
        builder: (context, candidateData, rejectedData) => Stack(
          children: answers
              .map((answer) => DraggableWidget(answers: answer))
              .toList(),
        ),
        onWillAccept: (data) => true,
        onAccept: (data) {
          //    print(data.text);
          onAccept(data);
        },
        onLeave: (data) {
          //  print(data);
        },
      ),
    );
