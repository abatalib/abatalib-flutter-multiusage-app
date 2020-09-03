import 'package:flutter/material.dart';
import 'package:my_app/var_globales.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';


class WeatherDetails extends StatefulWidget {
  String ville = "";

  WeatherDetails(this.ville);
  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  var weatherData;

  void initState() {
    super.initState();
    getData(widget.ville);
  }

  getData(String ville) {
    print("Getting weather of " + ville);
    String url =
        "http://api.openweathermap.org/data/2.5/forecast?q=${ville}&APPID=98dce11eb7e0a4efc80b3db88e0e4dd9";
    http.get(url).then((resp) {
      if (resp.statusCode == 200)
        setState(() {
          this.weatherData = json.decode(resp.body);
        });
      else
        this.weatherData = null;

    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
  String imge;

    return Scaffold(
        appBar: AppBar(
          title: Text('Weather of ${widget.ville.toUpperCase()}'),
          backgroundColor: perso_bkColorBar,
        ),
        body: (weatherData == null
            ?
              Center(child: CircularProgressIndicator(),)
            :
              ListView.builder(
                    itemCount: (weatherData==null?0:weatherData['list'].length),
                    itemBuilder: (context, index) {
                      imge = "images/${weatherData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png";
                      return Card(
                        color: perso_bkColor,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget> [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(imge),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        PersoTxt(
                                            "${new DateFormat('E dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt']*1000000))}", fsize:20),
                                        PersoTxt(
                                            "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt']*1000000))} | ${weatherData['list'][index]['weather'][0]['main']}", fsize:20),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              PersoTxt(
                                  "${(weatherData['list'][index]['main']['temp']-273.15).round()} °C", fsize:20),
                              ],
                          ),
                        ),
                      );
                    }
                    )
          )
    );
  }
}
