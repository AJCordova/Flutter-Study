import 'package:flutter/material.dart';
import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          )
        ),
      )
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int questionNumber = 0;

  List<Icon> scoreKeeper = [];

  Icon correctAnswerIcon() {
    return const Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Icon wrongAnswerIcon() {
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.green,
                child: const Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    bool chosenAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                    if (chosenAnswer == true) {
                      scoreKeeper.add(correctAnswerIcon());
                    } else {
                      scoreKeeper.add(wrongAnswerIcon());
                    }

                    questionNumber++;
                  });
                },
              )
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: const Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    bool chosenAnswer = quizBrain.questionBank[questionNumber].questionAnswer;
                    if (chosenAnswer == false) {
                      scoreKeeper.add(correctAnswerIcon());
                    } else {
                      scoreKeeper.add(wrongAnswerIcon());
                    }

                    questionNumber++;
                  });
                },
              )
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}