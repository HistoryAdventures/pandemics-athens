import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

class QuizData {
  static bool showRightAnswers = false;
  static final List<Answers> answersForQ1 = [
    Answers(
        value: 1,
        text: "Battle of Thermopylae",
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: 2,
        text: "Birth of Socrates",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 3,
        text: "The Plague arrives in Athens",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 4,
        text: "Death of Pericles",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
        value: 5,
        text: "Herodotus writes his 'Histories'",
        correctAnswers: CorrectAnswers.answer5),
    Answers(
        value: 6,
        text: "End of the Peloponnesian War",
        correctAnswers: CorrectAnswers.answer6),
    Answers(
        value: 7,
        text: "Cleisthenes' reforms and the birth of Democracy",
        correctAnswers: CorrectAnswers.answer7),
  ];
  static final List<Answers> variantsForQ1 = [
    Answers(value: 3, text: "430 BC", correctAnswers: CorrectAnswers.answer3),
    Answers(value: 4, text: "429 BC", correctAnswers: CorrectAnswers.answer4),
    Answers(value: 5, text: "415 BC", correctAnswers: CorrectAnswers.answer5),
    Answers(value: 2, text: "469 BC", correctAnswers: CorrectAnswers.answer2),
    Answers(value: 6, text: "404 BC", correctAnswers: CorrectAnswers.answer6),
    Answers(value: 1, text: "480 BC", correctAnswers: CorrectAnswers.answer1),
    Answers(value: 7, text: "508 BC", correctAnswers: CorrectAnswers.answer7),
  ];

  static final List<Answers<int>> answersForKeyPeople6 = [
    Answers(value: 1, text: "Thucydides"),
    Answers(value: 2, text: "Socrates"),
    Answers(value: 3, text: "Cleisthenes"),
    Answers(value: 4, text: "Pericles"),
  ];

  static final List<Answers> answersDD4 = [
    Answers(
        value: 1,
        text:
            "Construction of the Parthenon in 447-432 BC. (ATHENS - Slide 25)",
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: 2,
        text:
            "The 'First' Peloponnesian War begins in 461. (ATHENS, SPARTA, OENOE - Slide 19)",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 3,
        text: "The Sicilian Expedition in 413 BC. (SICILY)",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 4,
        text:
            "The Greeks defeat the Persians at the Battle of Marathon in 490 BC. (MARATHON - SLIDE 12)",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
        value: 5,
        text:
            "The Athenians establlish the Delian League in 477 BC. (DELOS - Slide 15)",
        correctAnswers: CorrectAnswers.answer5),
  ];

  static final List<Answers> variantsDD4 = [
    Answers(
        value: 5,
        text: "assets/map/map477image.png",
        correctAnswers: CorrectAnswers.answer5),
    Answers(
        value: 3,
        text: "assets/map/map413image.png",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 2,
        text: "assets/map/map461image.png",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 1,
        text: "assets/map/map447_432image.png",
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: 4,
        text: "assets/map/map490image.png",
        correctAnswers: CorrectAnswers.answer4),
  ];

  static final List<Answers> answersDD9 = [
    Answers(
        value: 1,
        text: "Themistocles ",
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: 2, text: "Thucydides ", correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 3, text: "Aeschylus ", correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 4,
        text: "Iktinos, Kallikrates, and Phidias",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
      value: 5,
      text: "Sophocles",
      correctAnswers: CorrectAnswers.answer5,
    ),
    Answers(
      value: 6,
      text: "Euripides ",
      correctAnswers: CorrectAnswers.answer6,
    ),
    Answers(value: 7, text: "Plato", correctAnswers: CorrectAnswers.answer7),
    Answers(
        value: 8, text: "Herodotus", correctAnswers: CorrectAnswers.answer8),
  ];

