class ImageQuiz {
  String question;
  List<Map> answers;
  ImageQuiz({required this.question, required this.answers});
}

class QuizModel {
  int quizId;
  String question;
  List<Map> answers;

  QuizModel(
      {required this.quizId, required this.question, required this.answers});
}

class QuizDragDrop {
  String question;
  List<String> answers;
  QuizDragDrop({required this.answers, required this.question});
}

enum AnimalType { land, air }

class AnswerText {
  final String answers;

  AnswerText({
    required this.answers,
  });
}

final allAnswerTexts = [
  AnswerText(
    answers: 'assets1',
  ),
  AnswerText(
    answers: 'assets3',
  ),
  AnswerText(
    answers: 'assets3',
  ),
  AnswerText(
    answers: 'assets4',
  ),
  AnswerText(
    answers: 'assets5',
  ),
  AnswerText(
    answers: 'assets5',
  ),
];
