import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/draggable_widget.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/text_question_widget.dart';

class QuizDragDropWidget extends StatefulWidget {
  final int questionIndex;
  final String question;
  final int score;
  final List<dynamic> usersAnswers;
  late List<dynamic>? listQuestionBody;
  bool? questionWithImages;
  String? image;
  String? bgImage;
  bool? listQuestionWIthImages = false;
  List<DragWordsWidget>? dragWordsList;
  double? bgWidth;
  double? bgHeight;
  double? imageWidth;
  double? imageHeight;

  final List<Answers> answers;

  QuizDragDropWidget({
    Key? key,
    required this.answers,
    required this.score,
    required this.question,
    required this.questionIndex,
    this.image,
    this.listQuestionBody,
    this.bgHeight,
    this.bgWidth,
    this.imageHeight,
    this.imageWidth,
    this.bgImage,
    this.listQuestionWIthImages,
    this.questionWithImages = false,
    this.dragWordsList,
    required this.usersAnswers,
  }) : super(key: key);

  @override
  _QuizDragDropWidgetState createState() => _QuizDragDropWidgetState();
}

class _QuizDragDropWidgetState extends State<QuizDragDropWidget> {
  @override
  void initState() {
    super.initState();
  }

  late List<dynamic> correctAnswers;
  // late List<dynamic> listQuestionBody;
  // late List<Map<String, dynamic>> listQuestionWIthImages;
  // late List<DragWordsWidget> dragWordsList;

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

