import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:history_of_adventures/src/core/colors.dart';
import 'package:history_of_adventures/src/core/utils/assets_path.dart';
import 'package:history_of_adventures/src/core/utils/audioplayer_utils.dart';
import 'package:history_of_adventures/src/core/widgets/app_up_button.dart';
import 'package:history_of_adventures/src/core/widgets/arrow_text_bottom.dart';
import 'package:history_of_adventures/src/core/widgets/icon_button_widget.dart';
import 'package:history_of_adventures/src/core/widgets/image_button.dart';
import 'package:history_of_adventures/src/features/quiz/data/quiz_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/custom_widgets/show_dialog.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/drag_drop_widgets/drag_drop_models.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/golden_age_drag_drop.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_check_box.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_circles.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_drag_drop_words.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_map_image.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_select_image.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_widget_edit_text.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/quiz_widget_radio_button.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/radiobutton_widget.dart';

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

  // late List<Widget> questionsWidgets;
  late AppLocalizations locals;
  bool nextButtonisAvailibaleToPress = true;
  bool previousButtonisAvailibaleToPress = false;
  bool vizibility = true;

  List<Widget> history = [];
  double lastIndex = 0;
  Widget? lastWidget;

  late List<Answers<int>> variantsQ1;
  late List<Answers<int>> answerQ1;

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

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    variantsQ1 = QuizData.variantsForQ1;
    answerQ1 = QuizData.answersForQ1;
    NavigationSharedPreferences.getNavigationListFromSF();
    firebaseScreenTracking();
  }

  Future<void> firebaseScreenTracking() async {
    await FirebaseAnalytics.instance.logEvent(name: "assessment", parameters: {
      "page_url": "https://pandemics.historyadventures.app/assessment"
    });

    await FirebaseAnalytics.instance.logScreenView(screenName: "assessment");
  }

  Widget _body() {
    final questionsWidgets = [
      QuizDragDropCirclesWidget(
        variants: variantsQ1,
        answers: answerQ1,
        questionIndex: 1,
        score: 0,
        userAnswer: QuizData.userAnswerForQ1,
        userAnswerWithCheck: QuizData.userAnswerWithCheckForQ1,
        listCorrectrAnswers: QuizData.listCorrectrAnswersQuestion1,
      ),
      QuizRadioBottonWidget(
        quizDataChecking: QuizData.question2Cheking,
        quizWithImage: true,
        image: AssetsPath.nikos,
        answers: QuizData.answersForQ2,
        questionIndex: 2,
        boldWords: true,
        question:
            'Nikos of Athens had vowed to serve the sick within the city during the Plague of Athens. He made this vow to all of the following,',
        boldQuestionText: " EXCEPT:",
      ),
      QuizDragDropWidget(
        boldText: 'Key People of the Age,',
        questionPart1: 'For these  ',
        questionPart2:
            '  drag and drop the name that goes with their portrait and description. ',
        questionIndex: 3,
        answers: QuizData.answersForDD3Images,
        questionWithImages: true,
        score: 6,
        listQuestionWIthImages: true,
        listQuestionBody: QuizData.listQuestion3WithImages,
        usersAnswers: QuizData.usersAnswersForQ3,
        dragWordsList: QuizData.dragWordsWidget3,
        image: null,
        bgImage: AssetsPath.backgorund1,
        bgHeight: 320,
        bgWidth: 218,
        imageHeight: 320,
        imageWidth: 180,
        question: null,
      ),
      QuizMapImage(),
      QuizDragDropWidget(
          question:
              'Read the following passage and drag the correct words into place',
          listQuestionBody: QuizData.listQuestionBody5,
          questionIndex: 5,
          answers: QuizData.answersForDD5,
          usersAnswers: QuizData.userAnswerForQ5,
          score: 1,
          image: AssetsPath.quintaEssentia,
          questionWithImages: false),
      QuizSelectImage(
        questionIndex: 6,
        question:
            "The Greek god of healing, Asclepius, is easily identifiable in artworks, because he is usually holding an 'askelpeian'. The askelpian is a symbol still associated with medicine and healing to this day. Which of the below images best represents an askelpian?",
        answers: QuizData.answersForQuestion6,
        userAnswers: QuizData.usersAnswersForQ6,
      ),
      QuizRadioBottonWidget(
        quizWithImage: true,
        image: AssetsPath.sourceAnalysis,
        answers: QuizData.answersForQ7,
        questionIndex: 7,
        question: 'Which of the following annotations is NOT accurate?',
        quizDataChecking: QuizData.question7Cheking,
      ),
      QuizDragDropWidget(
          question:
              'Read the following passage and drag the correct words into place',
          listQuestionBody: QuizData.listQuestionBody8,
          questionIndex: 8,
          answers: QuizData.answersForDD8,
          usersAnswers: QuizData.userAnswerForQ8,
          score: 1,
          image: AssetsPath.thucydides1,
          questionWithImages: false),
      QuizCheckBox(
        answers: QuizData.answersForQuestion9,
        question:
            "In reference to the image, check all of the following statements that are accurate:",
        questionIndex: 9,
        userAnswers: QuizData.usersAnswersForQ9,
        image: AssetsPath.piraeusAthens,
      ),
      QuizRadioBottonWidget(
        quizWithImage: true,
        image: AssetsPath.body,
        bgImage: AssetsPath.bodyBG,
        answers: QuizData.answersForQ10,
        questionIndex: 10,
        question: 'Which of the following annotations is NOT accurate?',
        quizDataChecking: QuizData.question10Cheking,
      ),
      QuizDragDropWidget(
        question: null,
        boldText: 'Pathogens,',
        questionPart1: 'For these  ',
        questionPart2:
            '  drag and drop the name that goes with their portrait and description. ',
        questionIndex: 11,
        answers: QuizData.answersForQ11,
        questionWithImages: true,
        score: 6,
        listQuestionWIthImages: true,
        listQuestionBody: QuizData.listQuestion11WithImages,
        usersAnswers: QuizData.usersAnswersForQ11,
        dragWordsList: QuizData.dragWordsWidget11,
        image: null,
        bgImage: AssetsPath.feverBG,
        bgHeight: 200,
        bgWidth: 228,
        imageHeight: 150,
        imageWidth: 320,
      ),
      QuizCheckBox(
        answers: QuizData.answersForQuestion12,
        question:
            "In reference to the image, check all of the following statements that are accurate:",
        questionIndex: 12,
        userAnswers: QuizData.usersAnswersForQ12,
        image: AssetsPath.painting,
      ),
      RadioButtonModel(
        question: "If you were Nikos, what would you have done?",
        answers: QuizData.answersForQ13,
        questionIndex: 13,
      ),
    ];

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
                  Column(
                    children: [
                      _header,
                      Expanded(
                        child: AnimatedSwitcher(
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          duration: Times.fast,
                          child: Container(
                            key: ValueKey(QuizData.questionIndex),
                            child: IndexedStack(
                              index: QuizData.questionIndex,
                              children: questionsWidgets,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: HW.getWidth(24, context),
                    bottom: HW.getHeight(24, context),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: previousButtonisAvailibaleToPress
                                ? () {
                                    AudioPlayerUtil()
                                        .playSound(AssetsPath.quizQlick);
                                    if (mounted) {
                                      setState(() {
                                        QuizData.questionIndex--;
                                      });
                                    }
                                  }
                                : null,
                            child: const Icon(Icons.chevron_left_sharp),
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(questionsWidgets.length,
                                  (index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: HW.getWidth(16, context),
                                  width: HW.getWidth(16, context),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: QuizData.questionIndex == index
                                              ? AppColors.transpatent
                                              : AppColors.grey35),
                                      shape: BoxShape.circle,
                                      color: QuizData.questionIndex == index
                                          ? AppColors.orange
                                          : AppColors.transpatent),
                                );
                              })),
                          IconButton(
                            onPressed: nextButtonisAvailibaleToPress
                                ? () {
                                    AudioPlayerUtil()
                                        .playSound(AssetsPath.quizQlick);
                                    if (mounted) {
                                      setState(() {
                                        QuizData.questionIndex++;
                                      });
                                    }
                                  }
                                : null,
                            icon: const Icon(
                              Icons.chevron_right_sharp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: HW.getHeight(24, context),
                    child: _score,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _menu,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: HW.getHeight(111, context),
              child: ArrowTextBottomWidget(
                onPressed: () {
                  AudioPlayerUtil().playSound(AssetsPath.screenTransitionSound);
                  LeafDetails.currentVertex = 18;
                  LeafDetails.visitedVertexes.add(18);
                  NavigationSharedPreferences.upDateShatedPreferences();
                  context.router.replace(const IrlNikosPageRoute());
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

  Widget get _menu => SoundAndMenuWidget(
        widget: IconButtonWidget(
          onPressed: () {
            if (kIsWeb) {
              AudioPlayerUtil().playSound(AssetsPath.screenTransitionSound);
              LeafDetails.currentVertex = 15;
              LeafDetails.visitedVertexes.add(15);
              NavigationSharedPreferences.upDateShatedPreferences();
              // html.window.history.back();
              // context.router.pop();
              context.router
                  .replace(DeadOfSocratesPageToBottom(fromKeepGoing: false));
            } else {
              context.router.pop();
            }
          },
          icon: const Icon(Icons.arrow_upward),
        ),
        icons: AudioPlayerUtil.isSoundOn
            ? AssetsPath.iconVolumeOn
            : AssetsPath.iconVolumeOff,
        onTapVolume: AudioPlayerUtil.isSoundOn
            ? () {
                setState(() {
                  AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                });
              }
            : () {
                setState(() {
                  AudioPlayerUtil.isSoundOn = !AudioPlayerUtil.isSoundOn;
                });
              },
        onTapMenu: () {
          scaffoldkey.currentState!.openEndDrawer();
        },
      );
  Widget get _score {
    QuizData.listScore = [
      Score(currentScore: QuizData.rightAnswersForQ1, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ2, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ3, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ4, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ5, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ6, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ7, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ8, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ9, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ10, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ11, scorsCount: 1),
      Score(currentScore: QuizData.rightAnswersForQ2, scorsCount: 1),
      Score(currentScore: 0, scorsCount: 0),
    ];
    return Visibility(
      visible: QuizData.showRightAnswers,
      child: Container(
        height: HW.getHeight(52, context),
        width: HW.getWidth(246, context),
        padding: EdgeInsets.only(
          right: HW.getWidth(31, context),
          left: HW.getWidth(24, context),
        ),
        decoration: const BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.only(
              topRight: Corners.bigRadius,
              bottomRight: Corners.bigRadius,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(right: HW.getWidth(24, context)),
              height: HW.getHeight(30, context),
              width: HW.getWidth(30, context),
              child: Image.asset(AssetsPath.scoreimage),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total Score:'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline?.copyWith(
                              fontSize: TextFontSize.getHeight(18, context),
                              color: AppColors.white,
                            ),
                      ),
                      Text(
                        '${QuizData.finalScore} / 12'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: TextFontSize.getHeight(14, context),
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'this question:'.toUpperCase(),
                        style: Theme.of(context).textTheme.overline?.copyWith(
                              fontSize: TextFontSize.getHeight(18, context),
                              color: AppColors.white,
                            ),
                      ),
                      Text(
                        '${QuizData.listScore[QuizData.questionIndex].currentScore} / ${QuizData.listScore[QuizData.questionIndex].scorsCount}'
                            .toUpperCase(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: TextFontSize.getHeight(14, context),
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get _header => Container(
        padding: EdgeInsets.symmetric(
          horizontal: HW.getWidth(24, context),
        ),
        height: HW.getHeight(88, context),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'QUESTION ${QuizData.questionIndex + 1}/13',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: HW.getHeight(18, context),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Assessment",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: HW.getHeight(32, context),
                          ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ImageButton(
                          asset: AssetsPath.restartIcon,
                          onTap: () {
                            AudioPlayerUtil().playSound(AssetsPath.quizQlick);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ShowDialogWidget(
                                  accept: 'Yes',
                                  cancel: 'No',
                                  onTapAccept: () {
                                    if (DragDropQuizBody
                                            .dragDropBodyKey.currentState !=
                                        null) {
                                      DragDropQuizBody
                                          .dragDropBodyKey.currentState!
                                          .resetQuiz();
                                    }
                                    if (QuizMapImage
                                            .quizMapImageKey.currentState !=
                                        null) {
                                      QuizMapImage.quizMapImageKey.currentState!
                                          .resetQuiz();
                                    }
                                    if (RadioButtonModel
                                            .radioButtonKey.currentState! !=
                                        null) {
                                      RadioButtonModel
                                          .radioButtonKey.currentState!
                                          .resetQuiz();
                                    }

                                    setState(() {
                                      setState(() {
                                        QuizData.clearAnswers();
                                        QuizData.showRightAnswers = false;
                                        QuizData.questionIndex = 0;
                                      });
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  onTapCancel: () {
                                    AudioPlayerUtil()
                                        .playSound(AssetsPath.menuCloseSound);
                                    Navigator.of(context).pop();
                                  },
                                  subTitle:
                                      'Do you want to clear the answers and start over??',
                                  title: 'RESTART',
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(width: HW.getWidth(23, context)),
                        ImageButton(
                          asset: AssetsPath.checkIcon,
                          onTap: () {
                            AudioPlayerUtil().playSound(AssetsPath.quizQlick);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ShowDialogWidget(
                                  accept: 'Yes',
                                  cancel: 'No',
                                  onTapAccept: () {
                                    AudioPlayerUtil()
                                        .playSound(AssetsPath.quizQlick);
                                    if (DragDropQuizBody
                                            .dragDropBodyKey.currentState !=
                                        null) {
                                      if (DragDropQuizBody
                                          .dragDropBodyKey
                                          .currentState!
                                          .rightLines
                                          .isNotEmpty) {
                                        Navigator.of(context).pop();
                                        return;
                                      }
                                      DragDropQuizBody
                                          .dragDropBodyKey.currentState!
                                          .checkAnswers();
                                    }

                                    if (QuizMapImage
                                            .quizMapImageKey.currentState !=
                                        null) {
                                      if (QuizMapImage
                                          .quizMapImageKey
                                          .currentState!
                                          .rightLines
                                          .isNotEmpty) {
                                        Navigator.of(context).pop();
                                        return;
                                      }
                                      QuizMapImage.quizMapImageKey.currentState!
                                          .checkAnswers();
                                    }

                                    if (RadioButtonModel
                                            .radioButtonKey.currentState !=
                                        null) {
                                      if (RadioButtonModel
                                          .radioButtonKey
                                          .currentState!
                                          .rightLines
                                          .isNotEmpty) {
                                        Navigator.of(context).pop();
                                        return;
                                      }
                                      RadioButtonModel
                                          .radioButtonKey.currentState!
                                          .checkAnswers();
                                    }

                                    setState(() {
                                      QuizData.checkUerAnswers();
                                      QuizData.showRightAnswers =
                                          !QuizData.showRightAnswers;
                                      QuizData.questionIndex = 0;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  onTapCancel: () {
                                    AudioPlayerUtil()
                                        .playSound(AssetsPath.menuCloseSound);
                                    Navigator.of(context).pop();
                                  },
                                  subTitle:
                                      'Would you like to end the Quiz and see the anwsers??',
                                  title: 'SHOW ANSWERS',
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: HW.getWidth(21, context),
              ),
              child: const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        ),
      );
}
