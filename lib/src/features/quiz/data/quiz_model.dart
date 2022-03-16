import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_drop_models.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_circles.dart';

class QuizData {
  static bool showRightAnswers = false;
  static int questionIndex = 0;
  static int firstDragDropResult = 0;
  static int secondDragDropResult = 0;
  static int thirdDragResult = 0;

  static int finalScore = 0;

  static List<Score> listScore = [
    Score(currentScore: rightAnswersForQ1, scorsCount: 1),
    Score(currentScore: rightAnswersForQ2, scorsCount: 1),
    Score(currentScore: rightAnswersForQ3, scorsCount: 1),
    Score(currentScore: rightAnswersForQ4, scorsCount: 1),
    Score(currentScore: rightAnswersForQ5, scorsCount: 1),
    Score(currentScore: rightAnswersForQ6, scorsCount: 1),
    Score(currentScore: rightAnswersForQ7, scorsCount: 1),
    Score(currentScore: rightAnswersForQ8, scorsCount: 1),
    Score(currentScore: rightAnswersForQ9, scorsCount: 1),
    Score(currentScore: rightAnswersForQ10, scorsCount: 1),
    Score(currentScore: rightAnswersForQ11, scorsCount: 1),
    Score(currentScore: rightAnswersForQ12, scorsCount: 1),
  ];

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

  static final GlobalKey globalKeyV1Q1 = GlobalKey();
  static final GlobalKey globalKeyV2Q1 = GlobalKey();
  static final GlobalKey globalKeyV3Q1 = GlobalKey();
  static final GlobalKey globalKeyV4Q1 = GlobalKey();
  static final GlobalKey globalKeyV5Q1 = GlobalKey();

  static List<QuizItem> quizItemListQ1 = [
    QuizItem(
      question: Question(key: globalKeyA1Q1),
      target: Target(
        key: globalKeyV1Q1,
      ),
    ),
    QuizItem(
      question: Question(key: globalKeyA2Q1),
      target: Target(
        key: globalKeyV2Q1,
      ),
    ),
    QuizItem(
      question: Question(key: globalKeyA3Q1),
      target: Target(
        key: globalKeyV3Q1,
      ),
    ),
    QuizItem(
      question: Question(key: globalKeyA4Q1),
      target: Target(
        key: globalKeyV4Q1,
      ),
    ),
    QuizItem(
      question: Question(key: globalKeyA5Q1),
      target: Target(
        key: globalKeyV5Q1,
      ),
    ),
  ];
  static List<Widget> targetListQ1 = [];
  static List<Widget> dragalbeListQ1 = [];
  static final List<Answers<int>> answersForQ1 = [
    Answers(
        globalKey: globalKeyA1Q1,
        value: 1,
        image: AssetsPath.democracy,
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: 2,
        globalKey: globalKeyA2Q1,
        image: AssetsPath.humours,
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 3,
        globalKey: globalKeyA3Q1,
        image: AssetsPath.ostracism,
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 4,
        globalKey: globalKeyA4Q1,
        image: AssetsPath.philosophy,
        correctAnswers: CorrectAnswers.answer4),
    Answers(
        value: 5,
        globalKey: globalKeyA5Q1,
        image: AssetsPath.typhus,
        correctAnswers: CorrectAnswers.answer5),
  ];

  // static final List<String> imagesForQ1 = [
  //   AssetsPath.nikos,
  //   AssetsPath.nikos,
  //   AssetsPath.nikos,
  //   AssetsPath.nikos,
  //   AssetsPath.nikos
  //   // AssetsPath.democracy,
  //   // AssetsPath.humours,
  //   // AssetsPath.ostracism,
  //   // AssetsPath.philosophy,
  //   // AssetsPath.typhus
  // ];
  static final List<Answers<int>> variantsForQ1 = [
    Answers(
      value: 5,
      globalKey: globalKeyV1Q1,
      text:
          "A infectious disease often carried by fleas, lice, or mites, which are themselves carried by small animals… and people. ",
      correctAnswers: CorrectAnswers.answer3,
    ),
    Answers(
      value: 4,
      globalKey: globalKeyV2Q1,
      text:
          "Meaning literally “the love of wisdom,” the pursuit of answers to big questions, such as what it mean to lead a good life. ",
      correctAnswers: CorrectAnswers.answer4,
    ),
    Answers(
      value: 3,
      globalKey: globalKeyV3Q1,
      text:
          "A type of politics invented in Athens in the 5th Century. It allowed citizens to decide how their city would be governed. ",
      correctAnswers: CorrectAnswers.answer1,
    ),
    Answers(
      value: 2,
      globalKey: globalKeyV4Q1,
      text:
          "A democratic vote that could expel a citizen from Athens for up to ten years. Though designed to prevent a citizen from becoming a tyrant, was often abused in factional politics.",
      correctAnswers: CorrectAnswers.answer3,
    ),
    Answers(
      value: 1,
      globalKey: globalKeyV5Q1,
      text:
          "Thought to determine a person’s health and temperment; an imbalance could lead a person to become ill. ",
      correctAnswers: CorrectAnswers.answer5,
    ),
  ];
  static List<DrowLineWidget> userAnswerWithCheckForQ1 = [];
  static List<bool> allAnswersAreRight1 = [true];
  static List<DrowLineWidget> userAnswerForQ1 = [];
  static bool valueForDrowColoredLineFor = false;

  ///[QUESTION 2]
  ///
  static final List<Answers<int>> answersForQ2 = [
    Answers(
        value: 1,
        text:
            "Hippocrates, the “Father of Medicine,” the master physician under whom he had trained."),
    Answers(
        isCorrect: true,
        value: 2,
        text:
            "Raphael, the archangel, identified with healing, visited Abraham at the Oak of Mamre."),
    Answers(
        value: 3,
        text:
            "Apollo, the Greek god of the Sun, and also of medicine, healing, and diseases."),
    Answers(
        value: 4,
        text:
            "Asclepius, son of Apollo. A healer, he carried a snake-entwined staff, a symbol of medicine"),
  ];

  ///[QUESTION 3]
  ///

  static List<Answers> answersForDD3Images = [
    Answers(value: 1, text: "PHIDIAS"),
    Answers(value: 2, text: "ARISTOPHANES AND SOPHOCLES"),
    Answers(value: 3, text: "THUCYDIDES"),
    Answers(value: 4, text: "SOCRATES AND PLATO"),
    Answers(value: 5, text: "PERICLES"),
  ];

