import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_circles.dart';

class QuizData {
  static bool showRightAnswers = false;
  static int questionIndex = 0;

  static int finalScore = 0;

  ///[QUESTION 1]
  ///
  static List<DrowLineWidget> listCorrectrAnswersQuestion1 = [];
  static List<DrowLineWidget> listCorrectrAnswersQuestion4 = [];
  static List<DrowLineWidget> listCorrectrAnswersQuestion9 = [];
  static final GlobalKey globalKeyA1Q1 = GlobalKey();
  static final GlobalKey globalKeyA2Q1 = GlobalKey();
  static final GlobalKey globalKeyA3Q1 = GlobalKey();
  static final GlobalKey globalKeyA4Q1 = GlobalKey();
  static final GlobalKey globalKeyA5Q1 = GlobalKey();
  static final GlobalKey globalKeyA6Q1 = GlobalKey();
  static final GlobalKey globalKeyA7Q1 = GlobalKey();
  static final GlobalKey globalKeyV1Q1 = GlobalKey();
  static final GlobalKey globalKeyV2Q1 = GlobalKey();
  static final GlobalKey globalKeyV3Q1 = GlobalKey();
  static final GlobalKey globalKeyV4Q1 = GlobalKey();
  static final GlobalKey globalKeyV5Q1 = GlobalKey();
  static final GlobalKey globalKeyV6Q1 = GlobalKey();
  static final GlobalKey globalKeyV7Q1 = GlobalKey();
  static final List<Answers<int>> answersForQ1 = [
    Answers(
        globalKey: globalKeyA1Q1,
        value: 1,
        text: "Battle of Thermopylae",
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: 2,
        globalKey: globalKeyA2Q1,
        text: "Birth of Socrates",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 3,
        globalKey: globalKeyA3Q1,
        text: "The Plague arrives in Athens",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 4,
        globalKey: globalKeyA4Q1,
        text: "Death of Pericles",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
        value: 5,
        globalKey: globalKeyA5Q1,
        text: "Herodotus writes his 'Histories'",
        correctAnswers: CorrectAnswers.answer5),
    Answers(
        value: 6,
        globalKey: globalKeyA6Q1,
        text: "End of the Peloponnesian War",
        correctAnswers: CorrectAnswers.answer6),
    Answers(
        value: 7,
        globalKey: globalKeyA7Q1,
        text: "Cleisthenes' reforms and the birth of Democracy",
        correctAnswers: CorrectAnswers.answer7),
  ];
  static final List<Answers<int>> variantsForQ1 = [
    Answers(
      value: 3,
      globalKey: globalKeyV3Q1,
      text: "430 BC",
      correctAnswers: CorrectAnswers.answer3,
    ),
    Answers(
      value: 4,
      globalKey: globalKeyV4Q1,
      text: "429 BC",
      correctAnswers: CorrectAnswers.answer4,
    ),
    Answers(
      value: 5,
      globalKey: globalKeyV5Q1,
      text: "415 BC",
      correctAnswers: CorrectAnswers.answer5,
    ),
    Answers(
      value: 2,
      globalKey: globalKeyV2Q1,
      text: "469 BC",
      correctAnswers: CorrectAnswers.answer2,
    ),
    Answers(
      value: 6,
      globalKey: globalKeyV6Q1,
      text: "404 BC",
      correctAnswers: CorrectAnswers.answer6,
    ),
    Answers(
      value: 1,
      globalKey: globalKeyV1Q1,
      text: "480 BC",
      correctAnswers: CorrectAnswers.answer1,
    ),
    Answers(
      value: 7,
      globalKey: globalKeyV7Q1,
      text: "508 BC",
      correctAnswers: CorrectAnswers.answer7,
    ),
  ];
  static List<DrowLineWidget> userAnswerWithCheckForQ1 = [];
  static List<DrowLineWidget> userAnswerForQ1 = [];
  static bool valueForDrowColoredLineFor = false;

