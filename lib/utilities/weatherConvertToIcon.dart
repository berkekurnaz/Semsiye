import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon(String weather) {
  if (weather == "Clear") {
    return Icon(FontAwesomeIcons.sun,color: Colors.black,size: 60,);
  } else if (weather == "Clouds") {
    return Icon(FontAwesomeIcons.cloud,color: Colors.black,size: 60,);
  } else if (weather == "Rain") {
    return Icon(FontAwesomeIcons.cloudRain,color: Colors.black,size: 60,);
  } else if (weather == "Snow") {
    return Icon(FontAwesomeIcons.snowman,color: Colors.black,size: 60,);
  } else {
    return Icon(FontAwesomeIcons.sun,color: Colors.black,size: 60,);
  }
}

Widget getWeatherIconSimple(String weather) {
  if (weather == "Clear") {
    return Icon(FontAwesomeIcons.sun,color: Colors.grey.shade700,size: 30,);
  } else if (weather == "Clouds") {
    return Icon(FontAwesomeIcons.cloud,color: Colors.grey.shade700,size: 30,);
  } else if (weather == "Rain") {
    return Icon(FontAwesomeIcons.cloudRain,color: Colors.grey.shade700,size: 30,);
  } else if (weather == "Snow") {
    return Icon(FontAwesomeIcons.snowman,color: Colors.grey.shade700,size: 30,);
  } else {
    return Icon(FontAwesomeIcons.sun,color: Colors.grey.shade700,size: 30,);
  }
}

Widget getWeatherIconToString(String weather) {
  if (weather == "Clear") {
    return Text("Güneşli",style: TextStyle(fontFamily: "Comfortaa", fontSize: 20.0),);
  } else if (weather == "Clouds") {
    return Text("Bulutlu",style: TextStyle(fontFamily: "Comfortaa", fontSize: 20.0),);
  } else if (weather == "Rain") {
    return Text("Yağmurlu",style: TextStyle(fontFamily: "Comfortaa", fontSize: 20.0),);
  } else if (weather == "Snow") {
    return Text("Karlı",style: TextStyle(fontFamily: "Comfortaa", fontSize: 20.0),);
  } else {
    return Text("Güneşli",style: TextStyle(fontFamily: "Comfortaa", fontSize: 20.0),);
  }
}
