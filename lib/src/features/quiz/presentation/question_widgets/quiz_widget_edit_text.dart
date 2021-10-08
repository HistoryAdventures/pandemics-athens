import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import '../../../../core/utils/styles.dart';
import 'custom_widgets/inputs.dart';
import 'custom_widgets/text_question_widget.dart';

class QuizEditTextWidget extends StatefulWidget {
  final int questionIndex;
  const QuizEditTextWidget({Key? key, required this.questionIndex})
      : super(key: key);

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

  void onSignIn() {
    if (!_formStateSingIn.currentState!.validate()) {
      return;
    }
    _formStateSingIn.currentState?.save();
  }

  @override
  void dispose() {
    QuizData.userAnswerText1 =
        QuizData.answerTextController1.text.toLowerCase();
    QuizData.userAnswerText2 =
        QuizData.answerTextController2.text.toLowerCase();
    QuizData.userAnswerText3 =
        QuizData.answerTextController3.text.toLowerCase();
    QuizData.userAnswerText4 =
        QuizData.answerTextController4.text.toLowerCase();
    QuizData.userAnswerText5 =
        QuizData.answerTextController5.text.toLowerCase();
    QuizData.userAnswerText6 =
        QuizData.answerTextController6.text.toLowerCase();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.05,
          vertical: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.01),
              child: Text(
                'QUESTION ${widget.questionIndex}',
                style: Theme.of(context).textTheme.button,
              ),
            ),
            Text(
              locals.question2,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(fontSize: TextFontSize.getHeight(45, context)),
            ),
            Flexible(
              child: Container(
                //  color: Colors.blue,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    ...QuizData.listQuestionBody2.map((element) {
                      if (element is EditText) {
                        return CustumInput(
                          controller: element.controller,
                          hintText: '',
                          onSaved: (v) => element.userAnswer = v!,
                          // validator: (v) => v!.isEmpty
                          //     ? "Email is required!"
                          //     : StringUtils.isEmail(v)
                          //         ? null
                          //         : "Invalid email",
                          obscureText: false,
                        );
                      } else {
                        return TextQuestion(text: element as String);
                      }
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
