import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
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
      Center(
        child: Container(
          color: Colors.red,
          child: const Text('question1'),
        ),
      ),
      const QuizEditTextWidget(),
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
      const Center(
        child: Text('question3'),
      ),
      const Center(
        child: Text('question4'),
      ),
      const Center(
        child: Text('question5'),
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