  static final List<Answers<int>> answersForKeyPeople6 = [
    Answers(value: 1, text: "Thucydides"),
    Answers(value: 2, text: "Socrates"),
    Answers(value: 3, text: "Cleisthenes"),
    Answers(value: 4, text: "Pericles"),
  ];

  ///[QUESTION 4]
  ///
  ///
  static final GlobalKey globalKeyA1Q4 = GlobalKey();
  static final GlobalKey globalKeyA2Q4 = GlobalKey();
  static final GlobalKey globalKeyA3Q4 = GlobalKey();
  static final GlobalKey globalKeyA4Q4 = GlobalKey();
  static final GlobalKey globalKeyA5Q4 = GlobalKey();

  static final GlobalKey globalKeyV1Q4 = GlobalKey();
  static final GlobalKey globalKeyV2Q4 = GlobalKey();
  static final GlobalKey globalKeyV3Q4 = GlobalKey();
  static final GlobalKey globalKeyV4Q4 = GlobalKey();
  static final GlobalKey globalKeyV5Q4 = GlobalKey();
  static List<DrowLineWidget> userAnswerWithCheckForQ4 = [];
  static List<DrowLineWidget> userAnswerForQ4 = [];

  static final List<Answers<int>> answersDD4 = [
    Answers(
      value: 1,
      text: "Construction of the Parthenon in 447-432 BC. (ATHENS - Slide 25)",
      correctAnswers: CorrectAnswers.answer1,
      globalKey: globalKeyA1Q4,
    ),
    Answers(
      value: 2,
      text:
          "The 'First' Peloponnesian War begins in 461. (ATHENS, SPARTA, OENOE - Slide 19)",
      correctAnswers: CorrectAnswers.answer2,
      globalKey: globalKeyA2Q4,
    ),
    Answers(
        value: 3,
        globalKey: globalKeyA3Q4,
        text: "The Sicilian Expedition in 413 BC. (SICILY)",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 4,
        globalKey: globalKeyA4Q4,
        text:
            "The Greeks defeat the Persians at the Battle of Marathon in 490 BC. (MARATHON - SLIDE 12)",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
        value: 5,
        globalKey: globalKeyA5Q4,
        text:
            "The Athenians establlish the Delian League in 477 BC. (DELOS - Slide 15)",
        correctAnswers: CorrectAnswers.answer5),
  ];

  static final List<Answers<int>> variantsDD4 = [
    Answers(
        value: 5,
        globalKey: globalKeyV5Q4,
        text: "assets/map/map477image.png",
        correctAnswers: CorrectAnswers.answer5),
    Answers(
        value: 3,
        globalKey: globalKeyV3Q4,
        text: "assets/map/map413image.png",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 2,
        globalKey: globalKeyV2Q4,
        text: "assets/map/map461image.png",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 1,
        globalKey: globalKeyV1Q4,
        text: "assets/map/map447_432image.png",
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: 4,
        globalKey: globalKeyV4Q4,
        text: "assets/map/map490image.png",
        correctAnswers: CorrectAnswers.answer4),
  ];

  ///[QUESTION 9]
  ///
  ///
  ///
  ///
  static final GlobalKey globalKeyA1Q9 = GlobalKey();
  static final GlobalKey globalKeyA2Q9 = GlobalKey();
  static final GlobalKey globalKeyA3Q9 = GlobalKey();
  static final GlobalKey globalKeyA4Q9 = GlobalKey();
  static final GlobalKey globalKeyA5Q9 = GlobalKey();
  static final GlobalKey globalKeyA6Q9 = GlobalKey();
  static final GlobalKey globalKeyA7Q9 = GlobalKey();
  static final GlobalKey globalKeyA8Q9 = GlobalKey();

  static final GlobalKey globalKeyV1Q9 = GlobalKey();
  static final GlobalKey globalKeyV2Q9 = GlobalKey();
  static final GlobalKey globalKeyV3Q9 = GlobalKey();
  static final GlobalKey globalKeyV4Q9 = GlobalKey();
  static final GlobalKey globalKeyV5Q9 = GlobalKey();
  static final GlobalKey globalKeyV6Q9 = GlobalKey();
  static final GlobalKey globalKeyV7Q9 = GlobalKey();
  static final GlobalKey globalKeyV8Q9 = GlobalKey();

