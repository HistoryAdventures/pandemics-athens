import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_circles.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_words.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_widget_edit_text.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_widget_radio_button.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/shared_preferenses.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../../navigation/presentation/pages/navigation_page.dart';
import '../../data/model/quiz_model.dart';

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
    Answers(value: 2, text: "480 BC", correctAnswers: CorrectAnswers.answer2),
    Answers(value: 1, text: "469 BC", correctAnswers: CorrectAnswers.answer1),
    Answers(value: 3, text: "430 BC", correctAnswers: CorrectAnswers.answer3),
    Answers(value: 4, text: "429 BC", correctAnswers: CorrectAnswers.answer4),
    Answers(value: 5, text: "415 BC", correctAnswers: CorrectAnswers.answer5),
    Answers(value: 6, text: "404 BC", correctAnswers: CorrectAnswers.answer6),
    Answers(value: 7, text: "508 BC", correctAnswers: CorrectAnswers.answer7),
  ];
  List<Answers> answersForViruses = [
    Answers(value: 1, text: "Ebola"),
    Answers(value: 2, text: "Bubonic Plague"),
    Answers(value: 3, text: "Typhis"),
    Answers(value: 4, text: "Typhoid"),
    Answers(value: 5, text: "Smallpox"),
  ];

  List<Answers> answers = [
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
      // Center(
      //   child: Container(
      //     child: const Text('Drag Drop Circles Question 1'),
      //   ),
      // ),

      QuizDragDropCirclesWidget(
        variants: variantsForQ1,
        answers: answersForQ1,
        question: 'What happened when during the Golden Age of Athens? ',
        questionIndex: 1,
      ),
      const QuizEditTextWidget(),
      QuizDragDropWidget(
        question: locals.question3,
        questionIndex: 3,
        answers: answersDD3,
      ),
      Center(
        child: Container(
          child: const Text('Drag Drop Circles Question 4'),
        ),
      ),
      QuizRadioBottonWidget(
        quizWithImage: false,
        answers: answersForViruses,
        questionIndex: 5,
        question: locals.question5,
      ),
      QuizRadioBottonWidget(
        quizWithImage: true,
        answers: answers,
        questionIndex: 6,
        question: locals.question6,
      ),
      QuizDragDropWidget(
        question: locals.question7,
        questionIndex: 7,
        answers: answersDD7,
      ),
      const Center(
        child: Text('Check Box Question8'),
      ),
      const Center(
        child: Text('Drag Drop Circles Question 4'),
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
          )
        ],
      ),
    );
  }
}

class Tetx {}
