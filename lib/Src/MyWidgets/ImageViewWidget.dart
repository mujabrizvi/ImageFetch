import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_fetch/Src/ModelClasses/ImageData.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ImageList extends StatelessWidget{



  List<ImageData> myImgList=[];
  ImageList(this.myImgList);

//this is my image view to show images
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myImgList.length,
        itemBuilder: (context,index)
        {

          //here to access the list view item we just have to use the index number
          // to refer to that specific item in the list

           return buildImageFromData(myImgList[index]);

         });

  }

  //to avoid writing too much inside itemBuilder i am creating a new method
  //this function is receiving our model class object at a specific index to work with


  Widget buildImageFromData(ImageData listViewArgument)
  {
    return Container(

      margin: EdgeInsets.all(20.0),
      child: Column(
        children : <Widget>[
          Padding(
            child: Image.network(

              listViewArgument.url,
                ),
            padding: EdgeInsets.only(
              bottom: 8.0,
            ),
          ),


          Padding(
            child: Text("Likes :"+listViewArgument.likes.toString()),
            padding: EdgeInsets.only(
              left: 8.0,
              bottom: 8.0,
            ),
          ),

        ],
      ),

      //to add border we use decoration property
      //and we use BoxDecoration class inside it to add border
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),

      ),

    );

  }






}