  static final List<Answers> variantsDD9 = [
    Answers(
        value: 7,
        text: "The Allegory of the Cave",
        correctAnswers: CorrectAnswers.answer7),
    Answers(
        value: 4,
        text: "The Parthenon",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
      value: 5,
      text: "Antigone ",
      correctAnswers: CorrectAnswers.answer5,
    ),
    Answers(
        value: 3,
        text:
            "The Orestia (the Agammemnon, Libation Bearers, and the Eumenides)",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
      value: 6,
      text: "Medea",
      correctAnswers: CorrectAnswers.answer6,
    ),
    Answers(
      value: 1,
      text: "Victory at the Battle of Salamis ",
      correctAnswers: CorrectAnswers.answer1,
    ),
    Answers(
        value: 2,
        text: "Hiistory of the Peloponnesian War",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 8, text: "Histories", correctAnswers: CorrectAnswers.answer8),
  ];

  // [QUESTION 2]
  /// users Answer List and Correct Answers
  /// Controllers For EditTextWidget
  ///List for question body widget

  static final List<String> usersAnswersForQ2 = [];
  static final List<String> correctAnswersForQ2 = [
    'humours',
    'balanced',
    'phlegm',
    'black',
    'bile',
    'eucrasia',
  ];
  static String userAnswerText1 = '';
  static String userAnswerText2 = '';
  static String userAnswerText3 = '';
  static String userAnswerText4 = '';
  static String userAnswerText5 = '';
  static String userAnswerText6 = '';

  static final TextEditingController answerTextController1 =
      TextEditingController();
  static final TextEditingController answerTextController2 =
      TextEditingController();

  static final TextEditingController answerTextController3 =
      TextEditingController();

  static final TextEditingController answerTextController4 =
      TextEditingController();

  static final TextEditingController answerTextController5 =
      TextEditingController();

  static final TextEditingController answerTextController6 =
      TextEditingController();

  static final List<dynamic> listQuestionBody2 = [
    'Hippocrates suggested that the body contained four',
    EditText(
        controller: QuizData.answerTextController1,
        userAnswer: QuizData.userAnswerText1),
    '. These were vital bodily fluids that kept people healthy if they were kept',
    EditText(
        controller: QuizData.answerTextController2,
        userAnswer: QuizData.userAnswerText2),
    '. He studied the body through ',
    EditText(
        controller: QuizData.answerTextController3,
        userAnswer: QuizData.userAnswerText3),
    '. They are: blood,',
    EditText(
        controller: QuizData.answerTextController4,
        userAnswer: QuizData.userAnswerText5),
    ",",
    'bile, yellow',
    EditText(
        controller: QuizData.answerTextController5,
        userAnswer: QuizData.userAnswerText5),
    'A person became sick if they had too much, or not enough, of one of these fluids. The aim was to keep them level. This was called  ',
    EditText(
        controller: QuizData.answerTextController6,
        userAnswer: QuizData.userAnswerText6),
    ' in Greek.',
  ];

  ///[QUESTION 3]
  /// users Answer List and Correct Answers
  ///List for question body widget
  static final List<DragWordsWidget> usersAnswersForQ3 = [];
  static final List<String> correctAnswersForQ3 = [
    'King',
    'oligarchy',
    'demos',
    'power',
    'citizens',
    'Women',
    'slaves',
    'metics'
  ];
  static final List<Answers> userAnswer1ForQ3 = [];
  static final List<Answers> userAnswer2ForQ3 = [];
  static final List<Answers> userAnswer3ForQ3 = [];
  static final List<Answers> userAnswer4ForQ3 = [];
  static final List<Answers> userAnswer5ForQ3 = [];
  static final List<Answers> userAnswer6ForQ3 = [];
  static final List<Answers> userAnswer7ForQ3 = [];
  static final List<Answers> userAnswer8ForQ3 = [];

  static final List<Answers> answersDD3 = [
    Answers(value: 1, text: "slaves"),
    Answers(value: 2, text: "demos"),
    Answers(value: 3, text: "oligarchy"),
    Answers(value: 4, text: "Women"),
    Answers(value: 5, text: "metics"),
    Answers(value: 6, text: "power"),
    Answers(value: 7, text: "King"),
    Answers(value: 8, text: "citizens"),
  ];

