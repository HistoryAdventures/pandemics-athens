import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/check_box_width_radio_logic.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/styles.dart';
import 'custom_widgets/check_box.dart';

class QuizRadioBottonWidget extends StatefulWidget {
  bool? quizWithImage = false;
  String? image;
  final int questionIndex;
  final String question;
  final bool boldWords;
  String? bgImage;
  final List<bool> quizDataChecking;
  String? boldQuestionText;

  final List<Answers<int>> answers;

  QuizRadioBottonWidget(
      {Key? key,
      this.quizWithImage,
      required this.answers,
      required this.question,
      required this.questionIndex,
      this.boldWords = false,
      this.bgImage,
      required this.quizDataChecking,
      this.boldQuestionText,
      this.image})
      : super(key: key);

  @override
  _QuizRadioBottonWidgetState createState() => _QuizRadioBottonWidgetState();
}

class _QuizRadioBottonWidgetState extends State<QuizRadioBottonWidget> {
  @override
  void dispose() {
    // print(val);
    super.dispose();
  }

  List<String> names = [];
  List<String> texts = [];

  @override
  void initState() {
    widget.answers.forEach((element) {
      for (var i = 0; i < element.text!.length; i++) {
        if (element.text![i] == ",") {
          names.add(element.text!.substring(0, i));
          texts.add(element.text!.substring(i, element.text!.length));
          break;
        }
      }
    });
    super.initState();
  }
  // bool _value = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: QuizData.showRightAnswers,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(HW.getWidth(24, context),
                      HW.getHeight(24, context), 0, HW.getHeight(36, context)),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: widget.question,
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: TextFontSize.getHeight(24, context)),
                      ),
                      TextSpan(
                          text: widget.boldQuestionText ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      TextFontSize.getHeight(24, context)))
                    ]),
                  )),
              Container(
                margin: EdgeInsets.only(
                  left: HW.getWidth(24, context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.quizWithImage!,
                      child: Container(
                        padding:
                            EdgeInsets.only(bottom: HW.getHeight(100, context)),
                        margin: EdgeInsets.only(
                          right: HW.getWidth(48, context),
                        ),
                        height: HW.getHeight(560, context),
                        width: HW.getWidth(550, context),
                        //  width: HW.getWidth(277, context),
                        child: widget.bgImage != null
                            ? Stack(
                                // alignment: AlignmentDirectional.center,
                                children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        widget.bgImage!,
                                        fit: BoxFit.fitWidth,
                                        height: HW.getHeight(500, context),
                                        width: HW.getWidth(500, context),
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Image.asset(
                                        widget.image!,
                                        fit: BoxFit.fitHeight,
                                        height: HW.getHeight(400, context),
                                        // height: HW.getHeight(400, context),
                                        //   width: HW.getWidth(400, context),

                                        // width: HW.getWidth(600, context)
                                      ),
                                    ),
                                  ])
                            : Image.asset(
                                widget.image!,
                                fit: BoxFit.cover,
                                // width: HW.getWidth(600, context)
                              ),
                      ),
                    ),
                    Flexible(
                      child: AbsorbPointer(
                        absorbing: QuizData.showRightAnswers,
                        child: Container(
                          width: HW.getWidth(600, context),
                          height: HW.getHeight(500, context),
                          child: ListView(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.min,
                              children: widget.answers
                                  .map((e) => Container(
                                        padding: EdgeInsets.only(
                                            right: HW.getHeight(10, context)),
                                        margin: EdgeInsets.only(
                                            bottom: HW.getHeight(24, context)),
                                        decoration: QuizData.showRightAnswers &&
                                                e.isCorrect == true
                                            ? BoxDecoration(
                                                color: AppColors.white,
                                                border: Border.all(
                                                    color: AppColors
                                                        .underlineInputBorderColor,
                                                    width: 0.5),
                                                boxShadow: Shadows.quizShadows,
                                              )
                                            : null,
                                        child: Row(
                                          // mainAxisSize: MainAxisSize.min,
                                          children: [
                                            // Radio(

                                            //   value: e.value,
                                            //   groupValue:
                                            //       widget.questionIndex == 5
                                            //           ? QuizData.valueQ5
                                            //           : QuizData.valueQ6,
                                            //   onChanged:
                                            //       widget.questionIndex == 5
                                            //           ? (int? value) {
                                            //               setState(() {
                                            //                 QuizData.valueQ5 =
                                            //                     value!;
                                            //               });
                                            //             }
                                            //           : (int? value) {
                                            //               setState(() {
                                            //                 QuizData.valueQ6 =
                                            //                     value!;
                                            //               });
                                            //             },
                                            //   activeColor: AppColors.orange,
                                            // ),
                                            AbsorbPointer(
                                              absorbing:
                                                  QuizData.showRightAnswers,
                                              child: CheckBoxTextWithRadioLogic(
                                                isCorrect:
                                                    widget.quizDataChecking[
                                                                widget
                                                                    .answers
                                                                    .indexOf(
                                                                        e)] ==
                                                            true
                                                        ? e.isCorrect == true
                                                        : null,
                                                value: widget.quizDataChecking[
                                                    widget.answers.indexOf(e)],
                                                onTap: (val) {
                                                  if (val) {
                                                    AudioPlayerUtil()
                                                        .playQuizSound(
                                                            AssetsPath
                                                                .quizQlick);
                                                    if (widget.quizDataChecking
                                                        .contains(true)) {
                                                      widget.quizDataChecking[
                                                          widget
                                                              .quizDataChecking
                                                              .indexOf(
                                                                  true)] = false;
                                                    }

                                                    widget.quizDataChecking[
                                                        widget.answers
                                                            .indexOf(e)] = true;
                                                  } else {}
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Container(
                                                width:
                                                    HW.getWidth(470, context),
                                                child: widget.boldWords
                                                    ? RichText(
                                                        text:
                                                            TextSpan(children: <
                                                                TextSpan>[
                                                          TextSpan(
                                                            text: names[widget
                                                                    .answers
                                                                    .indexOf(e)]
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1
                                                                ?.copyWith(
                                                                    fontSize: HW
                                                                        .getHeight(
                                                                      16,
                                                                      context,
                                                                    ),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                          TextSpan(
                                                            text: texts[widget
                                                                    .answers
                                                                    .indexOf(e)]
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1
                                                                ?.copyWith(
                                                                  fontSize: HW
                                                                      .getHeight(
                                                                    16,
                                                                    context,
                                                                  ),
                                                                ),
                                                          )
                                                        ]),
                                                      )
                                                    : Text(
                                                        e.text!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1
                                                            ?.copyWith(
                                                              fontSize:
                                                                  HW.getHeight(
                                                                16,
                                                                context,
                                                              ),
                                                            ),
                                                      )),
                                          ],
                                        ),
                                      ))
                                  .toList()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
