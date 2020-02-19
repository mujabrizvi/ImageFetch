import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import '../Src/ModelClasses/ImageData.dart';
import '../Src/MyWidgets/ImageViewWidget.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>MyAppState();

}


class MyAppState extends State<MyApp>{

  //List<ImageData> imagesList=[];

  //testing purpose
  List<ImageData> imagesList=[];

  void fetchimage() async
  {


    //final token = 'bknlMr27DHVmxEw5kXWEf7DB7ibr9eN_vLMNPbwW8Eg';
    final url='https://api.unsplash.com/search/photos?per_page=01&client_id=bknlMr27DHVmxEw5kXWEf7DB7ibr9eN_vLMNPbwW8Eg&query=%E2%80%99nature%E2%80%99';

    //here to send the headers also for authentication
//    Map<String,String> my_headers= {
//      "Accept" : "application/json",
//      //"Accept-version" : "v1",
//      "client_id": "bknlMr27DHVmxEw5kXWEf7DB7ibr9eN_vLMNPbwW8Eg",
//
//     // HttpHeaders.authorizationHeader : "Bearer$token"
//
//    };


    var response = await get(url);
      //print(response.body);
     var parsedRes=json.decode(response.body);
     //print("Resposse is ->");
    // print(parsedRes);
    // var data=parsedRes['results'][0]['urls']['raw'];
//    var data=parsedRes['results'][0]['likes'];
//     print(data);

     var ImageData_obj= ImageData.fromjson(parsedRes);


     setState(() {
         imagesList.add(ImageData_obj);
     });

  }

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       body: ImageList(imagesList),
       appBar: AppBar(
         title: Text(
           "Image Fetch App"
         ),
       ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add

         ),

           onPressed: (){

           fetchimage();
         }
    ),

     ),


   );
    }
  }










