import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class ImageAnswer extends StatelessWidget {
  final String title;
  final bool isCorrect;
  final Function onChangeAnswer;
  const ImageAnswer(
      {required this.title,
      required this.isCorrect,
      required this.onChangeAnswer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChangeAnswer(isCorrect),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
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
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.1,
          child: Image.asset(
            title,
          ),
        ),
      ),
    );
  }
}
