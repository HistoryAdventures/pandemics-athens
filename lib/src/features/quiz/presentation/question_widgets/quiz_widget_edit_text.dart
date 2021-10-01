import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/inputs.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/text_question_widget.dart';

class QuizEditTextWidget extends StatefulWidget {
  const QuizEditTextWidget({Key? key}) : super(key: key);

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

  final TextEditingController _answerTextController1 = TextEditingController();
  final TextEditingController _answerTextController2 = TextEditingController();

  final TextEditingController _answerTextController3 = TextEditingController();

  final TextEditingController _answerTextController4 = TextEditingController();

  final TextEditingController _answerTextController5 = TextEditingController();

  final TextEditingController _answerTextController6 = TextEditingController();

  final _formStateSingIn = GlobalKey<FormState>();

  String _answerText1 = '';
  String _answerText2 = '';
  String _answerText3 = '';
  String _answerText4 = '';
  String _answerText5 = '';
  String _answerText6 = '';
  void onSignIn() {
    if (!_formStateSingIn.currentState!.validate()) {
      return;
    }
    _formStateSingIn.currentState?.save();
  }

  @override
  void dispose() {
    _answerText1 = _answerTextController1.text;
    _answerText2 = _answerTextController2.text;
    _answerText3 = _answerTextController3.text;
    _answerText4 = _answerTextController4.text;
    _answerText5 = _answerTextController5.text;
    _answerText6 = _answerTextController6.text;

    print(_answerText1);
    print(_answerText2);
    print(_answerText3);
    print(_answerText4);
    print(_answerText5);
    print(_answerText6);
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
                'QUESTION 2',
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
                    const TextQuestion(
                        text:
                            'Hippocrates suggested that the body contained four'),
                    CustumInput(
                      controller: _answerTextController1,
                      hintText: '',
                      onSaved: (v) => _answerText1 = v!,
                      // validator: (v) => v!.isEmpty
                      //     ? "Email is required!"
                      //     : StringUtils.isEmail(v)
                      //         ? null
                      //         : "Invalid email",
                      obscureText: false,
                    ),
                    const TextQuestion(
                      text:
                          '. These were vital bodily fluids that kept people healthy if they were kept',
                    ),
                    CustumInput(
                      controller: _answerTextController2,
                      hintText: '',
                      onSaved: (v) => _answerText2 = v!,
                      // validator: (v) => v!.isEmpty
                      //     ? "Email is required!"
                      //     : StringUtils.isEmail(v)
                      //         ? null
                      //         : "Invalid email",
                      obscureText: false,
                    ),
                    const TextQuestion(
                      text: '. They are: blood,',
                    ),
                    CustumInput(
                      controller: _answerTextController3,
                      hintText: '',
                      onSaved: (v) => _answerText3 = v!,
                      // validator: (v) => v!.isEmpty
                      //     ? "Email is required!"
                      //     : StringUtils.isEmail(v)
                      //         ? null
                      //         : "Invalid email",
                      obscureText: false,
                    ),
                    const TextQuestion(
                      text: ',',
                    ),
                    CustumInput(
                      controller: _answerTextController4,
                      hintText: '',
                      onSaved: (v) => _answerText4 = v!,
                      // validator: (v) => v!.isEmpty
                      //     ? "Email is required!"
                      //     : StringUtils.isEmail(v)
                      //         ? null
                      //         : "Invalid email",
                      obscureText: false,
                    ),
                    const TextQuestion(
                      text: 'bile, yellow',
                    ),
                    CustumInput(
                      controller: _answerTextController5,
                      hintText: '',
                      onSaved: (v) => _answerText5 = v!,
                      // validator: (v) => v!.isEmpty
                      //     ? "Email is required!"
                      //     : StringUtils.isEmail(v)
                      //         ? null
                      //         : "Invalid email",
                      obscureText: false,
                    ),
                    const TextQuestion(
                      text:
                          'A person became sick if they had too much, or not enough, of one of these fluids. The aim was to keep them level. This was called  ',
                    ),
                    CustumInput(
                      controller: _answerTextController6,
                      hintText: '',
                      onSaved: (v) => _answerText5 = v!,
                      // validator: (v) => v!.isEmpty
                      //     ? "Email is required!"
                      //     : StringUtils.isEmail(v)
                      //         ? null
                      //         : "Invalid email",
                      obscureText: false,
                    ),
                    const TextQuestion(
                      text: ' in Greek.',
                    ),
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
