import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class Answer extends StatelessWidget {
  final String title;
  final bool isCorrect;
  final Function onChangeAnswer;
  const Answer(
      {required this.title,
      required this.isCorrect,
      required this.onChangeAnswer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChangeAnswer(isCorrect),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        margin: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 5,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 1, offset: Offset(1, 1), color: AppColors.black25),
          ],
          borderRadius: BorderRadius.circular(30),
          color: AppColors.white,
        ),
        child: Center(
          child: AutoSizeText(
            title,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