  static List<DrowLineWidget> userAnswerWithCheckForQ9 = [];
  static List<DrowLineWidget> userAnswerForQ9 = [];

  static final List<Answers<int>> answersDD9 = [
    Answers(
        value: 1,
        globalKey: globalKeyA1Q9,
        text: "Themistocles ",
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: 2,
        globalKey: globalKeyA2Q9,
        text: "Thucydides ",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 3,
        globalKey: globalKeyA3Q9,
        text: "Aeschylus ",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 4,
        globalKey: globalKeyA4Q9,
        text: "Iktinos, Kallikrates, and Phidias",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
      value: 5,
      globalKey: globalKeyA5Q9,
      text: "Sophocles",
      correctAnswers: CorrectAnswers.answer5,
    ),
    Answers(
      value: 6,
      globalKey: globalKeyA6Q9,
      text: "Euripides ",
      correctAnswers: CorrectAnswers.answer6,
    ),
    Answers(
        value: 7,
        globalKey: globalKeyA7Q9,
        text: "Plato",
        correctAnswers: CorrectAnswers.answer7),
    Answers(
        value: 8,
        globalKey: globalKeyA8Q9,
        text: "Herodotus",
        correctAnswers: CorrectAnswers.answer8),
  ];

  static final List<Answers<int>> variantsDD9 = [
    Answers(
        value: 7,
        globalKey: globalKeyV7Q9,
        text: "The Allegory of the Cave",
        correctAnswers: CorrectAnswers.answer7),
    Answers(
        value: 4,
        globalKey: globalKeyV4Q9,
        text: "The Parthenon",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
      value: 5,
      globalKey: globalKeyV5Q9,
      text: "Antigone ",
      correctAnswers: CorrectAnswers.answer5,
    ),
    Answers(
        value: 3,
        globalKey: globalKeyV3Q9,
        text:
            "The Orestia (the Agammemnon, Libation Bearers, and the Eumenides)",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
      value: 6,
      globalKey: globalKeyV6Q9,
      text: "Medea",
      correctAnswers: CorrectAnswers.answer6,
    ),
    Answers(
      value: 1,
      globalKey: globalKeyV1Q9,
      text: "Victory at the Battle of Salamis ",
      correctAnswers: CorrectAnswers.answer1,
    ),
    Answers(
        value: 2,
        globalKey: globalKeyV2Q9,
        text: "Hiistory of the Peloponnesian War",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 8,
        globalKey: globalKeyV8Q9,
        text: "Histories",
        correctAnswers: CorrectAnswers.answer8),
  ];

  // [QUESTION 2]
  /// users Answer List and Correct Answers
  /// Controllers For EditTextWidget
  ///List for question body widget
  ///
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

  static List<dynamic> usersAnswersForQ2 = [];

  static final List<dynamic> listQuestionBody2 = [
    'Hippocrates suggested that the body contained four',
    EditTextWidget(
        controller: QuizData.answerTextController1,
        isRight: null,
        correctAnswer: 'humours'),
    '. These were vital bodily fluids that kept people healthy if they were kept',
    EditTextWidget(
        controller: QuizData.answerTextController2,
        isRight: null,
        correctAnswer: 'balanced'),
    '. He studied the body through ',
    EditTextWidget(
        controller: QuizData.answerTextController3,
        isRight: null,
        correctAnswer: 'phlegm'),
    '. They are: blood, ',
    EditTextWidget(
        controller: QuizData.answerTextController4,
        isRight: null,
        correctAnswer: 'black'),
    ",",
    'bile, yellow',
    EditTextWidget(
        controller: QuizData.answerTextController5,
        isRight: null,
        correctAnswer: 'bile'),
    'A person became sick if they had too much, or not enough, of one of these fluids. The aim was to keep them level. This was called  ',
    EditTextWidget(
        controller: QuizData.answerTextController6,
        isRight: null,
        correctAnswer: 'eucrasia'),
    ' in Greek.',
  ];

