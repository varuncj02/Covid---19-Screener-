import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
import 'QuestionBank.dart';

QuestionBank questionBank = new QuestionBank();

//void main() => runApp(HomePage());

void main() {
  runApp(MaterialApp(
    title: 'Navigating Screens',
    home: HomePage(),
  ));
}

// First Page that shows up in the Application
class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: WelcomePage(),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: DiagnosisPage(),
          ),
        ),
      ),
    );
  }
}

ListTile _listHeader(String title, BuildContext context) {
  return ListTile(
    title: Text(title),
    onTap: () {
      Navigator.pop(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    },
  );
}

ListTile _listBuilder(String title, String content, BuildContext context) {
  return ListTile(
    title: Text(title),
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
            );
          });
    },
  );
}

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Algorithm Description', textAlign: TextAlign.center),
          backgroundColor: Colors.deepPurple[200],
        ),
        body: ListView(
          children: <Widget>[
            _listHeader("Back to Welcome Page", context),
            _listBuilder(
                "Fever",
                "Fever is the most prominent symptom for COVID-19. According to the recent peer-reviewed journal papers, fever was reported from 88% to 98% of the COVID-19 patients. Therefore we gave the weight of 93 for fever that is the average of 88 & 98.",
                context),
            _listBuilder(
                "Dry cough",
                " Dry cough is a very prominent symptom for COVID-19. According to the recent peer-reviewed journal papers, dry cough was reported from 57% to 82% of the COVID-19 patients. Therefore, we gave the weight of 69.5 that is the average of 57 & 82.",
                context),
            _listBuilder(
                "Fatigue (feel tired)",
                "According to the recent peer-reviewed journal papers, fatigue was reported from 29% to 69% of the COVID-19 patients. Therefore, we gave the weight of 49 that is the average of 29 & 69.",
                context),
            _listBuilder(
                "(Mild) Difficulty breathing",
                "According to the recent peer-reviewed journal papers, difficulty breathing was reported from 18% to 55% of the COVID-19 patients. Therefore, we gave the weight of 36.5 that is the average of 18 & 55.",
                context),
            _listBuilder(
                "No appetite",
                "According to the recent peer-reviewed journal papers, no appetite was reported 40% of the COVID-19 patients. Therefore, we gave the weight of 40. ",
                context),
            _listBuilder(
                "Sputum (spitting with lung mucus)",
                " According to the recent peer-reviewed journal papers (6, 8, 9, 112), sputum was reported from 26% to 33% of the COVID-19 patients. Therefore, we gave the weight of 29.5 that is the average of 26 & 33.",
                context),
            _listBuilder(
                "Muscle or bone pain",
                "According to the recent peer-reviewed journal papers (6, 7, 8, 9, 88, 112), muscle or bone pain was reported from 11% to 44% of the COVID-19 patients. Therefore, we gave the weight of 27.5 that is the average of 11 & 44.",
                context),
            _listBuilder(
                "Sore throat",
                "According to the recent peer-reviewed journal papers (7, 8, 9, 112), sore throat was reported from 5% to 17% of the COVID-19 patients. Therefore, we gave the weight of 11 that is the average of 5 & 17.",
                context),
            _listBuilder(
                "Nausea, vomiting, or diarrhea",
                "According to the recent peer-reviewed journal papers (6, 7, 8, 9, 10, 89, 112), nausea, vomiting, or diarrhea was reported from 1% to 40% of the COVID-19 patients. Therefore, we gave the weight of 24 due to its predictive value of presenting with nausea or diarrhea 1 to 2 days prior to onset of fever and breathing difficulties.",
                context),
            _listBuilder(
                "Loss of smell or taste",
                "According to a recent study from Korea notified that, loss of smell or taste was reported in 15% of the COVID-19 patients. Therefore, we gave the weight of 15.",
                context),
            _listBuilder("Chills (cold or shivering)", "", context),
            _listBuilder(
                "Headache or dizziness",
                "According to the recent peer-reviewed journal papers (6, 7, 8, 9, 89, 112), headache or dizziness was reported from 6% to 14% of the COVID-19 patients. Therefore, we gave the weight of 10 that is the average of 6 & 14.",
                context),
          ],
        ),
      ),
    );
  }
}

class DiagnosisPage extends StatefulWidget {
  @override
  _DiagnosisPageState createState() => _DiagnosisPageState();
}

