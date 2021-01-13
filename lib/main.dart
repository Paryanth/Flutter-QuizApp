import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionNumber = 0;
  int currentScore = 0;
  Questions questions = Questions();
  void updateQuestionNumber() {
    setState(() {
      questionNumber = questionNumber + 1;
      print('$questionNumber');
    });
  }

  void udpateCurrentScore(bool choice, int question_number) {
    if (questions.questionBank.length == question_number) {
      print("End of questions");
    } else {
      if (questions.questionBank[question_number].answer == choice) {
        setState(() {
          currentScore++;
        });
      }
    }
  }

  bool checkquestionNumber(int questionNumber) {
    return questionNumber < questions.questionBank.length ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    checkquestionNumber(questionNumber)
                        ? questions.questionBank[questionNumber].questionText
                            .toString()
                        : " End",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                SizedBox(width: 20.0),
                if (checkquestionNumber(questionNumber))
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (questionNumber == questions.questionBank.length) {
                          print("End of questions");
                        } else {
                          udpateCurrentScore(true, questionNumber);
                          updateQuestionNumber();
                        }
                      });
                    },
                    child: Text('True'),
                  ),
                SizedBox(width: 20.0),
                if (checkquestionNumber(questionNumber))
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (questionNumber == questions.questionBank.length) {
                          print("End of questions");
                        } else {
                          udpateCurrentScore(false, questionNumber);
                          updateQuestionNumber();
                        }
                      });
                    },
                    child: Text('False'),
                  ),
                SizedBox(
                  height: 100.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Text(
                      "Current Score is:",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Text(
                      '${currentScore}',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
