import 'package:flutter/material.dart';
import './weather-details.dart';
import '../var_globales.dart';


class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  void initState() {
    super.initState();
//    getData();
  }
  String ville = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather of ' + ville.toUpperCase()),
        backgroundColor: perso_bkColorBar,
      ),
      body: Center(
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Saisir la ville'),
                onChanged: (value){
                  setState(() {
                    this.ville = value;
                  });
                },
              ),

            Container(
              width: double.infinity,
              child: RaisedButton.icon(
                onPressed: () {
                  if(ville != '') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            WeatherDetails(ville)));
                  }
                },
                icon: Icon(Icons.search),
                label: PersoTxt('', fsize:14, align:1, clr:Colors.black),
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}