class _DiagnosisPageState extends State<DiagnosisPage> {
  bool riskAssesment1 = false; // Case for the 1st risk assessment question
  bool riskAssesment2 = false; // Case for the 2nd risk assessment question
  double scoreTracker = 0.0;
  int counter = 0;
  List<double> weights = [
    1.35,
    1.7,
    93,
    69.5,
    53.5,
    40,
    35,
    29.5,
    27.5,
    11,
    24,
    15,
    11,
    10
  ];
  List<Icon> scoreKeeper = [];

  void incrementScore(int userOption) {
    setState(() {
      if (questionBank.isFinished()) {
        double scoreCopy = scoreTracker;
        double scoreCopy2 = 0.0;
        if (riskAssesment1) {
          scoreCopy = scoreTracker * weights[0];
        }
        if (riskAssesment2) {
          scoreCopy2 = scoreTracker * weights[1];
        }
        scoreTracker = scoreCopy + scoreCopy2;
        if (scoreTracker > 212.0) {
          showDialog(
            context: context,
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
                child: Text(
                    "Your Score is " +
                        scoreTracker.toInt().toString() +
                        " which is above threshold score of 212  " +
                        "Serious. You Depict Covid-19 symptoms. Go see a physician .Click to go back to Welcome Page",
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            /*builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Serious'),
                  content: Text('You depict Covid-19 symptoms. Go see a physician'),
                );
              }*/
          );
        } else {
          showDialog(
            context: context,
            child: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
                child: Text(
                    'Do not show active symptoms of Covid - 91 .Click to go back to Welcome Page',
                    style: TextStyle(fontSize: 20)),
              ),
            ),
            /*builder: (BuildContext context) {
                //Navigator.pop(context);
                return AlertDialog(
                  title: Text("Recommendation"),
                  content: Text("Don't show Covid-19 symptoms"),
                );
              }*/
          );
        }

        questionBank.reset();

        scoreTracker = 0.0;
      } else {
        if (userOption == 1) {
          if (counter == 0) {
            riskAssesment1 = true;
            counter++;
            scoreKeeper.add(Icon(
              Icons.check,
              color: Colors.green,
            ));
          } else if (counter == 1) {
            riskAssesment2 = true;
            counter++;
            scoreKeeper.add(Icon(
              Icons.check,
              color: Colors.green,
            ));
          } else {
            scoreTracker += weights[counter];
            print(scoreTracker);
            print(weights[counter]);
            counter++;
            scoreKeeper.add(Icon(
              Icons.check,
              color: Colors.green,
            ));
          }
        }
        // The other option being 0
        else {
          counter++;
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        questionBank.questionIncrementer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(Icons.arrow_left, size: 50),
              padding: EdgeInsets.all(1.0),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank.getQuestion(),
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
                'Yes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                incrementScore(1);
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
                'No',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                incrementScore(0);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

class WelcomePage extends StatefulWidget {
  // Step 1 : High Risk Factors to be asked here before Screening
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Covid - 19 Screener', textAlign: TextAlign.center),
          backgroundColor: Colors.deepPurple[200],
        ),
        body: ListView(
          //addAutomaticKeepAlives: context
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Start Screening'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                            "Life Threatening Situation - If you Have them Call 911 Immediately"),
                        content: Text(
                            "Severe Difficulty breathing , Chest pain, Pressure, Irregular Heartbeat. Bluish lips & face (cyanosis: indicates lower oxygen in blood) Loss of consciousness (fainting)"),
                      );
                    });
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Info on Score Calculation and Covid-19'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppInfo()));
              },
            ),
          ],
        ),
        /*body: Center(
          child: RaisedButton(
            child: Text('Start Screening'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Life Threatening Situation - If you Have them Call 911 Immediately"),
                      //contentTextStyle: TextStyle(fontStyle: FontStyle.italic),
                      content: Text(
                          "Severe Difficulty breathing , Chest pain, Pressure, Irregular Heartbeat. Bluish lips & face (cyanosis: indicates lower oxygen in blood) Loss of consciousness (fainting)"),
                    );
                  });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
        ),*/
      ),
    );
    /*return Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded (
          child: Center(
          child: RaisedButton(
            color: Colors.white,
            child: Text('Start Covid-19 Screening'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
        ),
          ),
        ],
       
      );*/
  }
}
