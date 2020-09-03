import 'package:flutter/material.dart';
import './gallery-details.dart';
import '../var_globales.dart';


class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String keyword="";
  TextEditingController editingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery Page - ${this.keyword}'),
        backgroundColor: perso_bkColorBar,
      ),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              child:
              TextField(
                decoration: InputDecoration(hintText: 'thème à rechercher'),
                onChanged: (value){
                  setState(() {
                    this.keyword = value;
                  });
                },
                controller: editingController,
                onSubmitted: (value){
                  this.keyword = value;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDetails(this.keyword)));
                  editingController.text = "";
                },
              ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: RaisedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDetails(this.keyword)));
                editingController.text = "";
              },
              icon: Icon(Icons.search),
              label: PersoTxt('Search', fsize:14, align:1, clr:Colors.black),
              color: Colors.amber,
            ),
          ),
        ]
      ),
    );
  }
}