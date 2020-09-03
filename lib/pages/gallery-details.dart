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
  int currentPage = 1;
  int size = 10;
  int totalPages = 0;
  ScrollController _scrollController = new ScrollController();
  List<dynamic> hits = [];
  var listGallery;


  getData() {
    String url = "https://pixabay.com/api/?key=16852301-300112706623c171ebca0a23d&q=${widget
        .keyword}";
    http.get(url).then((resp) {
      setState(() {
        listGallery = json.decode(resp.body);
        hits.addAll(listGallery['hits']);
        if (listGallery['totalHits'] % size == 0)
          totalPages = listGallery['totalHits'] ~/ size;
        else
          totalPages = 1 + (listGallery['totalHits'] / size).floor();
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PersoTxt(widget.keyword.toUpperCase() +
            ", Page ${this.currentPage}/${this.totalPages}", fsize: 20, align: 1),
        backgroundColor: perso_bkColorBar,
      ),
      body: (hits == null
          ?
      Center(child: CircularProgressIndicator())
          :
      ListView.builder(
          itemCount: (hits == null ? 0 : hits.length),
          controller: _scrollController,
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
                        padding: EdgeInsets.all(10.0),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child:
                              Icon(Icons.remove_red_eye, color: Colors.white,
                                size: 18,),
                            ),
                            PersoTxt(" ${new NumberFormat("#,###").format(
                                hits[index]['views'])}", fsize: 18),

                            Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 6.0),
                              child:
                              Icon(Icons.file_download, color: Colors.white,
                                size: 18,),
                            ),
                            PersoTxt(" ${new NumberFormat("#,###").format(
                                hits[index]['downloads'])}", fsize: 18),
                          ],
                        ),
                      ),
//                      img_info_1(hits[index]['views'], hits[index]['donwloads']),

                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 6.0),
                              child:
                              Icon(
                                Icons.favorite, color: Colors.white, size: 18,),
                            ),
                            PersoTxt(" ${new NumberFormat("#,###").format(
                                hits[index]['favorites'])}", fsize: 18),

                            Padding(
                              padding: EdgeInsets.only(left: 20.0, right: 6.0),
                              child:
                              Icon(
                                Icons.thumb_up, color: Colors.white, size: 18,),
                            ),
                            PersoTxt(" ${new NumberFormat("#,###").format(
                                hits[index]['likes'])}", fsize: 18),
                          ],
                        ),
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          ++currentPage;
          this.getData();
        }
      }
    });
  }

  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
//
//  img_info_1(views, downloads) {
//    return Padding(
//      padding: EdgeInsets.all(10.0),
//      child:
//      Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(right: 6.0),
//            child:
//            Icon(Icons.remove_red_eye, color: Colors.white, size: 18,),
//          ),
//          PersoTxt(" ${new NumberFormat("#,###").format(views)}", fsize: 18),
//
//          Padding(
//            padding: EdgeInsets.only(left: 20.0, right: 6.0),
//            child:
//            Icon(Icons.file_download, color: Colors.white, size: 18,),
//          ),
//          PersoTxt(
//              " ${new NumberFormat("#,###").format(downloads)}", fsize: 18),
//        ],
//      ),
//    );
//  }

}