  static final List<Answers<int>> answersForQ7 = [
    Answers(
        value: 1,
        text:
            "Here it becomes clear that although Hippocrates and his pupils established a new way of practicing medicine, that involved observation and diagnosis, the supernatural and the spiritual still fulfilled a prominent role in the treatment of illnesses."),
    Answers(
        isCorrect: true,
        value: 2,
        text:
            'The germ theory of disease states that microorganisms known as pathogens or "germs" can lead to disease. These small organisms, too small to see without magnification, invade humans, other animals, and other living hosts. Their growth and reproduction within their hosts can cause disease.'),
    Answers(
        value: 3,
        text:
            "Although the gods are invoked, the Hippocratic approach to medicine was marked by attempts to distance the attribution of illness to the gods and other superstitious factors. Illness was the result of physical and environmental factors. This could include the environment in which one lived, as well as what people ate."),
    Answers(
        value: 4,
        text:
            "One of the most important principles contained within the Hippocratic Oath, and underpins much of medical ethics: the commitment not to cause harm to the patient. One can find this principle expressed in the term “First, do no harm” (or sometimes in Latin: primum non nocere). As is clear from this papyrus document, the principle existed even in antiquity."),
  ];

  static final List<Answers<int>> answersForQ10 = [
    Answers(
        value: 1,
        text:
            "Thucydides describes how the disease began in the patient’s head. It could attack anyone, including those who were previously healthy. Eyes would become red and irritated, and a strong fever would set in, increasing the patient’s temperature."),
    Answers(
        value: 2,
        text:
            'The illness then spread lower, affecting the throat which would become inflamed and painful. Sneezing, coughing, and general hoarseness followed soon after, along with a ferocious, debilitating cough. Thucydides also describes that victims of the disease, with their throat inflamed, suffered from terrible breath, which became “unnatural and malodorous.”'),
    Answers(
        value: 3,
        text:
            "As they suffered from this debilitating coughing, the sufferers of the plague found themselves weakened further by constant retching. Thucydides describes how, “in a short time, the affliction descended to the chest… when it became established in the heart”. This demonstrates the limits of ancient medicine and anatomy, as the symptoms the historian describes do not point to cardiac symptoms, but rather the disease affecting the lungs."),
    Answers(
        isCorrect: true,
        value: 4,
        text:
            "Human immunodeficiency virus infection and acquired immunodeficiency syndrome is a spectrum of conditions caused by infection with a retrovirus. By damaging the immune system, this sexually transmitted infection interferes with the body's ability to fight disease. "),
  ];

  static final List<Answers<int>> answersForQ13 = [
    Answers(value: 1, image: AssetsPath.nikosChoose1, checked: false),
    Answers(value: 2, image: AssetsPath.nikosChoose2, checked: true),
    Answers(value: 3, image: AssetsPath.nikosChoose3, checked: true),
  ];

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

  static final GlobalKey globalKeyV1Q4 = GlobalKey();
  static final GlobalKey globalKeyV2Q4 = GlobalKey();
  static final GlobalKey globalKeyV3Q4 = GlobalKey();
  static final GlobalKey globalKeyV4Q4 = GlobalKey();
  static List<DrowLineWidget> userAnswerWithCheckForQ4 = [];
  static List<DrowLineWidget> userAnswerForQ4 = [];

  static List<QuizItem> quizItemListQ4 = [
    QuizItem(
      question: Question(key: globalKeyA1Q4),
      target: Target(
        key: globalKeyV1Q4,
      ),
    ),
    QuizItem(
      question: Question(key: globalKeyA2Q4),
      target: Target(
        key: globalKeyV2Q4,
      ),
    ),
    QuizItem(
      question: Question(key: globalKeyA3Q4),
      target: Target(
        key: globalKeyV3Q4,
      ),
    ),
    QuizItem(
      question: Question(key: globalKeyA4Q4),
      target: Target(
        key: globalKeyV4Q4,
      ),
    )
  ];
  static List<Widget> targetListQ4 = [];
  static List<Widget> dragalbeListQ4 = [];

  static final List<Answers<int>> answersForQ4 = [
    Answers(
        globalKey: globalKeyA1Q4,
        value: 1,
        text: '490 BC Battle of Marathon',
        image: AssetsPath.map490,
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: 2,
        globalKey: globalKeyA2Q4,
        text: '399 BC City of Athens',
        image: AssetsPath.map491,
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: 3,
        globalKey: globalKeyA3Q4,
        text: '430 BC Port of Piraeus',
        image: AssetsPath.map430,
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: 4,
        globalKey: globalKeyA4Q4,
        text: '461 BC Battle of Oenoe',
        image: AssetsPath.map461,
        correctAnswers: CorrectAnswers.answer4),
  ];

  static final List<Answers<int>> variantsForQ4 = [
    Answers(
      value: 1,
      globalKey: globalKeyV1Q4,
      text:
          "Combined Greek forces defeat the Persian invaders, led by Darius, at this location. Famous for the myth of Athenian runner, Pheidippides, who ran from the battleground to Athens to announce the Greek victory.",
      correctAnswers: CorrectAnswers.answer2,
    ),
    Answers(
      value: 2,
      globalKey: globalKeyV2Q4,
      text:
          "First Peloponnesian War begins here. Spartan forces are defeated by an alliance of two city states. Pericles emerges as leading political figure. ",
      correctAnswers: CorrectAnswers.answer2,
    ),
    Answers(
      value: 3,
      globalKey: globalKeyV3Q4,
      text:
          "The malady spread quickly from here. In a matter of weeks, the disease had spread to the heart of the city and was affecting people of all ages and backgrounds in alarmingly high numbers.",
      correctAnswers: CorrectAnswers.answer2,
    ),
    Answers(
      value: 4,
      globalKey: globalKeyV4Q4,
      text:
          "The trial and death of Socrates occurs here; the philosopher was convicted of corrupting the minds of the youth; rather than renounce his beliefs, he died willingly, discoursing on the immortality of the soul before drinking poisonous hemlock. ",
      correctAnswers: CorrectAnswers.answer4,
    ),
  ];

