import 'package:history_of_adventures/src/features/quiz/presentation/question_widgets/answer_model.dart';

class QuizData {
  static final List<Answers> answersForQ1 = [
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
  static final List<Answers> variantsForQ1 = [
    Answers(value: 3, text: "430 BC", correctAnswers: CorrectAnswers.answer3),
    Answers(value: 4, text: "429 BC", correctAnswers: CorrectAnswers.answer4),
    Answers(value: 5, text: "415 BC", correctAnswers: CorrectAnswers.answer5),
    Answers(value: 2, text: "469 BC", correctAnswers: CorrectAnswers.answer2),
    Answers(value: 6, text: "404 BC", correctAnswers: CorrectAnswers.answer6),
    Answers(value: 1, text: "480 BC", correctAnswers: CorrectAnswers.answer1),
    Answers(value: 7, text: "508 BC", correctAnswers: CorrectAnswers.answer7),
  ];

  static final List<Answers<int>> answersForViruses = [
    Answers(value: 1, text: "Ebola"),
    Answers(value: 2, text: "Bubonic Plague"),
    Answers(value: 3, text: "Typhis"),
    Answers(value: 4, text: "Typhoid"),
    Answers(value: 5, text: "Smallpox"),
  ];

  static final List<Answers<int>> answersForKeyPeople = [
    Answers(value: 1, text: "Thucydides"),
    Answers(value: 2, text: "Socrates"),
    Answers(value: 3, text: "Cleisthenes"),
    Answers(value: 4, text: "Pericles"),
  ];

  static final List<Answers<bool>> answersForQuestion8 = [
    Answers(
        value: false,
        text: "This paiting is called the 'Death of Plato'.",
        correctAnswers: CorrectAnswers.answer1),
    Answers(
        value: false,
        text: "This painting is all about Socrates.",
        correctAnswers: CorrectAnswers.answer2),
    Answers(
        value: false,
        text: "This was painted by Jacques-Louis Davi",
        correctAnswers: CorrectAnswers.answer3),
    Answers(
        value: false,
        text: "This is a painting by Leonardo da Vinci.",
        correctAnswers: CorrectAnswers.answer4),
    Answers(
        value: false,
        text: "Socrates was a famous historian.",
        correctAnswers: CorrectAnswers.answer5),
    Answers(
        value: false,
        text: "Socrates was sentecend to death for murder.",
        correctAnswers: CorrectAnswers.answer6),
  ];

  static final List<Answers> answersDD3 = [
    Answers(value: 1, text: "slaves"),
    Answers(value: 2, text: "demos"),
    Answers(value: 3, text: "oligarchy"),
    Answers(value: 4, text: "Women"),
    Answers(value: 5, text: "metics"),
    Answers(value: 6, text: "power"),
    Answers(value: 7, text: "King"),
    Answers(value: 8, text: "citizens"),
  ];

  static final List<Answers> answersDD7 = [
    Answers(value: 1, text: "dissection"),
    Answers(value: 2, text: "Roman"),
    Answers(value: 3, text: "Renaissance"),
    Answers(value: 4, text: "plague"),
    Answers(value: 5, text: "Hippocrates"),
    Answers(value: 6, text: "gladiators"),
  ];

  static final List<Answers> answersDD4 = [
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

  static final List<Answers> variantsDD4 = [
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

  static final List<Answers> answersDD9 = [
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

  static final List<Answers> variantsDD9 = [
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

  static List<CorrectAnswers> usersAnswersForQ8 = [];

  static final List<CorrectAnswers> correctAnswersForQ8 = [
    CorrectAnswers.answer2,
    CorrectAnswers.answer4,
    CorrectAnswers.answer5
  ];

  static void checkUerAnswers() {
    usersAnswersForQ8.forEach((CorrectAnswers element) {
      if (correctAnswersForQ8.contains(element)) {
        print(";ok");
      } else {
        print('not ok');
      }
    });
  }
}

enum CorrectAnswers {
  answer1,
  answer2,
  answer3,
  answer4,
  answer5,
  answer6,
  answer7,
  answer8,
}
