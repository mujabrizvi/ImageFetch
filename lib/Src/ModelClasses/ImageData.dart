import 'package:flutter/material.dart';
class ImageData{
  var id;
  String raw;
  String likes;



  ImageData(this.id,this.raw,this.likes);

  ImageData.fromjson(Map<String,dynamic> parsedData){
    //id= parsedData['results']['index']['id'];
    likes= parsedData['likes'];
     raw = parsedData['raw'];

    //to pick the url i have to iterate into urls object
   // url=
  }

}


//class Source {
//  String id;
//  String name;
//
//  Source({this.id, this.name});
//
//  factory Source.fromJson(Map<String, dynamic> json) {
//    return Source(
//      id: json["id"] as String,
//      //name: json["name"] as String,
//    );
//  }
//}