  static final List<dynamic> listQuestionBody3 = [
    "In the 5th century BC, Athens was a democracy. It was not a monarchy, ruled by a '",
    DragWordsWidget(
      answers: QuizData.userAnswer1ForQ3,
      isRight: false,
    ),
    ", nor was it ruled by a small band of aritocrats (an ",
    DragWordsWidget(
      answers: QuizData.userAnswer2ForQ3,
      isRight: false,
    ),
    "). Instead, the people represented themselves.\n Democracy derives from two Greek words ",
    DragWordsWidget(
      answers: QuizData.userAnswer3ForQ3,
      isRight: false,
    ),
    " meaning people, and kratos, which means ",
    DragWordsWidget(
      answers: QuizData.userAnswer4ForQ3,
      isRight: false,
    ),
    "Athenian democracy was very different to modern democracy, however. Only adult male ",
    DragWordsWidget(
      answers: QuizData.userAnswer5ForQ3,
      isRight: false,
    ),
    " could take part. ",
    DragWordsWidget(
      answers: QuizData.userAnswer6ForQ3,
      isRight: false,
    ),
    " and non-Athenians ",
    DragWordsWidget(
      answers: QuizData.userAnswer7ForQ3,
      isRight: false,
    ),
    " were excluded. ",
    DragWordsWidget(
      answers: QuizData.userAnswer8ForQ3,
      isRight: false,
    ),
  ];

  ///[QUESTION 7]
  /// users Answer List and Correct Answers
  ///List for question body widget
  static final List<List<Answers>> usersAnswersForQ7 = [];
  static final List<String> correctAnswersForQ7 = [
    'Roman',
    'Hippocrates',
    'dissection',
    'gladiators',
    'plague',
    'Renaissance',
  ];
  static final List<Answers> answersDD7 = [
    Answers(value: 1, text: "dissection"),
    Answers(value: 2, text: "Roman"),
    Answers(value: 3, text: "Renaissance"),
    Answers(value: 4, text: "plague"),
    Answers(value: 5, text: "Hippocrates"),
    Answers(value: 6, text: "gladiators"),
  ];

  static final List<Answers> userAnswer1ForQ7 = [];
  static final List<Answers> userAnswer2ForQ7 = [];
  static final List<Answers> userAnswer3ForQ7 = [];
  static final List<Answers> userAnswer4ForQ7 = [];
  static final List<Answers> userAnswer5ForQ7 = [];
  static final List<Answers> userAnswer6ForQ7 = [];

  static final List<dynamic> listQuestionBody7 = [
    'Galen was a  ',
    QuizData.userAnswer1ForQ7,
    ' doctor who was influenced by and developed the theories of ',
    QuizData.userAnswer2ForQ7,
    '. He studied the body through ',
    QuizData.userAnswer3ForQ7,
    '. Because this was illegal, he encouraged his students to investigate the corpses of ',
    QuizData.userAnswer4ForQ7,
    "'!\n'",
    'Galen also lived through a ',
    QuizData.userAnswer5ForQ7,
    "  . His ideas were very influential, and were only challenged and developed during the ",
    QuizData.userAnswer6ForQ7,
  ];

  ///[QUESTION 8]
  /// users Answer List and Correct Answers
  static List<CorrectAnswers> usersAnswersForQ8 = [];
  static final List<CorrectAnswers> correctAnswersForQ8 = [
    CorrectAnswers.answer2,
    CorrectAnswers.answer4,
    CorrectAnswers.answer5
  ];
  static final List<Answers<bool>> answersForQuestion8 = [
    Answers(
        value: false,
        text: "This paiting is called the 'Death of Plato'.",
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: false,
        text: "This painting is all about Socrates.",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: false,
        text: "This was painted by Jacques-Louis Davi",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: false,
        text: "This is a painting by Leonardo da Vinci.",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
        value: false,
        text: "Socrates was a famous historian.",
        correctAnswers: CorrectAnswers.answer5),
    Answers(
        value: false,
        text: "Socrates was sentecend to death for murder.",
        correctAnswers: CorrectAnswers.answer6),
  ];

