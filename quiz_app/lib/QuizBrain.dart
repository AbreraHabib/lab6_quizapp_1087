import 'Question.dart';

class QuizQuestionsBank {
  int _questionNum = 0;
  List<Question> _questionBank = [
    Question("Question # 1: \n Do camels have three sets of eyelids?", true),
    Question(
        "Question # 2: \n It is possible to sneeze while sleeping.", false),
    Question("Question # 3: \n Australia is a country as well as a continent.",
        true),
    Question("Question # 4: \n Herbivore animals consume meat.", false),
    Question(
        "Question # 5: \n The cell nucleus was discovered by Robert Brown.",
        true),
    Question(
        "Question # 6: \n The national flag of America has 51 stars.", true),
    Question(
        "Question # 7: \n Pneumonia is an infection that affects lungs.", true),
    Question(
        "Question # 8: \n Pneumonia is an infection that affects lungs.", true),
    Question("Question # 9: \n Ears are responsible for smelling.", false),
    Question("Question # 10: \n The color of cherries is red.", true)
  ];
  void NextQuestion() {
    if (_questionNum < _questionBank.length - 1) {
      _questionNum++;
    }
  }

  String GetQuestion() {
    return _questionBank[_questionNum].questionStatement;
  }

  bool CorrectAnswer() {
    return _questionBank[_questionNum].questionAnswer;
  }

  bool QuestionFinished() {
    if (_questionNum >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void Reset() {
    _questionNum = 0;
  }
}
