import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/widgets/widgets.dart';
import 'package:history_of_adventures/src/features/navigation/presentation/pages/navigation_page.dart';
import 'package:just_audio/just_audio.dart';
import "package:universal_html/html.dart" as html;

import '../../../../core/colors.dart';
import '../../../../core/router.gr.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../../core/utils/styles.dart';
import '../../../navigation/presentation/models/leaf_detail_model.dart';
import '../../data/model/quiz_model.dart';
import '../widgets/draggable_advanced_widget.dart';
import '../widgets/item.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late PageController _pageController;
  int questionindex = 0;
  int _countResult = 0;
  late List<dynamic> quizes;
  bool isSoundOn = false;
  final backgroundplayer = AudioPlayer();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  List<bool> rightAnswers = [];
  final List<String> land = [];
  bool nextButtonisAvailibaleToPress = true;
  bool previousButtonisAvailibaleToPress = false;

  bool vizibility = true;
  List<dynamic> getQuizes = [
    QuizModel(quizId: 1, question: "1question?", answers: [
      {'answer': '2800', 'isCorrect': 1},
      {
        'answer': '1800',
      },
      {
        'answer': '2000',
      },
      {
        'answer': '1900',
      },
    ]),
    QuizModel(quizId: 2, question: "2question?", answers: [
      {'answer': 'asdsad', 'isCorrect': 1},
      {
        'answer': '1sdal;skdl;800',
      },
      {
        'answer': '2000',
      },
      {
        'answer': '1900',
      },
    ]),
    QuizModel(quizId: 3, question: "3question?", answers: [
      {'answer': '2800', 'isCorrect': 1},
      {
        'answer': '18sadsd00',
      },
      {
        'answer': '2000',
      },
      {
        'answer': '19asd,asdl;00',
      },
    ]),
    QuizModel(quizId: 4, question: "4question?", answers: [
      {'answer': '2800', 'isCorrect': 1},
      {
        'answer': '1800',
      },
      {
        'answer': '2000',
      },
      {
        'answer': '1900',
      },
    ]),
    ImageQuiz(
      question: '5question? Image Question',
      answers: [
        {'answer': 'assets/images_quiz/image1.jpg', 'isCorrect': 1},
        {
          'answer': 'assets/images_quiz/image2.jpg',
        },
        {
          'answer': 'assets/images_quiz/image3.jpg',
        }
      ],
    ),
    QuizDragDrop(question: '6questuion?', answers: ['History', "Advanture"])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: const NavigationPage(),
      body: _body(),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    quizes = getQuizes;
  }

  void _onChangeAnswer(bool isCorrect) => setState(() {
        if (isCorrect) {
          _countResult++;
        } else {
          return;
        }
      });

  Widget _body() {
    if (questionindex == quizes.length - 1) {
      setState(() {
        nextButtonisAvailibaleToPress = false;
      });
    } else {
      setState(() {
        nextButtonisAvailibaleToPress = true;
      });
    }
    if (questionindex == 0) {
      setState(() {
        previousButtonisAvailibaleToPress = false;
      });
    } else {
      setState(() {
        previousButtonisAvailibaleToPress = true;
      });
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsPath.charactersBackgroundImage),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SoundAndMenuWidget(
            widget: IconButton(
              onPressed: () {
                LeafDetails.currentVertex = 15;
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
          Expanded(
            flex: 5,
            child: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      flex: 3,
                      child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          controller: _pageController,
                          itemCount: quizes.length,
                          itemBuilder: (context, index) {
                            questionindex = index;
                            if (quizes[index].runtimeType == QuizModel) {
                              return Quiz(
                                index: index,
                                questionData: quizes,
                                onChangeAnswer: _onChangeAnswer,
                              );
                            } else if (quizes[index].runtimeType == ImageQuiz) {
                              return QuizImage(
                                index: index,
                                questionData: quizes,
                                onChangeAnswer: _onChangeAnswer,
                              );
                            } else {
                              return DraggableAdvancedWidget();
                            }
                          })),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            primary: AppColors.white,
                            elevation: 5),
                        onPressed: () {
                          //print(_countResult);
                          //print(rightAnswers.length * 100 / quizes.length);
                        },
                        child: Text("Cheak Answers",
                            style: Theme.of(context).textTheme.button),
                      ),
                      Text("Score::$_countResult%")
                    ],
                  ))
                ],
              ),
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  child: Visibility(
                    visible: previousButtonisAvailibaleToPress,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            primary: AppColors.white,
                            elevation: 5),
                        onPressed: () {
                          _pageController.previousPage(
                              duration: Times.slower, curve: Curves.easeIn);
                          if (mounted) {
                            setState(() {
                              questionindex--;
                            });
                          }
                        },
                        child: Text(
                          'Previous',
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: nextButtonisAvailibaleToPress,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            textStyle: Theme.of(context).textTheme.button,
                            primary: AppColors.white,
                            elevation: 5),
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Times.slower, curve: Curves.easeIn);
                          if (mounted) {
                            setState(() {
                              questionindex++;
                            });
                          }
                        },
                        child: AutoSizeText(
                          "Next",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Flexible(
            child: IconButton(
              onPressed: () {
                LeafDetails.currentVertex = 18;
                LeafDetails.visitedVertexes.add(18);
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
