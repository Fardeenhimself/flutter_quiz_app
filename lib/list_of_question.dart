import 'question.dart';

class ListOfQuestion {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      questionText: 'Bangladesh is a nuclear powered state',
      questionAnswer: false,
    ),
    Question(
      questionText: 'Sheikh Hasina was a good prime minister',
      questionAnswer: false,
    ),
    Question(
      questionText: 'India and Pakistan are friends',
      questionAnswer: false,
    ),
    Question(questionText: 'Titanic sank on 1912', questionAnswer: true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
