import 'package:flutter/material.dart';
class ImageData{
  String url;
  int likes;



  ImageData(this.url,this.likes);

  ImageData.fromjson(Map<String,dynamic> parsedData){
    url= parsedData['results'][0]['urls']['raw'];
    likes = parsedData['results'][0]['likes'];

  }

}
