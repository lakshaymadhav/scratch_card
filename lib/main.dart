 import 'dart:math';

import 'package:flutter/material.dart';
 import 'package:scratcher/scratcher.dart';

void main()=>runApp(MyApp());
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: Scaffold(
         body: AppBody(),
       ),
     );
   }
 }


class AppBody extends StatelessWidget {

  Random random = new Random(); 
  double Opacity=0.0;

   Future<void> scratchcardDialouge(BuildContext context){
     return showDialog(
       context: context,
       builder: (context){
         return AlertDialog(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(30),
           ),
           title: Align(
             alignment: Alignment.center,
             child: Text('congrats, you won a scratch card!!!',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
           ),
           content: StatefulBuilder(
             builder: (context, StateSetter setState){
               return Scratcher(
                 accuracy: ScratchAccuracy.low,
                 brushSize: 50,
                 threshold: 50,
                 onThreshold: (){
                   setState((){
                     Opacity=1;
                   });
                 },
                 image: Image.asset("images/trophy.png"),
                 child: AnimatedOpacity(
                   duration: Duration(milliseconds: 250),
                   opacity: Opacity,
                     child: Container(
                     height:250,
                     width: 250,
                     alignment: Alignment.center,
                     child: Text('\₹'+random.nextInt(1000).toString(),style: TextStyle(fontSize: 50,color: Colors.blue,fontWeight: FontWeight.bold),)
                   ),
                 ),
               );
             }
                  
           ),
          );
       } ,     
     );
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35) ,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide.none,
        ),
        color: Colors.blue,
        child: Text('Hey, you got a scratch card', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15),),
        onPressed: ()=>scratchcardDialouge(context),
      ),
      
    );
  }
}