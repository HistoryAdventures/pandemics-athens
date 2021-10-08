import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
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
  void initState() {
    super.initState();
  }

  void removeAll(Answers toRemove) {
    widget.answers.removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer1ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer2ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer3ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer4ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer5ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer6ForQ7
        .removeWhere((answer) => answer.text == toRemove.text);

    QuizData.userAnswer1ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer2ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer3ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer4ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer5ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer6ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer7ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
    QuizData.userAnswer8ForQ3
        .removeWhere((answer) => answer.text == toRemove.text);
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
                      children: QuizData.showRightAnswers
                          ? [
                              ...QuizData.usersAnswersForQ3.map(
                                (element) {
                                  if (element is DragWordsWidget) {
                                    return buildTarget(
                                      context: context,
                                      answers: element.answers,
                                      onAccept: (data) => setState(() {
                                        removeAll(data);
                                        element.answers.add(data);
                                      }),
                                      isCorrect: element.isRight,
                                    );
                                  } else {
                                    return TextQuestion(
                                        text: element as String);
                                  }
                                },
                              )
                            ]
                          : [
                              ...QuizData.listQuestionBody3.map((element) {
                                if (element is DragWordsWidget) {
                                  return buildTarget(
                                    context: context,
                                    answers: element.answers,
                                    onAccept: (data) => setState(() {
                                      removeAll(data);
                                      element.answers.add(data);
                                    }),
                                  );
                                } else {
                                  return TextQuestion(text: element as String);
                                }
                              })
                            ],
                    ),

                  // Wrap(
                  //   direction: Axis.horizontal,
                  //   crossAxisAlignment: WrapCrossAlignment.start,
                  //   children: <Widget>[
                  //     const TextQuestion(
                  //         text:
                  //             'In the 5th century BC, Athens was a democracy. It was not a monarchy, ruled by a '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer1ForQ3,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer1ForQ3.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(
                  //         text:
                  //             ', nor was it ruled by a small band of aritocrats (an '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer2ForQ3,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer2ForQ3.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(
                  //         text:
                  //             '). Instead, the people represented themselves.\n Democracy derives from two Greek words '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer3ForQ3,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer3ForQ3.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(
                  //         text: ' meaning people, and kratos, which means '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer4ForQ3,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer4ForQ3.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(
                  //         text:
                  //             'Athenian democracy was very different to modern democracy, however. Only adult male '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer5ForQ3,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer5ForQ3.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(text: ' could take part. '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer6ForQ3,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer6ForQ3.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(text: ' could take part. '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer7ForQ3,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer7ForQ3.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(text: ' and non-Athenians '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer8ForQ3,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer8ForQ3.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(text: ' were excluded. '),
                  //   ],
                  // ),

                  if (widget.questionIndex == 7)
                    Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: QuizData.listQuestionBody7.map((element) {
                        if (element is DragWordsWidget) {
                          return buildTarget(
                            context: context,
                            answers: element.answers,
                            onAccept: (data) => setState(() {
                              removeAll(data);
                              element.answers.add(data);
                            }),
                          );
                        } else {
                          return TextQuestion(text: element as String);
                        }
                      }).toList(),
                    ),

                  // Wrap(
                  //   direction: Axis.horizontal,
                  //   crossAxisAlignment: WrapCrossAlignment.start,
                  //   children: <Widget>[
                  //     const TextQuestion(text: 'Galen was a  '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer1ForQ7,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer1ForQ7.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(
                  //         text:
                  //             ' doctor who was influenced by and developed the theories of '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer2ForQ7,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer2ForQ7.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(
                  //         text: '. He studied the body through '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer3ForQ7,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer3ForQ7.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(
                  //         text:
                  //             '. Because this was illegal, he encouraged his students to investigate the corpses of '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer4ForQ7,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer4ForQ7.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(text: '!\n'),
                  //     const TextQuestion(text: 'Galen also lived through a '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer5ForQ7,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer5ForQ7.add(data);
                  //       }),
                  //     ),
                  //     const TextQuestion(
                  //         text:
                  //             ' . His ideas were very influential, and were only challenged and developed during the '),
                  //     buildTarget(
                  //       context: context,
                  //       answers: QuizData.userAnswer6ForQ7,
                  //       onAccept: (data) => setState(() {
                  //         removeAll(data);
                  //         QuizData.userAnswer6ForQ7.add(data);
                  //       }),
                  //     ),
                  //   ],
                  // ),
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
  bool isCorrect = false,
  required BuildContext context,
  required List<Answers> answers,
  List<CorrectAnswers>? correctAnswers,
  required DragTargetAccept<Answers> onAccept,
}) =>
    Container(
      decoration: BoxDecoration(
        border: inTopContainer
            ? null
            : Border.all(color: isCorrect ? AppColors.green : AppColors.red),
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
