import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import '../../../../core/utils/styles.dart';
import 'custom_widgets/inputs.dart';
import 'custom_widgets/text_question_widget.dart';

class QuizEditTextWidget extends StatefulWidget {
  final int questionIndex;
  final String question;
  const QuizEditTextWidget({
    Key? key,
    required this.question,
    required this.questionIndex,
  }) : super(key: key);

  @override
  _QuizEditTextWidgetState createState() => _QuizEditTextWidgetState();
}

class _QuizEditTextWidgetState extends State<QuizEditTextWidget> {
  late AppLocalizations locals;

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  final _formStateSingIn = GlobalKey<FormState>();

  void onSave() {
    if (!_formStateSingIn.currentState!.validate()) {
      return;
    }
    _formStateSingIn.currentState?.save();
  }

  List<String> userAnswer = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.05,
          vertical: 100,
        ),
        child: SingleChildScrollView(
          child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          widget.question,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  fontSize:
                                      TextFontSize.getHeight(24, context)),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: AbsorbPointer(
                    absorbing: QuizData.showRightAnswers,
                    child: Container(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        direction: Axis.horizontal,
                        children: QuizData.showRightAnswers
                            ? [
                                ...QuizData.usersAnswersForQ2.map((element) {
                                  if (element is EditTextWidget) {
                                    return Container(
                                      width: 120,
                                      child: CustumInput(
                                        controller: element.controller,
                                        hintText: '',
                                        onSaved: (v) => userAnswer.add(v!),
                                        // validator: (v) => v!.isEmpty
                                        //     ? "Email is required!"
                                        //     : StringUtils.isEmail(v)
                                        //         ? null
                                        //         : "Invalid email",
                                        isCorrect: element.isRight,
                                      ),
                                    );
                                  } else {
                                    return TextQuestion(
                                        text: element as String);
                                  }
                                })
                              ]
                            : [
                                ...QuizData.listQuestionBody2.map((element) {
                                  if (element is EditTextWidget) {
                                    return Container(
                                      width: 120,
                                      child: CustumInput(
                                        controller: element.controller,
                                        hintText: '',
                                        onSaved: (v) => userAnswer.add(v!),
                                        // validator: (v) => v!.isEmpty
                                        //     ? "Email is required!"
                                        //     : StringUtils.isEmail(v)
                                        //         ? null
                                        //         : "Invalid email",
                                      ),
                                    );
                                  } else {
                                    return TextQuestion(
                                        text: element as String);
                                  }
                                })
                              ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: QuizData.showRightAnswers,
                  child: Container(
                    margin: const EdgeInsets.only(top: 100),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black100, width: 1),
                    ),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        ...QuizData.correctAnswersForQ2.map((element) {
                          if (element is List<String>) {
                            return Text(
                              element.first,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize:
                                      TextFontSize.getHeight(35, context)),
                            );
                          } else {
                            return Text(
                              element as String,
                              style: TextStyle(
                                  fontSize:
                                      TextFontSize.getHeight(35, context)),
                            );
                          }
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
