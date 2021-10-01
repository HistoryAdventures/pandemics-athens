import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/styles.dart';

class QuizRadioBottonWidget extends StatefulWidget {
  bool? quizWithImage = false;

  final int questionIndex;
  final String question;

  final List<Answers> answers;

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
    print(val);
    super.dispose();
  }

  // bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
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
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontSize: TextFontSize.getHeight(45, context)),
                    ),
                    Flexible(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: widget.answers
                              .map((e) => ListTile(
                                    title: Text(e.text),
                                    leading: Radio(
                                      value: e.value,
                                      groupValue: val,
                                      onChanged: (int? value) {
                                        setState(() {
                                          val = value!;
                                        });
                                      },
                                      activeColor: AppColors.blueDeep,
                                    ),
                                  ))
                              .toList()),
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

class Answers {
  final int value;
  final String text;

  Answers({required this.value, required this.text});
}