  // static final List<Answers<int>> answersDD4 = [
  //   Answers(
  //     value: 1,
  //     text: "Construction of the Parthenon in 447-432 BC. (ATHENS - Slide 25)",
  //     correctAnswers: CorrectAnswers.answer1,
  //     globalKey: globalKeyA1Q4,
  //   ),
  //   Answers(
  //     value: 2,
  //     text:
  //         "The 'First' Peloponnesian War begins in 461. (ATHENS, SPARTA, OENOE - Slide 19)",
  //     correctAnswers: CorrectAnswers.answer2,
  //     globalKey: globalKeyA2Q4,
  //   ),
  //   Answers(
  //       value: 3,
  //       globalKey: globalKeyA3Q4,
  //       text: "The Sicilian Expedition in 413 BC. (SICILY)",
  //       correctAnswers: CorrectAnswers.answer3),
  //   Answers(
  //       value: 4,
  //       globalKey: globalKeyA4Q4,
  //       text:
  //           "The Greeks defeat the Persians at the Battle of Marathon in 490 BC. (MARATHON - SLIDE 12)",
  //       correctAnswers: CorrectAnswers.answer4),
  //   Answers(
  //       value: 5,
  //       globalKey: globalKeyA5Q4,
  //       text:
  //           "The Athenians establlish the Delian League in 477 BC. (DELOS - Slide 15)",
  //       correctAnswers: CorrectAnswers.answer5),
  // ];

  // static final List<Answers<int>> answerDD4 = [
  //   Answers(
  //       value: 5,
  //       globalKey: globalKeyV5Q4,
  //       text: "assets/map/map477image.png",
  //       correctAnswers: CorrectAnswers.answer5),
  //   Answers(
  //       value: 3,
  //       globalKey: globalKeyV3Q4,
  //       text: "assets/map/map413image.png",
  //       correctAnswers: CorrectAnswers.answer3),
  //   Answers(
  //       value: 2,
  //       globalKey: globalKeyV2Q4,
  //       text: "assets/map/map461image.png",
  //       correctAnswers: CorrectAnswers.answer2),
  //   Answers(
  //       value: 1,
  //       globalKey: globalKeyV1Q4,
  //       text: "assets/map/map447_432image.png",
  //       correctAnswers: CorrectAnswers.answer1),
  //   Answers(
  //       value: 4,
  //       globalKey: globalKeyV4Q4,
  //       text: "assets/map/map490image.png",
  //       correctAnswers: CorrectAnswers.answer4),
  // ];

  static List<dynamic> userAnswerForQ5 = [];
  static List<dynamic> userAnswerForQ8 = [];

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

  static List<dynamic> usersAnswersForQ11 = [];

  static List<Answers> userAnswer1ForQ2 = [];
  static List<Answers> userAnswer2ForQ2 = [];
  static List<Answers> userAnswer3ForQ2 = [];
  static List<Answers> userAnswer4ForQ2 = [];
  static List<Answers> userAnswer5ForQ2 = [];
  static List<Answers> userAnswer6ForQ2 = [];
  static List<Answers> userAnswer7ForQ2 = [];
  static List<Answers> userAnswer8ForQ2 = [];

  // static final List<dynamic> listQuestionBody2 = [
  //   'Hippocrates suggested that the body contained four',
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer1ForQ2,
  //       isRight: null,
  //       correctAnswer: 'humours'),
  //   '. These were vital bodily fluids that kept people healthy if they were kept',
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer2ForQ2,
  //       isRight: null,
  //       correctAnswer: 'balanced'),
  //   '. He studied the body through ',
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer3ForQ2,
  //       isRight: null,
  //       correctAnswer: 'phlegm'),
  //   '. They are: blood, ',
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer4ForQ2,
  //       isRight: null,
  //       correctAnswer: 'black'),
  //   ",",
  //   'bile, yellow',
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer5ForQ2,
  //       isRight: null,
  //       correctAnswer: 'bile'),
  //   'A person became sick if they had too much, or not enough, of one of these fluids. The aim was to keep them level. This was called  ',
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer6ForQ2,
  //       isRight: null,
  //       correctAnswer: 'eucrasia'),
  //   ' in Greek.',
  // ];

