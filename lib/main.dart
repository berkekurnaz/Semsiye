import "package:flutter/material.dart";
import 'package:semsiye_app_project/ui/about.dart';
import 'package:semsiye_app_project/ui/buildSettings.dart';
import 'package:semsiye_app_project/ui/home.dart';
import 'package:semsiye_app_project/ui/welcome.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: "Comfortaa",
      accentColor: Colors.black,
      
    ),
    initialRoute: "/",
    routes: {
      "/": (context) => Welcome()
    }
  ));
}