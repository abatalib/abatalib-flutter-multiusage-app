import 'package:flutter/material.dart';
import './menu.dart';
import 'var_globales.dart';

Widget dividr = Divider(color: perso_bkColorDivider);

class Drwer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(color: perso_bkColor,
        child: ListView(
          children: <Widget>[
            // DrawerH(),
            DrwerHeader(),
              dividr,
            Menu('Quiz', 'QuizPage'),
            Menu('Weather', 'WeatherPage'),
            Menu('Gallery', 'GalleryPage'),
            Menu('Camera', 'CameraPage'),
          ],
        ),//ListView
      ), //Container
    );
  }
}

class DrwerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: PersoTxt('Bruce Lee'),
      accountEmail: PersoTxt('bruce@lee.com'),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(perso_imgBk),
        ),
      ),
      decoration: BoxDecoration(
        color: perso_bkColor, //const Color(0xff282b37),
        // image: DecorationImage(image: AssetImage(perso_imgProfil),
        // fit: BoxFit.fill,
        // ),
      ),
    );
  }
}

class DrawerH extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          image: AssetImage(perso_imgProfil),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: CircleAvatar(
          radius: 60,
          // backgroundImage: NetworkImage('https://1f0c7243sbms4c9a3d39xz61-wpengine.netdna-ssl.com/wp-content/uploads/2011/06/photo-portrait_vieil-homme_laurent-breillat-407x610.jpg'),
          backgroundImage: AssetImage(perso_imgBk),
        ),
      ),
    );
  }
}