  static List<Answers> answersForDD2 = [
    Answers(value: 1, text: "humours"),
    Answers(value: 2, text: "balanced"),
    Answers(value: 3, text: "phlegm"),
    Answers(value: 4, text: "black"),
    Answers(value: 5, text: "bile"),
    Answers(value: 6, text: "eucrasia"),
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

  static List<Answers> userAnswer1ForQ5 = [];
  static List<Answers> userAnswer2ForQ5 = [];
  static List<Answers> userAnswer3ForQ5 = [];
  static List<Answers> userAnswer4ForQ5 = [];
  static List<Answers> userAnswer5ForQ5 = [];
  static List<Answers> userAnswer6ForQ5 = [];
  static List<Answers> userAnswer7ForQ5 = [];
  static List<Answers> userAnswer8ForQ5 = [];

  static List<Answers> userAnswer1ForQ8 = [];
  static List<Answers> userAnswer2ForQ8 = [];
  static List<Answers> userAnswer3ForQ8 = [];
  static List<Answers> userAnswer4ForQ8 = [];
  static List<Answers> userAnswer5ForQ8 = [];
  static List<Answers> userAnswer6ForQ8 = [];
  static List<Answers> userAnswer7ForQ8 = [];
  static List<Answers> userAnswer8ForQ8 = [];

  static List<Answers> userAnswer1ForQ11 = [];
  static List<Answers> userAnswer2ForQ11 = [];
  static List<Answers> userAnswer3ForQ11 = [];
  static List<Answers> userAnswer4ForQ11 = [];
  static List<Answers> userAnswer5ForQ11 = [];
  static List<Answers> userAnswer6ForQ11 = [];
  static List<Answers> userAnswer7ForQ11 = [];
  static List<Answers> userAnswer8ForQ11 = [];



  static List<Answers> answersForDD8 = [
    Answers(value: 1, text: "justice"),
    Answers(value: 2, text: "sentence"),
    Answers(value: 3, text: "lawlessness"),
    Answers(value: 4, text: "enjoyment"),
    Answers(value: 5, text: "distinction"),
  ];

  // static List<Answers> answersForDD3 = [
  //   Answers(value: 1, text: "slaves"),
  //   Answers(value: 2, text: "demos"),
  //   Answers(value: 3, text: "oligarchy"),
  //   Answers(value: 4, text: "Women"),
  //   Answers(value: 5, text: "metics"),
  //   Answers(value: 6, text: "power"),
  //   Answers(value: 7, text: "King"),
  //   Answers(value: 8, text: "citizens"),
  // ];

  static List<DragWordsWidget> dragWordsWidget3 = [
    DragWordsWidget(
        answers: userAnswer1ForQ3,
        isRight: null,
        correctAnswer: 'PERICLES'),
    DragWordsWidget(
        answers: userAnswer2ForQ3,
        isRight: null,
        correctAnswer: 'THUCYDIDES'),
    DragWordsWidget(
        answers: userAnswer3ForQ3,
        isRight: null,
        correctAnswer: 'SOCRATES AND PLATO'),
    DragWordsWidget(
        answers: userAnswer4ForQ3,
        isRight: null,
        correctAnswer: 'ARISTOPHANES AND SOPHOCLES'),
    DragWordsWidget(
        answers: userAnswer5ForQ3,
        isRight: null,
        correctAnswer: 'PHIDIAS'),
  ];

  static List<DragWordsWidget> dragWordsWidget11 = [
    DragWordsWidget(
        answers: userAnswer1ForQ11,
        isRight: null,
        correctAnswer: 'SMALLPOX'),
    DragWordsWidget(
        answers: userAnswer2ForQ11,
        isRight: null,
        correctAnswer: 'EBOLA'),
    DragWordsWidget(
        answers: userAnswer3ForQ11,
        isRight: null,
        correctAnswer: 'TYPHOID'),
    DragWordsWidget(
        answers: userAnswer4ForQ11,
        isRight: null,
        correctAnswer: 'BUBONIC PLAGUE'),
    DragWordsWidget(
        answers: userAnswer5ForQ11,
        isRight: null,
        correctAnswer: 'TYPHUS'),
  ];




    static List<Answers> answersForDD5 = [
    Answers(value: 1, text: "bile"),
    Answers(value: 2, text: "Hippocrates"),
    Answers(value: 3, text: "phlegm"),
    Answers(value: 4, text: "Health"),
    Answers(value: 5, text: "black"),
    Answers(value: 6, text: "Pain"),
    Answers(value: 7, text: "Humours"),
  ];
  
  static List<dynamic> listQuestionBody5 = [
    DragWordsWidget(
        answers: userAnswer1ForQ5,
        isRight: null,
        correctAnswer: 'Hippocrates'),
    " is famous for his theory of the Four ",
    DragWordsWidget(
        answers: userAnswer2ForQ5,
        isRight: null,
        correctAnswer: 'Humours'),
    " In On the Nature of Man, ",
    " he describes the theory as follows: ",
    SizedBox(),
    " “The Human body contains blood, ",
    DragWordsWidget(
        answers: userAnswer3ForQ5,
        isRight: null,
        correctAnswer: 'phlegm'),
    " , yellow ",
    DragWordsWidget(
        answers: userAnswer4ForQ5,
        isRight: null,
        correctAnswer: 'bile'),
    ", and",
    DragWordsWidget(
        answers: userAnswer5ForQ5,
        isRight: null,
        correctAnswer: 'black'),
    " bile",
    "These are the things that make up its constitution and cause its pains and health.",
    DragWordsWidget(
        answers: userAnswer6ForQ5,
        isRight: null,
        correctAnswer: 'Health'),
    " is primarily that state in which these... substances are in the correct proportion to each other, both in strength and quantity, and are well mixed.",
    DragWordsWidget(
        answers: userAnswer7ForQ5,
        isRight: null,
        correctAnswer: 'Pain'),
    "occurs when one of the substances",
    "  presents either a deficiency or an excess,",
    " or is separated in the body and not mixed with others.” "
  ];

  static List<dynamic> listQuestionBody8 = [
    "In History of the Peloponnesian War, Thucydides comments on the role of plague and political upheaval as follows:",
    "\n",
    "“In other respects too, the plague was the beginning of increased ",
    DragWordsWidget(
        answers: userAnswer1ForQ8,
        isRight: null,
        correctAnswer: 'lawlessness'),
    "in the city... No fear of god or human law was any constraint.",
    " Pious or impious made no difference in their view, when they could see all dying without",
    DragWordsWidget(
        answers: userAnswer2ForQ8,
        isRight: null,
        correctAnswer: 'distinction'),
    ". As for offences against the law, no one expected",
    " to live long enough ",
    "to be brought to ",
    DragWordsWidget(
        answers: userAnswer3ForQ8,
        isRight: null,
        correctAnswer: 'justice'),
    "and pay the penalty: they thought that a much heavier",
    DragWordsWidget(
        answers: userAnswer4ForQ8,
        isRight: null,
        correctAnswer: 'sentence'),
    "had already been passed ",
    "and was hanging over them, so that might as well have some",
    DragWordsWidget(
        answers: userAnswer5ForQ8,
        isRight: null,
        correctAnswer: 'enjoyment'),
    " of life before it fell.”",
  ];

  static final List<Map<String, dynamic>> listQuestion3WithImages = [
    {
      "image": AssetsPath.pericles,
      "text":
          "General, statesman, orator. Led the Athenian state during its Golden Age."
    },
    {
      "image": AssetsPath.thucydides,
      "text":
          "Wrote the “History of the Peloponnesian War,” the primary source for the Plague of Athens."
    },
    {
      "image": AssetsPath.socratesPlato,
      "text":
          "Two of the most influential philosophers in history. Much of what we know about one is filtered through the dialogues of the other."
    },
    {
      "image": AssetsPath.sophoclesAristophanes,
      "text":
          "Two of the most influential playwrights in history. One wrote haunting tragedies and the other wrote comedies that satirized Athenian society and politics."
    },
    {
      "image": AssetsPath.phidias,
      "text":
          "A polymath who was a gifted painter, architect, and sculptor. Designed the Statue of Olympian Zeus, one of the Seven Wonders of the Ancient World."
    }
  ];

  static final List<Map<String, dynamic>> listQuestion11WithImages = [
    {
      "image": AssetsPath.smallpox,
      "text":
          "A disease that is sometimes attributed to the Plague of Athens. Although responsible for killing masses of people throughout history, including devastating effects on the indigenous peoples of the Americas, it does not appear to be the most likely suspect here. "
    },
    {
      "image": AssetsPath.ebola,
      "text":
          "Type of viral haemorrhagic fever (VHF), has also been identified as a possible suspect for the plague of Athens. What can be said with some confidence, is that the disease could have spread from Africa to Greece as a result of the virus’ incubation period."
    },
    {
      "image": AssetsPath.typiod,
      "text":
          "DNA evidence drawn from the roots of teeth recovered from mass burial sites uncovered in the city of Athens have indicated that this disease was the most likely culprit. A number of the symptoms are recognisable from the historical narrative, including a high fever, diarrhoea, and headaches."
    },
    {
      "image": AssetsPath.plague,
      "text":
          "The plague of Athens was for a long time attributed to a form of this disease, which devastated Europe in the Middle Ages. It is caused by the bacterium Yersinia pestis, spread by fleas, but it can also take a secondary form where it is spread person-to-person contact via aerosols. Highly contagious. "
    },
    {
      "image": AssetsPath.typhusFever,
      "text":
          "A common culprit when investigating the plague of Athens, due to the similarity of known symptoms with those described by Thucydides. Known to develop in places suffering the effects of war and squalid, cramped conditions. Some patients that survive suffer gangrene in their extremities, another symptom from Thucydides’ account."
    }
  ];

  // static final List<dynamic> listQuestionBody3 = [
  //   "In the 5th century BC, Athens was a democracy. It was not a monarchy, ruled by a '",
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer1ForQ3,
  //       isRight: null,
  //       correctAnswer: 'King'),
  //   ", nor was it ruled by a small band of aristocrats (an ",
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer2ForQ3,
  //       isRight: null,
  //       correctAnswer: 'oligarchy'),
  //   "). Instead, the people represented themselves.\n Democracy derives from two Greek words ",
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer3ForQ3,
  //       isRight: null,
  //       correctAnswer: 'demos'),
  //   " meaning people, and kratos, which means ",
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer4ForQ3,
  //       isRight: null,
  //       correctAnswer: 'power'),
  //   "Athenian democracy was very different to modern democracy, however. Only adult male ",
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer5ForQ3,
  //       isRight: null,
  //       correctAnswer: 'citizens'),
  //   " could take part. ",
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer6ForQ3,
  //       isRight: null,
  //       correctAnswer: 'Women'),
  //   " and non-Athenians ",
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer7ForQ3,
  //       isRight: null,
  //       correctAnswer: 'slaves'),
  //   " were excluded. ",
  //   DragWordsWidget(
  //       answers: QuizData.userAnswer8ForQ3,
  //       isRight: null,
  //       correctAnswer: 'metics'),
  // ];

  // static final List<dynamic> correctAnswersForQ3 = [
  //   "In the 5th century BC, Athens was a democracy. It was not a monarchy, ruled by a '",
  //   ['King'],
  //   ", nor was it ruled by a small band of aritocrats (an ",
  //   ['oligarchy'],
  //   "). Instead, the people represented themselves.\n Democracy derives from two Greek words ",
  //   ['demos'],
  //   " meaning people, and kratos, which means ",
  //   ['power'],
  //   "Athenian democracy was very different to modern democracy, however. Only adult male ",
  //   ['citizens'],
  //   " could take part. ",
  //   ['Women'],
  //   " and non-Athenians ",
  //   ['slaves'],
  //   " were excluded. ",
  //   ['metics'],
  // ];

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
      correctAnswer: "Roman",
      answers: userAnswer1ForQ7,
      isRight: null,
    ),
    ' doctor who was influenced by and developed the theories of ',
    DragWordsWidget(
      correctAnswer: "Hippocrates",
      answers: userAnswer2ForQ7,
      isRight: null,
    ),
    '. He studied the body through ',
    DragWordsWidget(
      correctAnswer: "dissection",
      answers: userAnswer3ForQ7,
      isRight: null,
    ),
    '. Because this was illegal, he encouraged his students to investigate the corpses of ',
    DragWordsWidget(
      correctAnswer: "gladiators",
      answers: userAnswer4ForQ7,
      isRight: null,
    ),
    "'!\n'",
    'Galen also lived through a ',
    DragWordsWidget(
      correctAnswer: "plague",
      answers: userAnswer5ForQ7,
      isRight: null,
    ),
    "  . His ideas were very influential, and were only challenged and developed during the ",
    DragWordsWidget(
      correctAnswer: "Renaissance",
      answers: userAnswer6ForQ7,
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
  static List<CheckBoxWidget<bool>> usersAnswersForQ12 = [];
  static List<CheckBoxWidget<bool>> usersAnswersForQ9 = [];
  static final List<CorrectAnswers> correctAnswersForQ12 = [
    CorrectAnswers.answer2,
    CorrectAnswers.answer4,
    CorrectAnswers.answer5
  ];

  static final List<CheckBoxWidget<bool>> answersForQuestion8 = [
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "This panting is called the 'Death of Plato'.",
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
          text: "This was painted by Jacques-Louis David.",
          correctAnswers: CorrectAnswers.answer3),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "This is a panting by Leonardo da Vinci.",
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
          text: "Socrates was sentenced to death for murder.",
          correctAnswers: CorrectAnswers.answer6),
      isRight: null,
    ),
  ];

  static List<CheckBoxWidget<bool>> answersForQuestion12 = [
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "The painting is called the “Death of Nero”",
          correctAnswers: CorrectAnswers.answer1),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          isCorrect: true,
          value: false,
          text: "It was painted by Jacques-Louis David",
          correctAnswers: CorrectAnswers.answer2),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "It was painted in real time during the trial",
          correctAnswers: CorrectAnswers.answer3),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text: "His last words were: “what an artist dies with me”",
          correctAnswers: CorrectAnswers.answer4),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          isCorrect: true,
          value: false,
          text:
              "He was sentenced to death for corrupting the minds of the youth ",
          correctAnswers: CorrectAnswers.answer5),
      isRight: null,
    ),
  ];

  static List<CheckBoxWidget<bool>> answersForQuestion9 = [
    CheckBoxWidget(
      answers: Answers(
          value: false,
          isCorrect: true,
          text:
              "Thucydides infers that Athens’ naval connections was the gateway through which the plague – whatever it was – entered into the city.",
          correctAnswers: CorrectAnswers.answer1),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text:
              "Smallpox arrived in the Americas via the Caribbean, inadvertently carried by Spanish colonizers from Europe. Native populations, lacking immunity, were devastated by the disease. ",
          correctAnswers: CorrectAnswers.answer2),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          isCorrect: true,
          value: false,
          text:
              "The disease arrived in the port of Piraeus, connected to the city by the Long Walls, and spread to Athens from there. ",
          correctAnswers: CorrectAnswers.answer3),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          value: false,
          text:
              "The Silk Road brought goods, spices, and new ideas from China and Central Asia to Europe. The trade also carried the deadly bubonic plague that killed half of all Europeans within 7 years.",
          correctAnswers: CorrectAnswers.answer4),
      isRight: null,
    ),
    CheckBoxWidget(
      answers: Answers(
          isCorrect: true,
          value: false,
          text:
              "Fearing a Spartan invasion, Athenians and people from the surrounding countryside retreated behind the city walls. The city’s population – already dense – exploded in number. An overcrowded Athens became an ideal environment for the novel disease to spread.",
          correctAnswers: CorrectAnswers.answer5),
      isRight: null,
    ),
  ];

  ///[QUESTION 5]
  /// users Answer List and Correct Answers
  ///List for question body widget

  // static bool valueQ5 = false;

  static bool valueQ13 = false;

  static List<bool> question2Cheking = [false, false, false, false];
  static List<bool> question7Cheking = [false, false, false, false];
  static List<bool> question10Cheking = [false, false, false, false];
  static int rightAnswerValueQ2 = 2;
  static int valueQ6 = -1;
  static int valueQ5 = 1;

  static int valueQ3 = 1;
  static int valueQ11 = 1;
  static int valueQ8 = 1;

  static const int correctAnswerQ5 = 4;

  static List<Answers<int>> answersForQ11 = [
    Answers(value: 1, text: "BUBONIC PLAGUE"),
    Answers(value: 2, text: "TYPHUS"),
    Answers(value: 3, text: "SMALLPOX"),
    Answers(value: 4, text: "TYPHOID"),
    Answers(value: 5, text: "EBOLA"),
  ];

  ///[QUESTION 6]
  /// users Answer List and Correct Answers
  ///List for question body widget
  static const int correctAnswerQ6 = 4;
  // static int valueQ6 = -1;

  static final List<Answers<int>> answersForQ6 = [
    Answers(value: 1, text: "Thucydides"),
    Answers(value: 2, text: "Socrates"),
    Answers(value: 3, text: "Cleisthenes"),
    Answers(value: 4, text: "Pericles"),
  ];

  ///[question 10]
  static final List<CheckBoxWidget<int>> answersForQuestion6 = [
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
  static int usersAnswersForQ6 = 0;
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
  static int rightAnswersForQ11 = 0;
  static int rightAnswersForQ12 = 0;
  static int rightAnswersForQ9 = 0;
  static int rightAnswersForQ10 = 0;

  /// [CHECK ALL ANSWERS]
  static void checkUerAnswers() {
    rightAnswersForQ1 = firstDragDropResult == 5 ? 1 : 0;
    rightAnswersForQ4 = secondDragDropResult == 4 ? 1 : 0;
    rightAnswersForQ11 += thirdDragResult;

    if (question2Cheking[1] == true) {
      rightAnswersForQ2 = 1;
    }

    if (question7Cheking[1] == true) {
      rightAnswersForQ7 = 1;
    }

    if (question10Cheking[3] == true) {
      rightAnswersForQ10 = 1;
    }

    if (answersForQuestion9[0].answers.value == true &&
        answersForQuestion9[2].answers.value == true &&
        answersForQuestion9[4].answers.value == true) {
      rightAnswersForQ9 = 1;
    }

    if (answersForQuestion12[1].answers.value == true &&
        answersForQuestion12[4].answers.value == true) {
      rightAnswersForQ12 = 1;
    }

    if (valueQ6 == 1) {
      rightAnswersForQ6 = 1;
    }

    listQuestionBody5.forEach((element) {
      if (element is DragWordsWidget) {
        if (element.answers.isEmpty) {
          valueQ5 = 0;
          userAnswerForQ5.add(DragWordsWidget(
              answers: [Answers(value: 0, text: '')],
              isRight: false,
              correctAnswer: element.correctAnswer));
          //  print('add null');
        } else {
          if (element.answers.first.text != element.correctAnswer) {
            valueQ5 = 0;
            element.isRight = false;
          }
          // print("EditText::::: ${element.controller.text}");
          userAnswerForQ5.add(element);
        }
      } else {
        // print('Text:::: $element');
        userAnswerForQ5.add(element);
      }
    });
    rightAnswersForQ5 = valueQ5;

    dragWordsWidget3.forEach((element) {
      if (element.answers.isEmpty) {
        valueQ3 = 0;
        usersAnswersForQ3.add(DragWordsWidget(
            answers: [Answers(value: 0, text: '')],
            isRight: false,
            correctAnswer: element.correctAnswer));
      } else {
        if (element.answers.first.text != element.correctAnswer) {
          valueQ3 = 0;
          element.isRight = false;
          usersAnswersForQ3.add(element);
        }
      }
    });
    rightAnswersForQ3 = valueQ3;

    dragWordsWidget11.forEach((element) {
      if (element.answers.isEmpty) {
        valueQ11 = 0;
        usersAnswersForQ11.add(DragWordsWidget(
            answers: [Answers(value: 0, text: '')],
            isRight: false,
            correctAnswer: element.correctAnswer));
      } else {
        if (element.answers.first.text != element.correctAnswer) {
          valueQ11 = 0;
          element.isRight = false;
          usersAnswersForQ11.add(element);
        }
      }
    });
    rightAnswersForQ11 = valueQ11;

    listQuestionBody8.forEach((element) {
      if (element is DragWordsWidget) {
        if (element.answers.isEmpty) {
          valueQ8 = 0;
          userAnswerForQ8.add(DragWordsWidget(
              answers: [Answers(value: 0, text: '')],
              isRight: false,
              correctAnswer: element.correctAnswer));
          //  print('add null');
        } else {
          if (element.answers.first.text != element.correctAnswer) {
            element.isRight = false;
            valueQ8 = 0;
          }
          // print("EditText::::: ${element.controller.text}");
          userAnswerForQ8.add(element);
        }
      } else {
        // print('Text:::: $element');
        userAnswerForQ8.add(element);
      }
    });
    rightAnswersForQ8 = valueQ8;

    listQuestionBody7.forEach((element) {
      if (element is DragWordsWidget) {
        if (element.answers.isEmpty) {
          // print("correctAnswer in ${element.correctAnswer}");
          usersAnswersForQ7.add(DragWordsWidget(
              correctAnswer: element.correctAnswer,
              answers: [Answers(value: 0, text: '')],
              isRight: false));
        } else {
          usersAnswersForQ7.add(element);
        }
      } else {
        usersAnswersForQ7.add(element);
      }
    });


    finalScore = rightAnswersForQ1 +
        rightAnswersForQ2 +
        rightAnswersForQ3 +
        rightAnswersForQ4 +
        rightAnswersForQ5 +
        rightAnswersForQ6 +
        rightAnswersForQ7 +
        rightAnswersForQ8 +
        rightAnswersForQ9 +
        rightAnswersForQ10 +
        rightAnswersForQ11 +
        rightAnswersForQ12;

    listScore = [
      Score(currentScore: rightAnswersForQ1, scorsCount: 1),
      Score(currentScore: rightAnswersForQ2, scorsCount: 1),
      Score(currentScore: rightAnswersForQ3, scorsCount: 1),
      Score(currentScore: rightAnswersForQ4, scorsCount: 1),
      Score(currentScore: rightAnswersForQ5, scorsCount: 1),
      Score(currentScore: rightAnswersForQ6, scorsCount: 1),
      Score(currentScore: rightAnswersForQ7, scorsCount: 1),
      Score(currentScore: rightAnswersForQ8, scorsCount: 1),
      Score(currentScore: rightAnswersForQ9, scorsCount: 1),
      Score(currentScore: rightAnswersForQ10, scorsCount: 1),
      Score(currentScore: rightAnswersForQ11, scorsCount: 1),
      Score(currentScore: rightAnswersForQ12, scorsCount: 1),
    ];
  }

  static void clearAnswers() {
    listCorrectrAnswersQuestion1 = [];
    question2Cheking = [false, false, false, false];
    question7Cheking = [false, false, false, false];
    question10Cheking = [false, false, false, false];
    userAnswer1ForQ3 = [];
    userAnswer2ForQ3 = [];
    userAnswer3ForQ3 = [];
    userAnswer4ForQ3 = [];
    userAnswer5ForQ3 = [];
    userAnswer6ForQ3 = [];
    userAnswer7ForQ3 = [];
    userAnswer8ForQ3 = [];
    answersForDD3Images = [
      Answers(value: 1, text: "PHIDIAS"),
      Answers(value: 2, text: "ARISTOPHANES AND SOPHOCLES"),
      Answers(value: 3, text: "THUCYDIDES"),
      Answers(value: 4, text: "SOCRATES AND PLATO"),
      Answers(value: 5, text: "PERICLES"),
    ];
    dragWordsWidget3 = [
      DragWordsWidget(
          answers: userAnswer1ForQ3,
          isRight: null,
          correctAnswer: 'PERICLES'),
      DragWordsWidget(
          answers: userAnswer2ForQ3,
          isRight: null,
          correctAnswer: 'THUCYDIDES'),
      DragWordsWidget(
          answers: userAnswer3ForQ3,
          isRight: null,
          correctAnswer: 'SOCRATES AND PLATO'),
      DragWordsWidget(
          answers: userAnswer4ForQ3,
          isRight: null,
          correctAnswer: 'ARISTOPHANES AND SOPHOCLES'),
      DragWordsWidget(
          answers: userAnswer5ForQ3,
          isRight: null,
          correctAnswer: 'PHIDIAS'),
    ];

    listCorrectrAnswersQuestion4 = [];
    firstDragDropResult = 0;
    secondDragDropResult = 0;
    thirdDragResult = 0;
    listCorrectrAnswersQuestion9 = [];

    valueQ3 = 1;
    valueQ11 = 1;
    valueQ5 = 1;
    valueQ8 = 1;

    userAnswerForQ5 = [];
    userAnswer1ForQ5 = [];
    userAnswer2ForQ5 = [];
    userAnswer3ForQ5 = [];
    userAnswer4ForQ5 = [];
    userAnswer5ForQ5 = [];
    userAnswer6ForQ5 = [];
    userAnswer7ForQ5 = [];
    userAnswer8ForQ5 = [];
    
    listQuestionBody5 = [
      DragWordsWidget(
          answers: userAnswer1ForQ5,
          isRight: null,
          correctAnswer: 'Hippocrates'),
      " is famous for his theory of the Four ",
      DragWordsWidget(
          answers: userAnswer2ForQ5,
          isRight: null,
          correctAnswer: 'Humours'),
      " In On the Nature of Man, ",
      " he describes the theory as follows: ",
      SizedBox(),
      " “The Human body contains blood, ",
      DragWordsWidget(
          answers: userAnswer3ForQ5,
          isRight: null,
          correctAnswer: 'phlegm'),
      " , yellow ",
      DragWordsWidget(
          answers: userAnswer4ForQ5,
          isRight: null,
          correctAnswer: 'bile'),
      ", and",
      DragWordsWidget(
          answers: userAnswer5ForQ5,
          isRight: null,
          correctAnswer: 'black'),
      " bile",
      "These are the things that make up its constitution and cause its pains and health.",
      DragWordsWidget(
          answers: userAnswer6ForQ5,
          isRight: null,
          correctAnswer: 'Health'),
      " is primarily that state in which these... substances are in the correct proportion to each other, both in strength and quantity, and are well mixed.",
      DragWordsWidget(
          answers: userAnswer7ForQ5,
          isRight: null,
          correctAnswer: 'Pain'),
      "occurs when one of the substances",
      "  presents either a deficiency or an excess,",
      " or is separated in the body and not mixed with others.” "
    ];

    answersForDD5 = [
      Answers(value: 1, text: "bile"),
      Answers(value: 2, text: "Hippocrates"),
      Answers(value: 3, text: "phlegm"),
      Answers(value: 4, text: "Health"),
      Answers(value: 5, text: "black"),
      Answers(value: 6, text: "Pain"),
      Answers(value: 7, text: "Humours"),
    ];

    userAnswer1ForQ8 = [];
    userAnswer2ForQ8 = [];
    userAnswer3ForQ8 = [];
    userAnswer4ForQ8 = [];
    userAnswer5ForQ8 = [];
    userAnswer6ForQ8 = [];
    userAnswer7ForQ8 = [];
    userAnswer8ForQ8 = [];
    listQuestionBody8 = [
      "In History of the Peloponnesian War, Thucydides comments on the role of plague and political upheaval as follows:",
      "\n",
      "“In other respects too, the plague was the beginning of increased ",
      DragWordsWidget(
          answers: userAnswer1ForQ8,
          isRight: null,
          correctAnswer: 'lawlessness'),
      "in the city...",
      " No fear of",
      " god or human law ",
      "was any constraint. Pious or impious made ",
      "no difference in their view, when they could see all dying without",
      DragWordsWidget(
          answers: userAnswer2ForQ8,
          isRight: null,
          correctAnswer: 'distinction'),
      ". As for offences against the law, no one expected ",
      "to live long enough to be brought to ",
      DragWordsWidget(
          answers: userAnswer3ForQ8,
          isRight: null,
          correctAnswer: 'justice'),
      "and pay the penalty: they thought that a much heavier",
      DragWordsWidget(
          answers: userAnswer4ForQ8,
          isRight: null,
          correctAnswer: 'sentence'),
      "had already been passed and was hanging over them, so that might as well have some",
      DragWordsWidget(
          answers: userAnswer5ForQ8,
          isRight: null,
          correctAnswer: 'enjoyment'),
      " of life before it fell.”",
    ];

    userAnswerForQ8 = [];

    answersForDD8 = [
      Answers(value: 1, text: "justice"),
      Answers(value: 2, text: "sentence"),
      Answers(value: 3, text: "lawlessness"),
      Answers(value: 4, text: "enjoyment"),
      Answers(value: 5, text: "distinction"),
    ];

    answersForQuestion9 = [
      CheckBoxWidget(
        answers: Answers(
            value: false,
            isCorrect: true,
            text:
                "Thucydides infers that Athens’ naval connections was the gateway through which the plague – whatever it was – entered into the city.",
            correctAnswers: CorrectAnswers.answer1),
        isRight: null,
      ),
      CheckBoxWidget(
        answers: Answers(
            value: false,
            text:
                "Smallpox arrived in the Americas via the Caribbean, inadvertently carried by Spanish colonizers from Europe. Native populations, lacking immunity, were devastated by the disease. ",
            correctAnswers: CorrectAnswers.answer2),
        isRight: null,
      ),
      CheckBoxWidget(
        answers: Answers(
            isCorrect: true,
            value: false,
            text:
                "The disease arrived in the port of Piraeus, connected to the city by the Long Walls, and spread to Athens from there. ",
            correctAnswers: CorrectAnswers.answer3),
        isRight: null,
      ),
      CheckBoxWidget(
        answers: Answers(
            value: false,
            text:
                "The Silk Road brought goods, spices, and new ideas from China and Central Asia to Europe. The trade also carried the deadly bubonic plague that killed half of all Europeans within 7 years.",
            correctAnswers: CorrectAnswers.answer4),
        isRight: null,
      ),
      CheckBoxWidget(
        answers: Answers(
            isCorrect: true,
            value: false,
            text:
                "Fearing a Spartan invasion, Athenians and people from the surrounding countryside retreated behind the city walls. The city’s population – already dense – exploded in number. An overcrowded Athens became an ideal environment for the novel disease to spread.",
            correctAnswers: CorrectAnswers.answer5),
        isRight: null,
      ),
    ];

    answersForQuestion12 = [
      CheckBoxWidget(
        answers: Answers(
            value: false,
            text: "The painting is called the “Death of Nero”",
            correctAnswers: CorrectAnswers.answer1),
        isRight: null,
      ),
      CheckBoxWidget(
        answers: Answers(
            isCorrect: true,
            value: false,
            text: "It was painted by Jacques-Louis David",
            correctAnswers: CorrectAnswers.answer2),
        isRight: null,
      ),
      CheckBoxWidget(
        answers: Answers(
            value: false,
            text: "It was painted in real time during the trial",
            correctAnswers: CorrectAnswers.answer3),
        isRight: null,
      ),
      CheckBoxWidget(
        answers: Answers(
            value: false,
            text: "His last words were: “what an artist dies with me”",
            correctAnswers: CorrectAnswers.answer4),
        isRight: null,
      ),
      CheckBoxWidget(
        answers: Answers(
            isCorrect: true,
            value: false,
            text:
                "He was sentenced to death for corrupting the minds of the youth ",
            correctAnswers: CorrectAnswers.answer5),
        isRight: null,
      ),
    ];

    usersAnswersForQ9 = [];
    usersAnswersForQ12 = [];
    userAnswer1ForQ11 = [];
    userAnswer2ForQ11 = [];
    userAnswer3ForQ11 = [];
    userAnswer4ForQ11 = [];
    userAnswer5ForQ11 = [];
    userAnswer6ForQ11 = [];
    userAnswer7ForQ11 = [];
    userAnswer8ForQ11 = [];

    dragWordsWidget11 = [
      DragWordsWidget(
          answers: userAnswer1ForQ11,
          isRight: null,
          correctAnswer: 'SMALLPOX'),
      DragWordsWidget(
          answers: userAnswer2ForQ11,
          isRight: null,
          correctAnswer: 'EBOLA'),
      DragWordsWidget(
          answers: userAnswer3ForQ11,
          isRight: null,
          correctAnswer: 'TYPHOID'),
      DragWordsWidget(
          answers: userAnswer4ForQ11,
          isRight: null,
          correctAnswer: 'BUBONIC PLAGUE'),
      DragWordsWidget(
          answers: userAnswer5ForQ11,
          isRight: null,
          correctAnswer: 'TYPHUS'),
    ];

    answersForQ11 = [
      Answers(value: 1, text: "BUBONIC PLAGUE"),
      Answers(value: 2, text: "TYPHUS"),
      Answers(value: 3, text: "SMALLPOX"),
      Answers(value: 4, text: "TYPHOID"),
      Answers(value: 5, text: "EBOLA"),
    ];
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

    // usersAnswersForQ8.clear();

    usersAnswersForQ3 = [];

    // usersAnswersForQ10 = 0;

    answersForQuestion8.forEach((element) {
      if (element is CheckBoxWidget) {
        element.answers.value = false;
        element.isRight = null;
      }
    });

    // answersForQuestion10.forEach((element) {
    //   if (element is CheckBoxWidget) {
    //     element.isRight = null;
    //   }
    // });

    // listQuestionBody5.forEach((element) {
    //   if (element is DragWordsWidget) {
    //     if (element.answers.isNotEmpty) {
    //       answersForDD5.add(element.answers.first);
    //       element.answers.removeLast();
    //     }
    //   }
    // });

    // dragWordsWidget3.forEach((element) {
    //   if (element.answers.isNotEmpty) {
    //     answersForDD3Images.add(element.answers.first);
    //     element.answers.removeLast();
    //   }
    // });

    // listQuestionBody3.forEach((element) {
    //   if (element is DragWordsWidget) {
    //     if (element.answers.isNotEmpty) {
    //       answersForDD5.add(element.answers.first);
    //       element.answers.removeLast();
    //     }
    //   }
    // });

    listQuestionBody7.forEach((element) {
      if (element is DragWordsWidget) {
        if (element.answers.isNotEmpty) {
          answersForDD7.add(element.answers.first);
          element.answers.removeLast();
        }
      }
    });

    // valueQ5 = false;
    // valueQ6 = -1;
    valueQ6 = -1;
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
    listScore = [
      Score(currentScore: rightAnswersForQ1, scorsCount: 1),
      Score(currentScore: rightAnswersForQ2, scorsCount: 1),
      Score(currentScore: rightAnswersForQ3, scorsCount: 1),
      Score(currentScore: rightAnswersForQ4, scorsCount: 1),
      Score(currentScore: rightAnswersForQ5, scorsCount: 1),
      Score(currentScore: rightAnswersForQ6, scorsCount: 1),
      Score(currentScore: rightAnswersForQ7, scorsCount: 1),
      Score(currentScore: rightAnswersForQ8, scorsCount: 1),
    ];
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

class Score {
  final int currentScore;
  final int scorsCount;

  Score({required this.currentScore, required this.scorsCount});
}
