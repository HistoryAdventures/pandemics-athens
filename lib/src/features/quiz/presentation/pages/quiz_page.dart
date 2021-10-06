import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_circles.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_words.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_widget_edit_text.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_widget_radio_button.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/router.gr.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../question_widgets/quiz_widget_edit_text.dart';
import '../question_widgets/quiz_widget_radio_button.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  List<Answers> answersForQ1 = [
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
  List<Answers> variantsForQ1 = [
    Answers(value: 3, text: "430 BC", correctAnswers: CorrectAnswers.answer3),
    Answers(value: 4, text: "429 BC", correctAnswers: CorrectAnswers.answer4),
    Answers(value: 5, text: "415 BC", correctAnswers: CorrectAnswers.answer5),
    Answers(value: 2, text: "469 BC", correctAnswers: CorrectAnswers.answer2),
    Answers(value: 6, text: "404 BC", correctAnswers: CorrectAnswers.answer6),
    Answers(value: 1, text: "480 BC", correctAnswers: CorrectAnswers.answer1),
    Answers(value: 7, text: "508 BC", correctAnswers: CorrectAnswers.answer7),
  ];

  List<Answers> answersForViruses = [
    Answers(value: 1, text: "Ebola"),
    Answers(value: 2, text: "Bubonic Plague"),
    Answers(value: 3, text: "Typhis"),
    Answers(value: 4, text: "Typhoid"),
    Answers(value: 5, text: "Smallpox"),
  ];

  List<Answers> answersForKeyPeople = [
    Answers(value: 1, text: "Thucydides"),
    Answers(value: 2, text: "Socrates"),
    Answers(value: 3, text: "Cleisthenes"),
    Answers(value: 4, text: "Pericles"),
  ];

  List<Answers> answersDD3 = [
    Answers(value: 1, text: "slaves"),
    Answers(value: 2, text: "demos"),
    Answers(value: 3, text: "oligarchy"),
    Answers(value: 4, text: "Women"),
    Answers(value: 5, text: "metics"),
    Answers(value: 6, text: "power"),
    Answers(value: 7, text: "King"),
    Answers(value: 8, text: "citizens"),
  ];

  List<Answers> answersDD7 = [
    Answers(value: 1, text: "dissection"),
    Answers(value: 2, text: "Roman"),
    Answers(value: 3, text: "Renaissance"),
    Answers(value: 4, text: "plague"),
    Answers(value: 5, text: "Hippocrates"),
    Answers(value: 6, text: "gladiators"),
  ];

  List<Answers> answersDD4 = [
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

  List<Answers> variantsDD4 = [
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

  List<Answers> answersDD9 = [
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

  List<Answers> variantsDD9 = [
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

  late List<Widget> questionsWidgets;
  late AppLocalizations locals;
  int questionIndex = 0;
  bool nextButtonisAvailibaleToPress = true;
  bool previousButtonisAvailibaleToPress = false;
  bool vizibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: _body(),
    );
  }

  @override
  void didChangeDependencies() {
    locals = AppLocalizations.of(context)!;
    questionsWidgets = [
      QuizDragDropCirclesWidget(
        variants: variantsForQ1,
        answers: answersForQ1,
        question: 'What happened when during the Golden Age of Athens? ',
        questionIndex: 1,
      ),
      const QuizEditTextWidget(
        questionIndex: 2,
      ),
      QuizDragDropWidget(
        question: locals.question3,
        questionIndex: 3,
        answers: answersDD3,
      ),
      QuizDragDropCirclesWidget(
        quizWithImage: true,
        variants: variantsDD4,
        answers: answersDD4,
        question: 'What happened where? Match the event to the correct map. ',
        questionIndex: 4,
      ),
      QuizRadioBottonWidget(
        quizWithImage: false,
        answers: answersForViruses,
        questionIndex: 5,
        question: locals.question5,
      ),
      QuizRadioBottonWidget(
        quizWithImage: true,
        answers: answersForKeyPeople,
        questionIndex: 6,
        question: locals.question6,
      ),
      QuizDragDropWidget(
        question: locals.question7,
        questionIndex: 7,
        answers: answersDD7,
      ),
      const Center(
        child: Text('Check Box Question 8'),
      ),
      QuizDragDropCirclesWidget(
        variants: variantsDD9,
        answers: answersDD9,
        question:
            "The 5th century BC was the 'Golden Age' of Athens, when culture flourished in the ancient polis and the city was dominant in the Greek world. Match the individual to their achievement below.",
        questionIndex: 9,
      ),
      const Center(
        child: Text('Check Box Question10'),
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    NavigationSharedPreferences.getNavigationListFromSF();
  }

  Widget _body() {
    if (questionIndex == questionsWidgets.length - 1) {
      setState(() {
        nextButtonisAvailibaleToPress = false;
      });
    } else {
      setState(() {
        nextButtonisAvailibaleToPress = true;
      });
    }
    if (questionIndex == 0) {
      setState(() {
        previousButtonisAvailibaleToPress = false;
      });
    } else {
      setState(() {
        previousButtonisAvailibaleToPress = true;
      });
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              onPressed: () {
                LeafDetails.currentVertex = 18;
                LeafDetails.visitedVertexes.add(18);
                NavigationSharedPreferences.upDateShatedPreferences();
                context.router.push(const IrlNikosPageRoute());
              },
              icon: const Icon(Icons.south),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              duration: Times.fast,
              child: Container(
                key: ValueKey(questionIndex),
                child: questionsWidgets[questionIndex],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: previousButtonisAvailibaleToPress,
                    child: IconButton(
                      iconSize: 50,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          questionIndex--;
                        });
                      },
                      icon: const Icon(Icons.arrow_left),
                    ),
                  ),
                  Visibility(
                    visible: nextButtonisAvailibaleToPress,
                    child: IconButton(
                      iconSize: 50,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          questionIndex++;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SoundAndMenuWidget(
              widget: IconButton(
                onPressed: () {
                  LeafDetails.currentVertex = 15;
                  NavigationSharedPreferences.upDateShatedPreferences();

                  if (kIsWeb) {
                    html.window.history.back();
                    context.router.pop();
                  } else {
                    context.router.pop();
                  }
                },
                icon: const Icon(Icons.arrow_upward),
              ),
              icons: isSoundOn ? Icons.volume_up : Icons.volume_mute,
              onTapVolume: isSoundOn
                  ? () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                        backgroundplayer.pause();
                      });
                    }
                  : () {
                      setState(() {
                        isSoundOn = !isSoundOn;
                        backgroundplayer.play();
                      });
                    },
              onTapMenu: () {
                scaffoldkey.currentState!.openEndDrawer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