  ///[QUESTION 5]
  /// users Answer List and Correct Answers
  ///List for question body widget

  static int valueQ5 = -1;

  static const int correctAnswerQ5 = 4;

  static final List<Answers<int>> answersForQ5 = [
    Answers(value: 1, text: "Ebola"),
    Answers(value: 2, text: "Bubonic Plague"),
    Answers(value: 3, text: "Typhis"),
    Answers(value: 4, text: "Typhoid"),
    Answers(value: 5, text: "Smallpox"),
  ];

  ///[QUESTION 6]
  /// users Answer List and Correct Answers
  ///List for question body widget
  static const int correctAnswerQ6 = 4;
  static int valueQ6 = -1;

  static final List<Answers<int>> answersForQ6 = [
    Answers(value: 1, text: "Thucydides"),
    Answers(value: 2, text: "Socrates"),
    Answers(value: 3, text: "Cleisthenes"),
    Answers(value: 4, text: "Pericles"),
  ];

  /// [CHECK ALL ANSWERS]
  static void checkUerAnswers() {
    int rightAnswersForQ3 = 0;
    int rightAnswersForQ2 = 0;
    int rightAnswersForQ5 = 0;
    int rightAnswersForQ6 = 0;
    int rightAnswersForQ8 = 0;
    int rightAnswersForQ7 = 0;
    listQuestionBody3.forEach((element) {
      print(element);
      if (element is DragWordsWidget) {
        if (element.answers.isEmpty) {
          usersAnswersForQ3.add(DragWordsWidget(
              answers: [Answers(value: 0, text: '')], isRight: false));
        } else {
          usersAnswersForQ3.add(element);
        }
      }
    });

    if (valueQ5 == correctAnswerQ5) {
      rightAnswersForQ5++;
    }

    if (valueQ6 == correctAnswerQ6) {
      rightAnswersForQ6++;
    }

    listQuestionBody7.forEach((element) {
      if (element is List<Answers<dynamic>>) {
        if (element.isEmpty) {
          usersAnswersForQ7.add([Answers(value: 0, text: '')]);
        } else {
          usersAnswersForQ7.add(element);
        }
      }
    });

    listQuestionBody2.forEach((element) {
      if (element is EditText) {
        usersAnswersForQ2.add(element.userAnswer);
      }
    });

    for (var i = 0; i < usersAnswersForQ3.length; i++) {
      if (correctAnswersForQ3[i] == usersAnswersForQ3[i].answers.first.text) {
        usersAnswersForQ3[i].isRight = true;
        rightAnswersForQ3++;
      }
    }

    for (var i = 0; i < usersAnswersForQ7.length; i++) {
      if (correctAnswersForQ7[i] == usersAnswersForQ7[i].first.text) {
        rightAnswersForQ7++;
      }
    }

    for (var i = 0; i < usersAnswersForQ2.length; i++) {
      if (correctAnswersForQ2[i] == usersAnswersForQ2[i]) {
        usersAnswersForQ2[i];
        rightAnswersForQ2++;
      }
    }

    correctAnswersForQ8.forEach((CorrectAnswers element) {
      if (usersAnswersForQ8.contains(element)) {
        rightAnswersForQ8++;
      } else {
        print('not ok');
      }
    });
    print("Score Question 2 $rightAnswersForQ2");
    print('Score Question 3 $rightAnswersForQ3');
    print("Score Question 5 $rightAnswersForQ5");
    print("Score Question 6 $rightAnswersForQ6");
    print('Score Question 7 $rightAnswersForQ7');
    print("Score Question 8 $rightAnswersForQ8");
  }
}

enum CorrectAnswers {
  answer1,
  answer2,
  answer3,
  answer4,
  answer5,
  answer6,
  answer7,
  answer8,
}

class EditText {
  final TextEditingController controller;
  String userAnswer;

  EditText({
    required this.controller,
    required this.userAnswer,
  });
}

class DragWordsWidget {
  final List<Answers> answers;
  bool isRight;

  DragWordsWidget({
    required this.answers,
    required this.isRight,
  });
}
