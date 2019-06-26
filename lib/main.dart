import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quizzBrain.dart';

QuizzBrain quizzBrain = QuizzBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> ListScore = [];
  int compteurJuste = 0;
  int compteurFaux = 0;
  int totalQuestion = quizzBrain.totalQuestion();
  void checkAnswer(bool userPickerAnswer) {
    bool correctAnswer = quizzBrain.getQuestionAnswer();
    setState(() {
      if (userPickerAnswer == correctAnswer) {
        compteurJuste++;
        ListScore.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        compteurFaux++;
        ListScore.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
    });

    quizzBrain.nextQuestion();

    if (quizzBrain.getStatutParti() == true) {
      setState(() {
        ListScore.clear();
        Alert(
          context: context,
          type: AlertType.success,
          title: "Partie Terminer",
          desc:
              "Vous avez eu $compteurJuste/$totalQuestion \n tu a fait $compteurFaux fautes.",
          buttons: [
            DialogButton(
              child: Text(
                "Rejouer",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                quizzBrain.NewPartie();
                compteurJuste = 0;
                compteurFaux = 0;
              },
              width: 120,
            )
          ],
        ).show();
      });
    }
  }

  void checkFinishPartie() {
    if (quizzBrain.getIndexQuestion() == quizzBrain.totalQuestion()) {
      print(quizzBrain.totalQuestion());
      Future.delayed(const Duration(milliseconds: 500), () {
      quizzBrain.finishPartie();
      };
    }
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
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Vrai',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);

                  checkFinishPartie();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'Faux',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);

                  checkFinishPartie();

              },
            ),
          ),
        ),
        Row(
          children: ListScore,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
