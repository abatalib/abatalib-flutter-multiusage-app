import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const perso_bkColor = Color(0xff282b37);
const perso_bkColorBar = Color(0xff282b37);
const perso_bkColorDivider = Color(0xffffffff);

const String perso_imgProfil = 'images/bk1.jpg';
const String perso_imgBk = 'images/photo.jpg';
const String perso_imgHome = 'images/bk1.jpg';
const String perso_imgClouds = 'images/clouds.png';
const String perso_imgRain = 'images/rain.png';
const String perso_imgClear = 'images/clear.png';


class PersoTxt extends StatelessWidget {
  final String content;
  double fsize;
  double align;//0=gauche, 1=center, 2=droite, 3=justify
  Color clr;
  int bold;
  PersoTxt(this.content, {this.fsize = 16, this.clr = Colors.white, this.align = 0, this.bold = 0});


  _alignement() {
    switch (align.round()) {//round pour convertir double à int sans cela erreur dans switch
      case 0:
        return TextAlign.left;
        break;
      case 1:
        return TextAlign.center;
        break;
      case 2:
        return TextAlign.right;
        break;
      case 3:
        return TextAlign.justify;
        break;
      default:
    }
  }

_size() {
  return this.fsize;
}

_bold() {
    if(bold==1)
      return FontWeight.bold;
    else
      return FontWeight.normal;
}

  @override
  Widget build(BuildContext context) {
    return 
      Text(this.content, style: TextStyle(fontSize: _size(), color: this.clr, fontWeight: _bold()), textAlign: _alignement(),);
  }
}