import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/core/utils/styles.dart';

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
    return Row(
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: previousButtonisAvailibaleToPress,
                child: IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                          duration: Times.slower, curve: Curves.easeIn);
                      if (mounted) {
                        setState(() {
                          questionindex--;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_upward,
                      color: Colors.black,
                    )),
              ),
              Visibility(
                visible: nextButtonisAvailibaleToPress,
                child: IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: Times.slower, curve: Curves.easeIn);
                      if (mounted) {
                        setState(() {
                          questionindex++;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //print(_countResult);
                //print(rightAnswers.length * 100 / quizes.length);
              },
              child: const Text("Cheak Answers"),
            ),
            Text("Score::$_countResult%")
          ],
        ))
      ],
    );
  }
}
