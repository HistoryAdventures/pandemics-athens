import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_bottom.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/features/navigation/presentation/widgets/drow_circle_line.dart';
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
        question: 'What happened during the Golden Age of Athens?',
        questionIndex: 1,
        score: 0,
        userAnswer: QuizData.userAnswerForQ1,
        userAnswerWithCheck: QuizData.userAnswerWithCheckForQ1,
        listCorrectrAnswers: QuizData.listCorrectrAnswersQuestion1,
      ),
      const QuizEditTextWidget(
        questionIndex: 2,
        question: 'Hippocrates is famous for his theory of the Four Humours...',
      ),
      QuizDragDropWidget(
        question: 'Fill in the blanks...',
        questionIndex: 3,
        answers: QuizData.answersForDD3,
        score: 8,
      ),
      QuizDragDropCirclesWidget(
        quizWithImage: true,
        variants: QuizData.variantsDD4,
        answers: QuizData.answersDD4,
        question: 'What happened where?',
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
        question: 'Which of the pathogens...',
      ),
      QuizRadioBottonWidget(
        quizWithImage: true,
        answers: QuizData.answersForQ6,
        questionIndex: 6,
        question: 'What is the prominent Athenian?',
      ),
      QuizCheckBox(
        answers: QuizData.answersForQuestion8,
        question: "Look at... Which of the following statements is true...",
        questionIndex: 7,
        userAnswers: QuizData.usersAnswersForQ8,
      ),
      QuizSelectImage(
        questionIndex: 8,
        question:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non?",
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
    if (QuizData.questionIndex == questionsWidgets.length - 1) {
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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.quizBackground), fit: BoxFit.cover)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: HW.getWidth(1200, context),
              height: HW.getHeight(788, context),
              decoration: BoxDecoration(
                  boxShadow: Shadows.allBorders, color: AppColors.white),
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color: AppColors.grey, width: 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'QUESTION ${QuizData.questionIndex + 1}/7',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                "Assessment",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButtonWidget(
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
                                  IconButtonWidget(
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
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
                      child:
                          //  QuizData.questionIndex == 10
                          //     ? QuizLastPage(
                          //         onPressed: QuizData.showRightAnswers
                          //             ? () {
                          //                 setState(() {
                          //                   QuizData.questionIndex = 0;
                          //                 });
                          //               }
                          //             : () {
                          //                 showDialog(
                          //                     context: context,
                          //                     builder: (context) {
                          //                       return ShowDialogWidget(
                          //                         accept: 'Yes',
                          //                         cancel: 'No',
                          //                         onTapAccept: () {
                          //                           setState(() {
                          //                             QuizData.checkUerAnswers();
                          //                             QuizData.showRightAnswers =
                          //                                 !QuizData
                          //                                     .showRightAnswers;
                          //                           });
                          //                           Navigator.of(context).pop();
                          //                         },
                          //                         onTapCancel: () {
                          //                           Navigator.of(context).pop();
                          //                         },
                          //                         subTitle:
                          //                             'Are you done and do you want to show the answers?',
                          //                         title: 'Show Answers',
                          //                       );
                          //                     });
                          //               },
                          //       )
                          //     :
                          Container(
                        key: ValueKey(QuizData.questionIndex),
                        child: questionsWidgets[QuizData.questionIndex],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButtonWidget(
                              iconSize: 50,
                              onPressed: previousButtonisAvailibaleToPress
                                  ? () {
                                      if (mounted) {
                                        setState(() {
                                          QuizData.questionIndex--;
                                        });
                                      }
                                    }
                                  : null,
                              icon: const Icon(Icons.arrow_left),
                            ),
                            Row(
                                children: questionsWidgets
                                    .asMap()
                                    .entries
                                    .map((entry) {
                              final int index = entry.key;
                              return Container(
                                height: 20,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: QuizData.questionIndex == index
                                              ? AppColors.transpatent
                                              : AppColors.grey35),
                                      shape: BoxShape.circle,
                                      color: QuizData.questionIndex == index
                                          ? AppColors.orange
                                          : AppColors.transpatent),
                                ),
                              );
                            }).toList()
                                // .asMap()
                                // .map<Widget>((key, value) => Container())
                                // .toList(),
                                )
                            // Container(
                            //   height: 30,
                            //   child: ListView.builder(
                            //       scrollDirection: Axis.horizontal,
                            //       itemCount: questionsWidgets.length,
                            //       itemBuilder: (context, index) {
                            //         return Wrap(
                            //           direction: Axis.vertical,
                            //           children: [
                            //             Container(
                            //               margin: EdgeInsets.symmetric(
                            //                   horizontal: 10),
                            //               height: 20,
                            //               width: 20,
                            //               decoration: BoxDecoration(
                            //                   border: Border.all(
                            //                       color: QuizData
                            //                                   .questionIndex ==
                            //                               index
                            //                           ? AppColors.transpatent
                            //                           : AppColors.grey35),
                            //                   shape: BoxShape.circle,
                            //                   color: QuizData.questionIndex ==
                            //                           index
                            //                       ? AppColors.orange
                            //                       : AppColors.transpatent),
                            //             ),
                            //           ],
                            //         );
                            //       }),
                            // ),

                            ,
                            IconButtonWidget(
                              iconSize: 50,
                              onPressed: nextButtonisAvailibaleToPress
                                  ? () {
                                      if (mounted) {
                                        setState(() {
                                          QuizData.questionIndex++;
                                        });
                                      }
                                    }
                                  : null,
                              icon: const Icon(
                                Icons.arrow_right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SoundAndMenuWidget(
              widget: IconButtonWidget(
                iconSize: HW.getHeight(40, context),
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
                      icons: isSoundOn ? AssetsPath.iconVolumeOn : AssetsPath.iconVolumeOff,
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
            child: SizedBox(
              height: HW.getHeight(111, context),
              child: ArrowTextBottomWidget(
                onPressed: () {
                  LeafDetails.currentVertex = 18;
                  LeafDetails.visitedVertexes.add(18);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.push(const IrlNikosPageRoute());
                },
                textChapter: locals.chapter1,
                textChapterName: locals.todoNoHarm,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
