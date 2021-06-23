import 'package:flutter/material.dart';
import 'package:history_of_adventures/src/features/quiz/presentation/widgets/item.dart';
import 'package:history_of_adventures/src/features/quiz/data/model/quiz_model.dart';

import '../widgets/draggable_advanced_widget.dart';

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
                physics: NeverScrollableScrollPhysics(),
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
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: previousButtonisAvailibaleToPress,
                child: IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                      if (mounted)
                        setState(() {
                          questionindex--;
                        });
                    },
                    icon: Icon(
                      Icons.arrow_upward,
                      color: Colors.black,
                    )),
              ),
              Visibility(
                visible: nextButtonisAvailibaleToPress,
                child: IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
                      if (mounted)
                        setState(() {
                          questionindex++;
                        });
                    },
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("Cheak Answers"),
                  onPressed: () {
                    print(_countResult);
                    print(rightAnswers.length * 100 / quizes.length);
                  },
                ),
                Text("Score::$_countResult%")
              ],
            ))
      ],
    );
  }
}
