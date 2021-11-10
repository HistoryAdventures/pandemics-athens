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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                HW.getWidth(24, context),
                HW.getHeight(24, context),
                HW.getWidth(24, context),
                HW.getHeight(36, context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.question,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(fontSize: HW.getHeight(24, context)),
                      ),
                      Text(
                        '*helper text',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: HW.getHeight(12, context),
                            color: AppColors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            AbsorbPointer(
              absorbing: QuizData.showRightAnswers,
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: HW.getWidth(72, context)),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  direction: Axis.horizontal,
                  children: QuizData.showRightAnswers
                      ? [
                          ...QuizData.usersAnswersForQ2.map((element) {
                            if (element is EditTextWidget) {
                              return Container(
                                width: HW.getWidth(120, context),
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
                                  rightAnswer: element.correctAnswer,
                                ),
                              );
                            } else {
                              return TextQuestion(text: element as String);
                            }
                          })
                        ]
                      : [
                          ...QuizData.listQuestionBody2.map((element) {
                            if (element is EditTextWidget) {
                              return Container(
                                width: HW.getWidth(120, context),
                                child: CustumInput(
                                  controller: element.controller,
                                  hintText: '',
                                  onSaved: (v) => userAnswer.add(v!),
                                  rightAnswer: element.correctAnswer,
                                  // validator: (v) => v!.isEmpty
                                  //     ? "Email is required!"
                                  //     : StringUtils.isEmail(v)
                                  //         ? null
                                  //         : "Invalid email",
                                ),
                              );
                            } else {
                              return TextQuestion(text: element as String);
                            }
                          })
                        ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
