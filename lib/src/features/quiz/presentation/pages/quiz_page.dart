import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/pagination_dialog.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/show_dialog.dart';
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
        listCorrectrAnswers: QuizData.listCorrectrAnswersQuestion1,
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
        listCorrectrAnswers: QuizData.listCorrectrAnswersQuestion4,
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
          listCorrectrAnswers: QuizData.listCorrectrAnswersQuestion9),
      // QuizCheckBox(
      //   QuizData.questionIndex: 10,
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
    ];
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    NavigationSharedPreferences.getNavigationListFromSF();
  }

  Widget _body() {
    if (QuizData.questionIndex == questionsWidgets.length) {
      setState(() {
        nextButtonisAvailibaleToPress = false;
      });
    } else {
      setState(() {
        nextButtonisAvailibaleToPress = true;
      });
    }
    if (QuizData.questionIndex == 0) {
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
              child: QuizData.questionIndex == 10
                  ? QuizLastPage(
                      onPressed: QuizData.showRightAnswers
                          ? () {
                              setState(() {
                                QuizData.questionIndex = 0;
                              });
                            }
                          : () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ShowDialogWidget(
                                      accept: 'Yes',
                                      cancel: 'No',
                                      onTapAccept: () {
                                        setState(() {
                                          QuizData.checkUerAnswers();
                                          QuizData.showRightAnswers =
                                              !QuizData.showRightAnswers;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      onTapCancel: () {
                                        Navigator.of(context).pop();
                                      },
                                      subTitle:
                                          'Are you done and do you want to show the answers?',
                                      title: 'Show Answers',
                                    );
                                  });
                            },
                    )
                  : Container(
                      key: ValueKey(QuizData.questionIndex),
                      child: questionsWidgets[QuizData.questionIndex],
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
                            QuizData.questionIndex--;
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
                            QuizData.questionIndex++;
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
            child: Container(
              color: AppColors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: AppColors.grey, width: 1))),
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Pandemic Assesment",
                            style: TextStyle(
                                color: AppColors.blueDeep, fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Visibility(
                                  visible: !QuizData.showRightAnswers,
                                  child: IconButton(
                                      hoverColor: AppColors.transpatent,
                                      splashColor: AppColors.transpatent,
                                      focusColor: AppColors.transpatent,
                                      highlightColor: AppColors.transpatent,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return ShowDialogWidget(
                                                accept: 'Yes',
                                                cancel: 'No',
                                                onTapAccept: () {
                                                  setState(() {
                                                    QuizData.checkUerAnswers();
                                                    QuizData.showRightAnswers =
                                                        !QuizData
                                                            .showRightAnswers;
                                                    QuizData.questionIndex = 0;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                onTapCancel: () {
                                                  Navigator.of(context).pop();
                                                },
                                                subTitle:
                                                    'Are you done and do you want to show the answers?',
                                                title: 'Show Answers',
                                              );
                                            });
                                      },
                                      icon: Icon(Icons.done)),
                                ),
                              ),
                              Visibility(
                                visible: QuizData.showRightAnswers,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                      hoverColor: AppColors.transpatent,
                                      splashColor: AppColors.transpatent,
                                      focusColor: AppColors.transpatent,
                                      highlightColor: AppColors.transpatent,
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return ShowDialogWidget(
                                                accept: 'Yes, clear',
                                                cancel: 'No, keep',
                                                onTapAccept: () {
                                                  setState(() {
                                                    setState(() {
                                                      QuizData.clearAnswers();
                                                      QuizData.showRightAnswers =
                                                          !QuizData
                                                              .showRightAnswers;
                                                      QuizData.questionIndex =
                                                          0;
                                                    });
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                onTapCancel: () {
                                                  Navigator.of(context).pop();
                                                },
                                                subTitle:
                                                    'The answers will be permanently deleted and cannot be recovered. Are you sure?',
                                                title:
                                                    'Clear the answers and start over?',
                                              );
                                            });
                                      },
                                      icon: const Icon(Icons.delete)),
                                ),
                              ),
                              Clickable(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return ShowPadinationWidget(
                                          onTap: (e) {
                                            setState(() {
                                              QuizData.questionIndex = e - 1;
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: AppColors.blueDeep)),
                                  child: Stack(
                                    children: [
                                      Transform.rotate(
                                        angle:
                                            QuizData.questionIndex.toDouble() /
                                                1.5,
                                        child: const CircularProgressIndicator(
                                          value: 0.1,
                                        ),
                                      ),
                                      Align(
                                        child: Text(QuizData.questionIndex == 10
                                            ? "i"
                                            : "${QuizData.questionIndex + 1}"),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              hoverColor: AppColors.transpatent,
              splashColor: AppColors.transpatent,
              focusColor: AppColors.transpatent,
              highlightColor: AppColors.transpatent,
              onPressed: () {
                LeafDetails.currentVertex = 18;
                LeafDetails.visitedVertexes.add(18);
                NavigationSharedPreferences.upDateShatedPreferences();
                context.router.push(const IrlNikosPageRoute());
              },
              icon: const Icon(Icons.arrow_downward),
            ),
          ),
        ],
      ),
    );
  }
}
