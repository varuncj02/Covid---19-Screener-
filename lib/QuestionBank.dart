import 'Question.dart';

class QuestionBank {
  int questionNumber = 0;

  List<Question> _questions = [
    Question('Are you older than 50 or younger than 5?'),
    Question('Have you been diagnosed with any pre-existing chronic health conditions associated withoutcomes of COVID-19? (any respiratory disease, any heart disease, hypertension, diabetes, or any immunocompromised disease)'),
    Question('Fever above 37.8C/100Fin armpit or forehead'),
    Question('Dry cough'),
    Question('Fatigue (feeling extra tired)'),
    Question('No appetite'),
    Question('Mild difficulty breathing'),
    Question('Sputum (spitting with lung mucus)'),
    Question('Muscle or bone pain'),
    Question('Sore throat'),
    Question('Nausea, vomiting, or diarrhea'),
    Question('Loss of smell or taste'),
    Question('Chills (cold or shivering)'),
    Question('Headache or Dizziness'),
  ];

  void questionIncrementer(){
    if(questionNumber < _questions.length){
      questionNumber++;
    }
  }

  String getQuestion(){
    return _questions[questionNumber].text;
  }

  /*int getScoreMultiplier(){
    return _questions[questionNumber].multiplier;
  }*/

  bool isFinished() {
    if (questionNumber >= _questions.length - 1) {

      print('Diagnosis Finished');
      return true;
    } 
    else {
      return false;
    }
  }

  
  void reset() {
    questionNumber = 0;
  }

}