    // QuizData.userAnswer1ForQ3
    //     .removeWhere((answer) => answer.text == toRemove.text);
    // QuizData.userAnswer2ForQ3
    //     .removeWhere((answer) => answer.text == toRemove.text);
    // QuizData.userAnswer3ForQ3
    //     .removeWhere((answer) => answer.text == toRemove.text);
    // QuizData.userAnswer4ForQ3
    //     .removeWhere((answer) => answer.text == toRemove.text);
    // QuizData.userAnswer5ForQ3
    //     .removeWhere((answer) => answer.text == toRemove.text);
    // QuizData.userAnswer6ForQ3
    //     .removeWhere((answer) => answer.text == toRemove.text);
    // QuizData.userAnswer7ForQ3
    //     .removeWhere((answer) => answer.text == toRemove.text);
    // QuizData.userAnswer8ForQ3
    //     .removeWhere((answer) => answer.text == toRemove.text);
  }

  @override
  void didChangeDependencies() {
    print(widget.questionIndex);

    if (widget.questionIndex == 8) {
      // correctAnswers = QuizData.correctAnswersForQ3;
      // usersAnswers = QuizData.usersAnswersForQ3;
      // listQuestionBody = QuizData.listQuestionBody8;
    } else {
      // correctAnswers = QuizData.correctAnswersForQ7;
      // usersAnswers = QuizData.usersAnswersForQ7;

      // listQuestionBody = QuizData.listQuestionBody7;

      // listQuestionWIthImages = QuizData.listQuestion11WithImages;
      // dragWordsList = QuizData.dragWordsWidget3;
      correctAnswers = QuizData.correctAnswersForQ7;

      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                HW.getWidth(24, context),
                HW.getHeight(24, context),
                HW.getWidth(24, context),
                HW.getHeight(5, context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width:
                            constraints.maxWidth - HW.getWidth(24, context) * 2,
                        child: Text(
                          widget.question,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(fontSize: HW.getHeight(24, context)),
                        ),
                      ),
                      // Text(
                      //   '*helper text',
                      //   style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      //       fontSize: HW.getHeight(12, context),
                      //       color: AppColors.grey),
                      // ),
                    ],
                  )
                ],
              ),
            ),
            AbsorbPointer(
              absorbing: QuizData.showRightAnswers,
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: HW.getWidth(24, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: HW.getWidth(800, context),
                        height: HW.getHeight(50, context),
                        margin: EdgeInsets.only(
                            bottom: HW.getHeight(
                                !widget.questionWithImages! ? 63 : 10,
                                context)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.underlineInputBorderColor)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ...widget.answers
                                  .map(
                                    (answer) => InkWell(
                                      child: buildTarget(
                                        inTopContainer: true,
                                        questionWithImages:
                                            widget.questionWithImages!,
                                        context: context,
                                        answers: [answer],
                                        borderWidth: widget.bgWidth,
                                        onAccept: (data) => setState(() {
                                          // if (widget.answers.contains(
                                          //     Answers(value: 0, text: ''))) {
                                          // print("List ${widget.answers}");
                                          // //   }
                                          // print(data.text);
                                          removeAll(data);
                                          widget.answers.add(data);
                                        }),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        !widget.questionWithImages!
                            ? Padding(
                                padding: EdgeInsets.only(right: 30.0),
                                child: Image.asset(
                                  widget.image!,
                                  width: HW.getWidth(350, context),
                                  height: HW.getHeight(470, context),
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Container(),
                        Expanded(
                            child: !widget.questionWithImages!
                                ? Wrap(
                                    direction: Axis.horizontal,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: QuizData.showRightAnswers
                                        ? [
                                            ...widget.usersAnswers.map(
                                              (element) {
                                                if (element
                                                    is DragWordsWidget) {
                                                  return buildTarget(
                                                    borderWidth: widget.bgWidth,
                                                    questionWithImages: widget
                                                        .questionWithImages!,
                                                    correctAnswer:
                                                        element.correctAnswer,
                                                    context: context,
                                                    answers: element.answers,
                                                    onAccept: (data) =>
                                                        setState(() {
                                                      removeAll(data);
                                                      // print(data.text);
                                                      element.answers.add(data);
                                                    }),
                                                    isCorrect: element.isRight,
                                                  );
                                                } else if (element
                                                    is SizedBox) {
                                                  return SizedBox(height: 10);
                                                } else {
                                                  return TextQuestion(
                                                      text: element as String);
                                                }
                                              },
                                            )
                                          ]
                                        : [
                                            ...widget.listQuestionBody!
                                                .map((element) {
                                              if (element is DragWordsWidget) {
                                                return buildTarget(
                                                  borderWidth:
                                                      widget.bgWidth ?? 100,
                                                  questionWithImages: widget
                                                      .questionWithImages!,
                                                  isCorrect: element.isRight,
                                                  context: context,
                                                  answers: element.answers,
                                                  onAccept: (data) =>
                                                      setState(() {
                                                    removeAll(data);

                                                    if (element
                                                        .answers.isEmpty) {
                                                      element.answers.add(data);
                                                    } else {
                                                      widget.answers.add(
                                                          element.answers.last);
                                                      element.answers
                                                          .removeLast();
                                                      element.answers.add(data);
                                                    }
                                                    if (widget
                                                        .answers.isEmpty) {
                                                      widget.answers
                                                          .add(Answers(
                                                        value: data.value,
                                                        text: '',
                                                      ));
                                                    }
                                                  }),
                                                );
                                              }else if (element
                                                    is SizedBox) {
                                                  return SizedBox(width: HW.getWidth(400, context) , height:HW.getHeight(50, context));
                                                } 

                                              // else if (element is SizedBox) {
                                              //   return SizedBox();
                                              // }

                                              else {
                                                return TextQuestion(
                                                    text: element as String);
                                              }
                                            }),
                                          ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: !QuizData.showRightAnswers
                                        ? [
                                            ...widget.listQuestionBody!
                                                .map((e) => Container(
                                                      width: HW.getWidth(
                                                          223, context),
                                                      height: HW.getHeight(
                                                          490, context),
                                                      child: Column(
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                widget.bgImage!,
                                                                fit: BoxFit
                                                                    .cover,
                                                                //  width: HW.getWidth(230, context),
                                                                height: HW.getHeight(
                                                                    widget
                                                                        .bgHeight!,
                                                                    context),
                                                                width: HW.getWidth(
                                                                    widget
                                                                        .bgWidth!,
                                                                    context),
                                                              ),
                                                              Image.asset(
                                                                e["image"]
                                                                    .toString(),
                                                                width: HW.getWidth(
                                                                    widget
                                                                        .imageWidth!,
                                                                    context),
                                                                height: HW.getHeight(
                                                                    widget
                                                                        .imageHeight!,
                                                                    context),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ],
                                                          ),
                                                          buildTarget(
                                                              isCorrect: widget
                                                                  .dragWordsList![widget
                                                                      .listQuestionBody!
                                                                      .indexOf(
                                                                          e)]
                                                                  .isRight,
                                                              context: context,
                                                              questionWithImages:
                                                                  widget
                                                                      .questionWithImages!,
                                                              answers: widget
                                                                  .dragWordsList![widget
                                                                      .listQuestionBody!
                                                                      .indexOf(
                                                                          e)]
                                                                  .answers,
                                                              onAccept:
                                                                  (data) =>
                                                                      setState(
                                                                          () {
                                                                        removeAll(
                                                                            data);
                                                                        if (widget
                                                                            .dragWordsList![widget.listQuestionBody!.indexOf(e)]
                                                                            .answers
                                                                            .isEmpty) {
                                                                          widget
                                                                              .dragWordsList![widget.listQuestionBody!.indexOf(e)]
                                                                              .answers
                                                                              .add(data);
                                                                        } else {
                                                                          widget.answers.add(widget
                                                                              .dragWordsList![widget.listQuestionBody!.indexOf(e)]
                                                                              .answers
                                                                              .last);
                                                                          widget
                                                                              .dragWordsList![widget.listQuestionBody!.indexOf(e)]
                                                                              .answers
                                                                              .removeLast();
                                                                          widget
                                                                              .dragWordsList![widget.listQuestionBody!.indexOf(e)]
                                                                              .answers
                                                                              .add(data);
                                                                        }
                                                                        if (widget
                                                                            .answers
                                                                            .isEmpty) {
                                                                          widget
                                                                              .answers
                                                                              .add(Answers(
                                                                            value:
                                                                                data.value,
                                                                            text:
                                                                                '',
                                                                          ));
                                                                        }
                                                                      }),
                                                              borderWidth:
                                                                  widget
                                                                      .bgWidth),
                                                          Container(
                                                            width: HW.getWidth(
                                                                220, context),
                                                            child: Text(
                                                              e["text"]
                                                                  .toString(),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText2!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize: HW
                                                                        .getHeight(
                                                                            16,
                                                                            context),
                                                                  ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                          ]
                                        : [
                                            ...widget.listQuestionBody!
                                                .map((e) => Container(
                                                      width: HW.getWidth(
                                                          223, context),
                                                      height: HW.getHeight(
                                                          490, context),
                                                      child: Column(
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                widget.bgImage!,
                                                                fit: BoxFit
                                                                    .cover,
                                                                //  width: HW.getWidth(230, context),
                                                                height: HW.getHeight(
                                                                    widget
                                                                        .bgHeight!,
                                                                    context),
                                                                width: HW.getWidth(
                                                                    widget
                                                                        .bgWidth!,
                                                                    context),
                                                              ),
                                                              Image.asset(
                                                                e["image"]
                                                                    .toString(),
                                                                width: HW.getWidth(
                                                                    widget
                                                                        .imageWidth!,
                                                                    context),
                                                                height: HW.getHeight(
                                                                    widget
                                                                        .imageHeight!,
                                                                    context),
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ],
                                                          ),
                                                          buildTarget(
                                                              isCorrect: widget
                                                                      .usersAnswers![widget
                                                                          .listQuestionBody!
                                                                          .indexOf(
                                                                              e)]
                                                                      .isRight
                                                                  as bool,
                                                              context: context,
                                                              questionWithImages:
                                                                  widget
                                                                      .questionWithImages!,
                                                              answers: widget
                                                                  .dragWordsList![widget
                                                                      .listQuestionBody!
                                                                      .indexOf(
                                                                          e)]
                                                                  .answers,
                                                              onAccept:
                                                                  (data) =>
                                                                      setState(
                                                                          () {
                                                                        removeAll(
                                                                            data);
                                                                      }),
                                                              borderWidth:
                                                                  widget
                                                                      .bgWidth),
                                                          Container(
                                                            width: HW.getWidth(
                                                                220, context),
                                                            child: Text(
                                                              e["text"]
                                                                  .toString(),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText2!
                                                                  .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize: HW
                                                                        .getHeight(
                                                                            16,
                                                                            context),
                                                                  ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                          ])),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Visibility(
            //   visible: QuizData.showRightAnswers,
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 100),
            //     padding: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: AppColors.black100, width: 1),
            //     ),
            //     child: Wrap(
            //       direction: Axis.horizontal,
            //       children: [
            //         ...correctAnswers.map((element) {
            //           if (element is List<String>) {
            //             return Text(
            //               element.first,
            //               style: TextStyle(
            //                   decoration: TextDecoration.underline,
            //                   fontSize: TextFontSize.getHeight(35, context)),
            //             );
            //           } else {
            //             return Text(
            //               element as String,
            //               style: TextStyle(
            //                   fontSize: TextFontSize.getHeight(35, context)),
            //             );
            //           }
            //         })
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      );
    });
  }
}

Widget _buildCheckdTarget({
  required Answers answers,
  required bool? isCorrect,
  required String? correctAnswer,
  required BuildContext context,
}) {
  return Container(
    width: HW.getWidth(100, context),
    decoration: const BoxDecoration(
      // color: AppColors.red,
      border: Border(
        bottom:
            BorderSide(width: 1, color: AppColors.underlineInputBorderColor),
      ),
      // color: inTopContainer ? null : AppColors.white,
    ),
    child: Container(
        child: answers.text == ""
            ? Column(
                children: [
                  Text(
                    correctAnswer ?? "undefined",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.blueDeep,
                        fontSize: TextFontSize.getHeight(12, context)),
                  ),
                  Text(
                    '*empty*',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.red,
                        fontSize: TextFontSize.getHeight(12, context),
                        decoration: TextDecoration.lineThrough),
                  )
                ],
              )
            : Column(
                children: [
                  Text(
                    correctAnswer ?? "undefined",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.blueDeep,
                        fontSize: TextFontSize.getHeight(12, context)),
                  ),
                  Text(
                    answers.text!,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.red,
                        fontSize: TextFontSize.getHeight(16, context),
                        decoration: TextDecoration.lineThrough),
                  )
                ],
              )),
  );
}

List<String> gettedCorectAnswers = [];
Widget buildTarget({
  bool inTopContainer = false,
  bool questionWithImages = false,
  bool? isCorrect,
  String? correctAnswer,
  required BuildContext context,
  required List<Answers> answers,
  List<CorrectAnswers>? correctAnswers,
  required DragTargetAccept<Answers> onAccept,
  double? borderWidth = 100,
}) {
  return isCorrect != null && isCorrect == false
      ? Stack(
          children: answers
              .map((answer) => _buildCheckdTarget(
                    correctAnswer: correctAnswer,
                    answers: answer,
                    isCorrect: isCorrect,
                    context: context,
                  ))
              .toList(),
        )
      : Container(
          margin: !inTopContainer && questionWithImages
              ? const EdgeInsets.symmetric(vertical: 10)
              : EdgeInsets.zero,
          //  padding:!inTopContainer && !questionWithImages ? EdgeInsets.only(bottom: 40) : null,
          decoration: BoxDecoration(
              border: !inTopContainer && !questionWithImages
                  ? Border(
                      bottom: BorderSide(
                          width: 1, color: AppColors.underlineInputBorderColor),
                    )
                  : !inTopContainer && questionWithImages
                      ? Border.all(color: AppColors.underlineInputBorderColor)
                      : null

              //
              //

              //   ),
              // color: inTopContainer ? null : AppColors.white,
              ),
          width:
              inTopContainer ? null : HW.getWidth(borderWidth ?? 100, context),
          height: inTopContainer || questionWithImages
              ? HW.getHeight(30, context)
              : HW.getHeight(25, context),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            child: DragTarget<Answers>(
              builder: (context, candidateData, rejectedData) => Stack(
                children: answers
                    .map((answer) => DraggableWidget(
                          correctAnswer: correctAnswer,
                          answers: answer,
                          isCorrect: isCorrect,
                        ))
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
          ),
        );
}
