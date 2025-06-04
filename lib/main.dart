import 'package:flutter/material.dart';
import 'list_of_question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

ListOfQuestion listOfQuestion = ListOfQuestion();

void main() => runApp(QuizzApp());

class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quizzzz',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [
    // Icons get added automatically;
  ];

  int correctResult = 0;

  void checkAnswer(bool clickedAnswer) {
    bool correctAnswer = listOfQuestion.getAnswer();
    return setState(() {
      if (listOfQuestion.isFinished() == false) {
        if (clickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
          correctResult++;
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
        listOfQuestion.nextQuestion();
      } else {
        Alert(
          context: context,
          title: "Finished",
          desc:
              "You've reached end of the quiz. $correctResult Correct Answers",
        ).show();
        listOfQuestion.reset();
        scoreKeeper = [];
        correctResult = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsetsGeometry.all(10.0),
              child: Center(
                child: Text(
                   listOfQuestion.getQuestion(),
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green[700]),
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red[700]),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Text(
              'Score:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(children: scoreKeeper),
        ],
      ),
    );
  }
}
