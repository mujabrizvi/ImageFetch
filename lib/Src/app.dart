import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import '../Src/ModelClasses/ImageData.dart';
import '../Src/MyWidgets/ImageViewWidget.dart';
import 'package:progress_dialog/progress_dialog.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>MyAppState();

}


class MyAppState extends State<MyApp>{

  //List<ImageData> imagesList=[];
  //testing purpose
  // int counter=-1;
  ProgressDialog myprogressDialog;

  List<ImageData> imagesList=[];

  void fetchimage() async
  {
    final client_id="bknlMr27DHVmxEw5kXWEf7DB7ibr9eN_vLMNPbwW8Eg";
    //counter++;
    //final token = 'bknlMr27DHVmxEw5kXWEf7DB7ibr9eN_vLMNPbwW8Eg';
    final url='https://api.unsplash.com/photos/random?per_page=10&client_id=$client_id&query=%27nature%27';

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

      //print("Response is ->"+response.body);
       //counter++;

     var parsedRes=json.decode(response.body);
//     print(" Parsed data is->");
//     print(parsedRes);
//     var data=parsedRes['urls']['raw'];
//     //var data=parsedRes['results'][0]['likes'];
//     print(data);

    //here i passed the parsed data to extract important data into named constructor
    //i also send the counter value to the named constructor to parse the data

    /*var ImageData_obj= ImageData.fromjson(parsedRes,counter);*/

    //simple method
    var ImageData_obj= ImageData.fromjson(parsedRes);

     setState(() {
       imagesList.add(ImageData_obj);
     });

  }

  @override
  Widget build(BuildContext context) {

    myprogressDialog=new ProgressDialog(context,type: ProgressDialogType.Normal);
    myprogressDialog.style(
    message: "Loading......",
    backgroundColor:Colors.red,

    );

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