  static final List<dynamic> correctAnswersForQ2 = [
    'Hippocrates suggested that the body contained four ',
    ['humours'],
    '. These were vital bodily fluids that kept people healthy if they were kept ',
    ['balanced'],
    ' . He studied the body through ',
    ['phlegm'],
    '. They are: blood,',
    ['black'],
    " , ",
    ' bile, yellow ',
    ['bile'],
    'A person became sick if they had too much, or not enough, of one of these fluids. The aim was to keep them level. This was called  ',
    ['eucrasia'],
    ' in Greek.',
  ];

  ///[QUESTION 3]
  /// users Answer List and Correct Answers
  ///List for question body widget
  static List<dynamic> usersAnswersForQ3 = [];

  static List<Answers> userAnswer1ForQ3 = [];
  static List<Answers> userAnswer2ForQ3 = [];
  static List<Answers> userAnswer3ForQ3 = [];
  static List<Answers> userAnswer4ForQ3 = [];
  static List<Answers> userAnswer5ForQ3 = [];
  static List<Answers> userAnswer6ForQ3 = [];
  static List<Answers> userAnswer7ForQ3 = [];
  static List<Answers> userAnswer8ForQ3 = [];

  static List<Answers> answersForDD3 = [
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
        isRight: null,
        correctAnswer: 'King'),
    ", nor was it ruled by a small band of aritocrats (an ",
    DragWordsWidget(
        answers: QuizData.userAnswer2ForQ3,
        isRight: null,
        correctAnswer: 'oligarchy'),
    "). Instead, the people represented themselves.\n Democracy derives from two Greek words ",
    DragWordsWidget(
        answers: QuizData.userAnswer3ForQ3,
        isRight: null,
        correctAnswer: 'demos'),
    " meaning people, and kratos, which means ",
    DragWordsWidget(
        answers: QuizData.userAnswer4ForQ3,
        isRight: null,
        correctAnswer: 'power'),
    "Athenian democracy was very different to modern democracy, however. Only adult male ",
    DragWordsWidget(
        answers: QuizData.userAnswer5ForQ3,
        isRight: null,
        correctAnswer: 'citizens'),
    " could take part. ",
    DragWordsWidget(
        answers: QuizData.userAnswer6ForQ3,
        isRight: null,
        correctAnswer: 'Women'),
    " and non-Athenians ",
    DragWordsWidget(
        answers: QuizData.userAnswer7ForQ3,
        isRight: null,
        correctAnswer: 'slaves'),
    " were excluded. ",
    DragWordsWidget(
        answers: QuizData.userAnswer8ForQ3,
        isRight: null,
        correctAnswer: 'metics'),
  ];

  static final List<dynamic> correctAnswersForQ3 = [
    "In the 5th century BC, Athens was a democracy. It was not a monarchy, ruled by a '",
    ['King'],
    ", nor was it ruled by a small band of aritocrats (an ",
    ['oligarchy'],
    "). Instead, the people represented themselves.\n Democracy derives from two Greek words ",
    ['demos'],
    " meaning people, and kratos, which means ",
    ['power'],
    "Athenian democracy was very different to modern democracy, however. Only adult male ",
    ['citizens'],
    " could take part. ",
    ['Women'],
    " and non-Athenians ",
    ['slaves'],
    " were excluded. ",
    ['metics'],
  ];

  ///[QUESTION 7]
  /// users Answer List and Correct Answers
  ///List for question body widget
  static List<dynamic> usersAnswersForQ7 = [];

  static List<Answers> answersForDD7 = [
    Answers(value: 1, text: "dissection"),
    Answers(value: 2, text: "Roman"),
    Answers(value: 3, text: "Renaissance"),
    Answers(value: 4, text: "plague"),
    Answers(value: 5, text: "Hippocrates"),
    Answers(value: 6, text: "gladiators"),
  ];

  static List<Answers> userAnswer1ForQ7 = [];
  static List<Answers> userAnswer2ForQ7 = [];
  static List<Answers> userAnswer3ForQ7 = [];
  static List<Answers> userAnswer4ForQ7 = [];
  static List<Answers> userAnswer5ForQ7 = [];
  static List<Answers> userAnswer6ForQ7 = [];

  static final List<dynamic> listQuestionBody7 = [
    'Galen was a  ',
    DragWordsWidget(
      answers: QuizData.userAnswer1ForQ7,
      isRight: null,
    ),
    ' doctor who was influenced by and developed the theories of ',
    DragWordsWidget(
      answers: QuizData.userAnswer2ForQ7,
      isRight: null,
    ),
    '. He studied the body through ',
    DragWordsWidget(
      answers: QuizData.userAnswer3ForQ7,
      isRight: null,
    ),
    '. Because this was illegal, he encouraged his students to investigate the corpses of ',
    DragWordsWidget(
      answers: QuizData.userAnswer4ForQ7,
      isRight: null,
    ),
    "'!\n'",
    'Galen also lived through a ',
    DragWordsWidget(
      answers: QuizData.userAnswer5ForQ7,
      isRight: null,
    ),
    "  . His ideas were very influential, and were only challenged and developed during the ",
    DragWordsWidget(
      answers: QuizData.userAnswer6ForQ7,
      isRight: null,
    ),
  ];

  static final List<dynamic> correctAnswersForQ7 = [
    'Galen was a  ',
    ['Roman'],
    ' doctor who was influenced by and developed the theories of ',
    ['Hippocrates'],
    '. He studied the body through ',
    ['dissection'],
    '. Because this was illegal, he encouraged his students to investigate the corpses of ',
    ['gladiators'],
    "'!\n'",
    'Galen also lived through a ',
    ['plague'],
    "  . His ideas were very influential, and were only challenged and developed during the ",
    ['Renaissance'],
  ];

  ///[QUESTION 8]
  /// users Answer List and Correct Answers
  static List<CheckBoxWidget<bool>> usersAnswersForQ8 = [];
  static final List<CorrectAnswers> correctAnswersForQ8 = [
    CorrectAnswers.answer2,
    CorrectAnswers.answer4,
    CorrectAnswers.answer5
  ];

  static final List<CheckBoxWidget<bool>> answersForQuestion8 = [
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "This paiting is called the 'Death of Plato'.",
          correctAnswers: CorrectAnswers.answer1),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "This painting is all about Socrates.",
          correctAnswers: CorrectAnswers.answer2),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "This was painted by Jacques-Louis Davi",
          correctAnswers: CorrectAnswers.answer3),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "This is a painting by Leonardo da Vinci.",
          correctAnswers: CorrectAnswers.answer4),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "Socrates was a famous historian.",
          correctAnswers: CorrectAnswers.answer5),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "Socrates was sentecend to death for murder.",
          correctAnswers: CorrectAnswers.answer6),
      isRight: null,
    ),
  ];

  ///[QUESTION 5]
  /// users Answer List and Correct Answers
  ///List for question body widget

  static int valueQ5 = -1;
  static int valueQ10 = -1;

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

  ///[question 10]
  static final List<CheckBoxWidget<int>> answersForQuestion10 = [
    CheckBoxWidget(
      answers: Answers(
          value: 1,
          text: AssetsPath.quizImage1,
          correctAnswers: CorrectAnswers.answer1),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: 2,
          text: AssetsPath.quizImage2,
          correctAnswers: CorrectAnswers.answer2),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: 3,
          text: AssetsPath.quizImage3,
          correctAnswers: CorrectAnswers.answer3),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: 4,
          text: AssetsPath.quizImage4,
          correctAnswers: CorrectAnswers.answer4),
      isRight: null,
    ),
  ];
  static int usersAnswersForQ10 = 0;
  static final List<CorrectAnswers> correctAnswersForQ10 = [
    CorrectAnswers.answer2,
  ];

  //[CLEAR ALL ANSWERS]

  ///[SCORE]
  static int rightAnswersForQ3 = 0;
  static int rightAnswersForQ2 = 0;
  static int rightAnswersForQ5 = 0;
  static int rightAnswersForQ6 = 0;
  static int rightAnswersForQ8 = 0;
  static int rightAnswersForQ7 = 0;
  static int rightAnswersForQ4 = 0;

  static int rightAnswersForQ1 = 0;

  static int rightAnswersForQ9 = 0;
  static int rightAnswersForQ10 = 0;

  /// [CHECK ALL ANSWERS]
  static void checkUerAnswers() {
    for (var i = 0; i < userAnswerWithCheckForQ1.length; i++) {
      if (userAnswerWithCheckForQ1[i].isRight == true) {
        rightAnswersForQ1++;
      }
    }

    for (var i = 0; i < userAnswerWithCheckForQ4.length; i++) {
      if (userAnswerWithCheckForQ4[i].isRight == true) {
        rightAnswersForQ4++;
      }
    }

    for (var i = 0; i < userAnswerWithCheckForQ9.length; i++) {
      if (userAnswerWithCheckForQ9[i].isRight == true) {
        rightAnswersForQ9++;
      }
    }

    listQuestionBody2.forEach((element) {
      if (element is EditTextWidget) {
        if (element.controller.text.isEmpty) {
          usersAnswersForQ2.add(EditTextWidget(
              controller: TextEditingController(),
              isRight: false,
              correctAnswer: element.correctAnswer));
          //  print('add null');
        } else {
          // print("EditText::::: ${element.controller.text}");
          usersAnswersForQ2.add(element);
        }
      } else {
        // print('Text:::: $element');
        usersAnswersForQ2.add(element);
      }
    });
    listQuestionBody3.forEach((element) {
      if (element is DragWordsWidget) {
        if (element.answers.isEmpty) {
          usersAnswersForQ3.add(DragWordsWidget(
              correctAnswer: element.correctAnswer,
              answers: [Answers(value: 0, text: '')],
              isRight: false));
        } else {
          usersAnswersForQ3.add(element);
        }
      } else {
        usersAnswersForQ3.add(element);
      }
    });

    listQuestionBody7.forEach((element) {
      if (element is DragWordsWidget) {
        if (element.answers.isEmpty) {
          usersAnswersForQ7.add(DragWordsWidget(
              answers: [Answers(value: 0, text: '')], isRight: false));
        } else {
          usersAnswersForQ7.add(element);
        }
      } else {
        usersAnswersForQ7.add(element);
      }
    });

    if (valueQ5 == correctAnswerQ5) {
      rightAnswersForQ5++;
    }

    if (valueQ6 == correctAnswerQ6) {
      rightAnswersForQ6++;
    }

    for (var i = 0; i < usersAnswersForQ2.length; i++) {
      if (usersAnswersForQ2[i] is EditTextWidget &&
          correctAnswersForQ2[i] is List<String>) {
        if (correctAnswersForQ2[i].first ==
            usersAnswersForQ2[i].controller.text) {
          usersAnswersForQ2[i].isRight = true;
          rightAnswersForQ2++;
        } else {
          usersAnswersForQ2[i].isRight = false;
        }
      }
    }

    for (var i = 0; i < usersAnswersForQ3.length; i++) {
      if (usersAnswersForQ3[i] is DragWordsWidget &&
          correctAnswersForQ3[i] is List<String>) {
        if (correctAnswersForQ3[i].first ==
            usersAnswersForQ3[i].answers.first.text) {
          usersAnswersForQ3[i].isRight = true;
          rightAnswersForQ3++;
        } else {
          usersAnswersForQ3[i].isRight = false;
        }
      }
    }

    for (var i = 0; i < usersAnswersForQ7.length; i++) {
      if (usersAnswersForQ7[i] is DragWordsWidget &&
          correctAnswersForQ7[i] is List<String>) {
        if (correctAnswersForQ7[i].first ==
            usersAnswersForQ7[i].answers.first.text) {
          usersAnswersForQ7[i].isRight = true;
          rightAnswersForQ7++;
        } else {
          usersAnswersForQ7[i].isRight = false;
        }
      }
    }

    for (var i = 0; i < usersAnswersForQ8.length; i++) {
      if (correctAnswersForQ8
          .contains(usersAnswersForQ8[i].answers.correctAnswers)) {
        print('answwer is true  correctAnswersForQ8');
        usersAnswersForQ8[i].isRight = true;
        rightAnswersForQ8++;
      } else {
        usersAnswersForQ8[i].isRight = false;
      }
    }

    print("Score Question 2 $rightAnswersForQ2");
    print('Score Question 3 $rightAnswersForQ3');
    print("Score Question 5 $rightAnswersForQ5");
    print("Score Question 6 $rightAnswersForQ6");
    print('Score Question 7 $rightAnswersForQ7');
    print("Score Question 8 $rightAnswersForQ8");
    print("Score Question 1 $rightAnswersForQ1");
    print('Score Question 4 $rightAnswersForQ4');
    print("Score Question 9 $rightAnswersForQ9");
    print("Score Question 9 $rightAnswersForQ10");

    finalScore = rightAnswersForQ1 +
        rightAnswersForQ2 +
        rightAnswersForQ3 +
        rightAnswersForQ4 +
        rightAnswersForQ5 +
        rightAnswersForQ6 +
        rightAnswersForQ7 +
        rightAnswersForQ8 +
        rightAnswersForQ9 +
        rightAnswersForQ10;
  }

  static void clearAnswers() {
    listCorrectrAnswersQuestion1 = [];
    listCorrectrAnswersQuestion4 = [];

    listCorrectrAnswersQuestion9 = [];

    finalScore = 0;
    rightAnswersForQ3 = 0;
    rightAnswersForQ2 = 0;
    rightAnswersForQ5 = 0;
    rightAnswersForQ6 = 0;
    rightAnswersForQ8 = 0;
    rightAnswersForQ7 = 0;
    rightAnswersForQ1 = 0;

    rightAnswersForQ4 = 0;

    rightAnswersForQ9 = 0;

    usersAnswersForQ2 = [];

    usersAnswersForQ7 = [];

    usersAnswersForQ8.clear();

    usersAnswersForQ3 = [];

    usersAnswersForQ10 = 0;

    answersForQuestion8.forEach((element) {
      if (element is CheckBoxWidget) {
        element.answers.value = false;
        element.isRight = null;
      }
    });

    answersForQuestion10.forEach((element) {
      if (element is CheckBoxWidget) {
        element.isRight = null;
      }
    });

    listQuestionBody3.forEach((element) {
      if (element is DragWordsWidget) {
        if (element.answers.isNotEmpty) {
          answersForDD3.add(element.answers.first);
          element.answers.removeLast();
        }
      }
    });

    listQuestionBody7.forEach((element) {
      if (element is DragWordsWidget) {
        if (element.answers.isNotEmpty) {
          answersForDD7.add(element.answers.first);
          element.answers.removeLast();
        }
      }
    });

    valueQ5 = -1;
    valueQ6 = -1;
    valueQ10 = -1;
    answerTextController1.clear();
    answerTextController2.clear();
    answerTextController3.clear();
    answerTextController4.clear();
    answerTextController5.clear();
    answerTextController6.clear();

    userAnswerWithCheckForQ1.clear();
    userAnswerForQ1.clear();

    userAnswerWithCheckForQ4.clear();
    userAnswerForQ4.clear();

    userAnswerWithCheckForQ9.clear();
    userAnswerForQ9.clear();
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
  bool? isRight;
  String? correctAnswer;

  DragWordsWidget(
      {required this.answers, required this.isRight, this.correctAnswer});
}

class CheckBoxWidget<T> {
  final Answers<T> answers;
  bool? isRight;

  CheckBoxWidget({
    required this.answers,
    required this.isRight,
  });
}

class EditTextWidget {
  final TextEditingController controller;
  bool? isRight;
  final String correctAnswer;

  EditTextWidget({
    required this.correctAnswer,
    required this.controller,
    this.isRight,
  });
}
