
import 'package:flutter/material.dart';
import 'screen/homepage.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

        
        
        primarySwatch: Colors.deepPurple,
        fontFamily: "Ubuntu",
        textTheme: ThemeData.light().textTheme.copyWith
        (titleLarge: TextStyle(fontFamily: "Ubuntu",fontSize: 20,color: Colors.red)) ,




        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith
        (titleLarge: TextStyle(fontFamily: "Opensans",fontSize: 23,fontWeight: FontWeight.bold))),

        
     

      ),
     
       debugShowCheckedModeBanner: false,

       home: HomePage(),
    );
  }
}











