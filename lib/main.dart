import 'package:flutter/material.dart';
import './var_globales.dart';
import './drawer_page.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

Widget persoWidgTxtHome = Container(
  padding: EdgeInsets.all(20),
  child: Column(
    children: <Widget>[
      PersoTxt("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.", fsize: 18, clr : Colors.black, align:3, bold:1),
      PersoTxt("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.", fsize: 18, clr: Colors.black, align:3),
      PersoTxt("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.", fsize: 18, clr: Colors.black, align:3),
    ],
  ),
);


  Widget persoWidgImgeHome = Container(
      child: Image(image: AssetImage(perso_imgHome)),
      );

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titre application'),
        backgroundColor: perso_bkColorBar,
      ),
      body: ListView(
        children: <Widget>[
          persoWidgImgeHome,
          persoWidgTxtHome,
        ],
      ),
      drawer: Drwer(),
    );
  } //Widget build
}

