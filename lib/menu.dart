import 'package:flutter/material.dart';
import 'package:my_app/var_globales.dart';

import './pages/quiz-page.dart';
import './pages/weather-page.dart';
import './pages/gallery-page.dart';
import './pages/camera-page.dart';

class Menu extends StatelessWidget{
  final String titre;
  final String tap;

  Menu (this.titre, this.tap);
  
  menuSel() {
    switch (this.tap) {
      case "QuizPage":
        return QuizPage();
      case "WeatherPage":
        return WeatherPage();
      case "GalleryPage":
        return GalleryPage();
      case "CameraPage":
        return CameraPage();

      default:
        return new Text("Error");
    }
  }
  
  menuIcon() {
    switch (this.tap) {
      case "QuizPage":
        return Icons.access_alarm;
      case "WeatherPage":
        return Icons.cloud_queue;
      case "GalleryPage":
        return Icons.image;
      case "CameraPage":
        return Icons.camera_alt;

      default:
        return new Text("Error");
    }
  }

    @override
  Widget build(BuildContext context) {
    return ListTile(
        title: PersoTxt(titre, fsize: 17),
        leading: Icon(menuIcon(), color: Colors.white),
        onTap: (){
          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>menuSel()));
        },
    );
  }
}