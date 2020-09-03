import 'package:flutter/material.dart';

import '../var_globales.dart';


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;
  var quiz = [
    {"title" : "Capitale du Maroc", "answers" : [
      {"answer" : "Rabat", "correct" : true},
      {"answer" : "Casablanca", "correct" : false},
      {"answer" : "Fès", "correct" : false},
    ]},
    {"title" : "Capitale des Etats unis", "answers" : [
      {"answer" : "New york", "correct" : false},
      {"answer" : "Washington", "correct" : true},
      {"answer" : "Los angeles", "correct" : false},
    ]},
    {"title" : "Capitale de la France", "answers" : [
      {"answer" : "Montpellier", "correct" : false},
      {"answer" : "Paris", "correct" : true},
      {"answer" : "Lyon", "correct" : false},
    ]},
    {"title" : "Capitale de Tunisie", "answers" : [
      {"answer" : "Tunisie", "correct" : true},
      {"answer" : "Gabès", "correct" : false},
      {"answer" : "Monastir", "correct" : false},
    ]}
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Page'),
        backgroundColor: perso_bkColorBar,
      ),
      body:
      (this.currentQuestion>=quiz.length) ?
          Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PersoTxt('Score : ${(score/quiz.length*100).round()} %', clr: Colors.black),
              RaisedButton(
                  color: perso_bkColorBar,
                  onPressed: (){
                    setState((){
                      currentQuestion=0;
                      score=0;
                    });
                  },
                child: PersoTxt('Restart...'),
              )
            ]
          ))
      :  ListView(
          children: <Widget>[
            ListTile(
              title: PersoTxt("Question ${currentQuestion+1}/${quiz.length}",fsize: 20, clr : Colors.blueGrey, align:1, bold:1)
            ),
            ListTile(
              title: PersoTxt(quiz[currentQuestion]['title'],fsize: 20, clr : Colors.blueGrey, align:0, bold:1)
            ),
            ...(quiz[currentQuestion]['answers'] as List<Map<String, Object>>).map((answer){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: perso_bkColor,
                  onPressed: () {
                    setState((){
                      if(answer['correct'] == true) {
                        ++score;
                      }
                        ++this.currentQuestion;
                    });
                  },
                  child: Container(
                    child: Align(alignment: Alignment.centerLeft,
                    child: PersoTxt(answer['answer'], fsize: 18,clr: Colors.white,align:1,bold:1)
                    ),
                      padding: EdgeInsets.all(10),
                  ),
                )
              );
            })
          ],
        )
    );
  }
}
