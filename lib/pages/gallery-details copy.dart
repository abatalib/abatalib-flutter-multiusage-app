import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../var_globales.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class GalleryDetails extends StatefulWidget {
  String keyword;

  GalleryDetails(this.keyword);
  @override
  _GalleryDetailsState createState() => _GalleryDetailsState();
}

class _GalleryDetailsState extends State<GalleryDetails> {
  List<dynamic> hits;
  var listGallery;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  getData(){
    String url = "https://pixabay.com/api/?key=16852301-300112706623c171ebca0a23d&q=${widget.keyword}";
    http.get(url).then((resp){
      setState(() {
        listGallery = json.decode(resp.body);
        hits = listGallery['hits'];
      });
    }).catchError((err){
      print(err);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PersoTxt(widget.keyword.toUpperCase(), fsize: 20, align:1),
        backgroundColor: perso_bkColorBar,
      ),
      body: (hits == null
        ?
          Center(child: CircularProgressIndicator(),)
        :
        ListView.builder(
          itemCount: (hits == null ? 0 : hits.length),
          itemBuilder: (context, index) {
            return Card(
              color: perso_bkColor,
              child:
                  Padding(
                    padding: EdgeInsets.all(4.0),
                      child:
                          Column(
                            children: <Widget>[
                              Image(image: NetworkImage(hits[index]['webformatURL'])),
                              Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child:
                                      Column(
                                          children: <Widget>[
                                            Row(
                                                children: <Widget>[
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(padding: EdgeInsets.only(right:10.0),
                                                        child:
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: <Widget>[
                                                            Icon(Icons.remove_red_eye, color: Colors.white, size: 14,),
                                                            PersoTxt(" ${new NumberFormat("#,###").format(hits[index]['views'])}"),
                                                            Icon(Icons.file_download, color: Colors.white, size: 14,),
                                                            PersoTxt(" ${new NumberFormat("#,###").format(hits[index]['downloads'])}"),
                                                          ],
                                                        ),
                                                      ),
                                                    ]
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(padding: EdgeInsets.only(left:10.0, right: 10.0),
                                                        child:
                                                        Row(
                                                          children: <Widget>[
                                                            Icon(Icons.favorite, color: Colors.white, size: 14,),
                                                            PersoTxt(" ${new NumberFormat("#,###").format(hits[index]['favorites'])}"),
                                                            Icon(Icons.thumb_up, color: Colors.white, size: 14,),
                                                            PersoTxt(" ${new NumberFormat("#,###").format(hits[index]['downloads'])}"),
                                                          ],
                                                        ),
                                                      ),
                                                    ]
                                                  )

                                                ]
                                            ),

                                          ]
                                      )
                              ),
                            ]
                          ),
                  ),
            );
          }
        )
      ),
    );
  }
}
