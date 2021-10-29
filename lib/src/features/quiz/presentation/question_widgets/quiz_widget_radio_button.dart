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
          margin: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.05,
            vertical: 100,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                    Flexible(
                      child: AbsorbPointer(
                        absorbing: QuizData.showRightAnswers,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: widget.answers
                                .map((e) => Flexible(
                                      child: Container(
                                        width: 200,
                                        margin: const EdgeInsets.all(12),
                                        decoration: QuizData.showRightAnswers &&
                                                e.value == 4
                                            ? DottedDecoration(
                                                shape: Shape.box,
                                                strokeWidth: 1,
                                                color: AppColors.greyDeep)
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
                                              activeColor: AppColors.blueDeep,
                                            ),
                                            Flexible(child: Text(e.text)),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList()),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                  visible: widget.quizWithImage!,
                  child: Image.asset(AssetsPath.imageQuizPericles),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
