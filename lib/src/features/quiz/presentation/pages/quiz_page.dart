import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/last_page.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_check_box.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_circles.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_words.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_select_image.dart';
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
        variants: QuizData.variantsForQ1,
        answers: QuizData.answersForQ1,
        question: 'What happened when during the Golden Age of Athens? ',
        questionIndex: 1,
        score: 0,
        userAnswer: QuizData.userAnswerForQ1,
        userAnswerWithCheck: QuizData.userAnswerWithCheckForQ1,
      ),
      const QuizEditTextWidget(
        questionIndex: 2,
      ),
      QuizDragDropWidget(
        question: locals.question3,
        questionIndex: 3,
        answers: QuizData.answersForDD3,
        score: 8,
      ),
      QuizDragDropCirclesWidget(
        quizWithImage: true,
        variants: QuizData.variantsDD4,
        answers: QuizData.answersDD4,
        question: 'What happened where? Match the event to the correct map. ',
        questionIndex: 4,
        score: 8,
        userAnswer: QuizData.userAnswerForQ4,
        userAnswerWithCheck: QuizData.userAnswerWithCheckForQ4,
      ),
      QuizRadioBottonWidget(
        quizWithImage: false,
        answers: QuizData.answersForQ5,
        questionIndex: 5,
        question: locals.question5,
      ),
      QuizRadioBottonWidget(
        quizWithImage: true,
        answers: QuizData.answersForQ6,
        questionIndex: 6,
        question: locals.question6,
      ),
      QuizDragDropWidget(
        question: locals.question7,
        questionIndex: 7,
        answers: QuizData.answersForDD7,
        score: 6,
      ),
      QuizCheckBox(
        answers: QuizData.answersForQuestion8,
        question:
            "Look at the painting below. Which of the following statements is true about it and it's subject?",
        questionIndex: 8,
        userAnswers: QuizData.usersAnswersForQ8,
      ),
      QuizDragDropCirclesWidget(
        variants: QuizData.variantsDD9,
        answers: QuizData.answersDD9,
        question:
            "The 5th century BC was the 'Golden Age' of Athens, when culture flourished in the ancient polis and the city was dominant in the Greek world. Match the individual to their achievement below.",
        questionIndex: 9,
        score: 0,
        userAnswer: QuizData.userAnswerForQ9,
        userAnswerWithCheck: QuizData.userAnswerWithCheckForQ9,
      ),
      // QuizCheckBox(
      //   questionIndex: 10,
      //   withImages: true,
      //   question:
      //       "The Greek god of healing, Asclepius, is easily identifiable in artworks, because he is usually holding an 'askelpeian'. The askelpian is a symbol still associated with medicine and healing to this day. Which of the below images best represents an askelpian?",
      //   answers: QuizData.answersForQuestion10,
      //   userAnswers: QuizData.usersAnswersForQ10,
      // ),
      QuizSelectImage(
        questionIndex: 10,
        question:
            "The Greek god of healing, Asclepius, is easily identifiable in artworks, because he is usually holding an 'askelpeian'. The askelpian is a symbol still associated with medicine and healing to this day. Which of the below images best represents an askelpian?",
        answers: QuizData.answersForQuestion10,
        userAnswers: QuizData.usersAnswersForQ10,
      ),
      QuizLastPage(
        questionIndex: 11,
      )
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
                        if (mounted) {
                          setState(() {
                            questionIndex--;
                          });
                        }
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
                        if (mounted) {
                          setState(() {
                            questionIndex++;
                          });
                        }
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
            child: Column(
              children: [
                SoundAndMenuWidget(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: !QuizData.showRightAnswers,
                        child: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.blueDeep,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: 500,
                                          padding: EdgeInsets.all(10),
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              const Text(
                                                'Clear the answers and start over?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              const Text(
                                                'The answers will be permanently deleted and cannot be recovered. Are you sure?',
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(
                                                height: 60,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              primary: AppColors
                                                                  .red),
                                                      onPressed: () {
                                                        setState(() {
                                                          QuizData
                                                              .checkUerAnswers();
                                                          QuizData.showRightAnswers =
                                                              !QuizData
                                                                  .showRightAnswers;
                                                          questionIndex = 0;
                                                        });
                                                      },
                                                      child: const Text(
                                                          'Yes,clear')),
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              side:
                                                                  const BorderSide(
                                                                width: 1,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              primary: AppColors
                                                                  .transpatent),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text(
                                                          'No, keep'))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: Icon(Icons.done)),
                      ),
                      Visibility(
                        visible: QuizData.showRightAnswers,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                QuizData.clearAnswers();
                                QuizData.showRightAnswers =
                                    !QuizData.showRightAnswers;
                                questionIndex = 0;
                              });
                            },
                            icon: Icon(Icons.delete)),
                      )
                    ],
                  ),
                )
              ],
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
        ],
      ),
    );
  }
}
