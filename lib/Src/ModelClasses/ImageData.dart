import 'package:flutter/material.dart';
class ImageData{
  String url;
  int likes;
   //int count;



  ImageData(this.url,this.likes);

 /*
 //second method with counter

  ImageData.fromjson(Map<String,dynamic> parsedData, int count){

      url = parsedData['results'][count]['urls']['raw'];
      likes = parsedData['results'][count]['likes'];



  }


  */

  ImageData.fromjson(Map<String,dynamic> parsedData){

// standard way of pasrsing json data with indexes
//      url = parsedData['results'][0]['urls']['raw'];
//      likes = parsedData['results'][0]['likes'];

       url = parsedData['urls']['raw'];
      likes = parsedData['likes'];


  }





}
