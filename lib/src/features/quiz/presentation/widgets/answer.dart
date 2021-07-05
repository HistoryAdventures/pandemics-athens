import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 5,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 10, offset: Offset(1, 1)),
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(colors: [
            Color(0xFF5337ff),
            Color(0xFF8131ff),
            Color(0xFFbd27ff),
          ]),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
