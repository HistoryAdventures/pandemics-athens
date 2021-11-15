import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/styles.dart';

class QuizRadioBottonWidget extends StatefulWidget {
  bool? quizWithImage = false;

  final int questionIndex;
  final String question;

  final List<Answers<int>> answers;

  QuizRadioBottonWidget(
      {Key? key,
      this.quizWithImage,
      required this.answers,
      required this.question,
      required this.questionIndex})
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
                child: Text(
                  widget.question,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: TextFontSize.getHeight(24, context)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: HW.getWidth(48, context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.quizWithImage!,
                      child: Container(
                          margin: EdgeInsets.only(
                            right: HW.getWidth(48, context),
                          ),
                          height: HW.getHeight(369, context),
                          width: HW.getWidth(277, context),
                          child: Image.asset(
                            AssetsPath.imageQuizPericles,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Flexible(
                      child: AbsorbPointer(
                        absorbing: QuizData.showRightAnswers,
                        child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: widget.answers
                                  .map((e) => Container(
                                        padding: EdgeInsets.only(
                                            right: HW.getHeight(10, context)),
                                        margin: EdgeInsets.only(
                                            bottom: HW.getHeight(24, context)),
                                        decoration: QuizData.showRightAnswers &&
                                                e.value == 4
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
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Radio(
                                              value: e.value,
                                              groupValue:
                                                  widget.questionIndex == 5
                                                      ? QuizData.valueQ5
                                                      : QuizData.valueQ6,
                                              onChanged:
                                                  widget.questionIndex == 5
                                                      ? (int? value) {
                                                          setState(() {
                                                            QuizData.valueQ5 =
                                                                value!;
                                                          });
                                                        }
                                                      : (int? value) {
                                                          setState(() {
                                                            QuizData.valueQ6 =
                                                                value!;
                                                          });
                                                        },
                                              activeColor: AppColors.orange,
                                            ),
                                            Text(
                                              e.text,
                                              maxLines: 1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                      fontSize: HW.getHeight(
                                                          16, context)),
                                            ),
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
