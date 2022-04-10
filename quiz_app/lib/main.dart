import 'package:flutter/material.dart';
import 'QuizBrain.dart';

QuizQuestionsBank quizQuestionBank = QuizQuestionsBank();

void main() {
  runApp(Abrera_Habib());
}

class Abrera_Habib extends StatefulWidget {
  const Abrera_Habib({Key? key}) : super(key: key);

  @override
  State<Abrera_Habib> createState() => _Abrera_HabibState();
}

class _Abrera_HabibState extends State<Abrera_Habib> {
  List<Icon> scoreKeeper = [];
  void CheckAns(bool userAns) {
    bool correctAns = quizQuestionBank.CorrectAnswer();
    if (quizQuestionBank.QuestionFinished() == true) {
      quizQuestionBank.Reset();
      scoreKeeper = [];
    } else {
      if (userAns == correctAns) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      setState(() {
        quizQuestionBank.NextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.black,
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        quizQuestionBank.GetQuestion(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.green,
                  child: TextButton(
                    onPressed: () {
                      CheckAns(true);
                    },
                    child: Center(
                      child: Text(
                        "True",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 10,
                    width: double.infinity,
                    color: Colors.red,
                    child: TextButton(
                      onPressed: () {
                        CheckAns(false);
                      },
                      child: Center(
                        child: Text(
                          "False",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}
