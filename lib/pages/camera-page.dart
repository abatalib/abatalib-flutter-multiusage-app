import 'package:flutter/material.dart';

import '../var_globales.dart';


class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CameraPage'),
        backgroundColor: perso_bkColorBar,
      ),
      body: Center(
        child: Text('CameraPage',
            style: TextStyle(fontSize: 22, color: Colors.blue)),
      ),
    );
  }
}