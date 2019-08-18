import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:semsiye_app_project/components/myAppBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:semsiye_app_project/data/comments.dart';
import 'package:semsiye_app_project/utilities/dayConvertToTurkish.dart';
import 'package:semsiye_app_project/utilities/weatherConvertToIcon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  String cityName;

  String weatherCondition;

  String weatherTemp;

  String weatherMax;
  String weatherMin;

  String windSpeed;
  String humidity; //nem
  String pressure; //basınç

  var otherDays = {};

  Home(
      {this.cityName,
      this.weatherCondition,
      this.weatherTemp,
      this.weatherMax,
      this.weatherMin,
      this.windSpeed,
      this.humidity,
      this.pressure,
      this.otherDays});
}

class _HomeState extends State<Home> {
  
  String userName;
  String userSurname;
  String userCity;

  String comment;

  String otherDay1;
  String otherDay2;
  String otherDay3;
  String otherDay4;
  String otherDay5;

  void _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("UserName");
      userSurname = prefs.getString("UserSurname");
      userCity = prefs.getString("UserCity");
    });
    print("$userName $userSurname $userCity");
  }

  String _getWeatherComment(){
    Comments comments = new Comments();
    return comments.commentsForSunnyDay(10, 1000, 15);
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
    comment = _getWeatherComment();
    DateConvertToTurkish dateConvertToTurkish = new DateConvertToTurkish();
    otherDay1 = dateConvertToTurkish.day1;
    otherDay2 = dateConvertToTurkish.day2;
    otherDay3 = dateConvertToTurkish.day3;
    otherDay4 = dateConvertToTurkish.day4;
    otherDay5 = dateConvertToTurkish.day5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(comment: comment,),
      body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 50),
                _weatherName(widget.cityName),
                SizedBox(height: 15),
                _weatherCondition(widget.weatherCondition),
                SizedBox(height: 15),
                _weatherIcon(),
                SizedBox(height: 20),
                _weatherHeat(widget.weatherTemp),
                _weatherHeatMaxMin(widget.weatherMax, widget.weatherMin),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  color: Colors.black,
                  height: 1,
                ),
                _weatherOtherDays(widget.otherDays["day1"].toString() , widget.otherDays["day2"].toString(), widget.otherDays["day3"].toString(), widget.otherDays["day4"].toString() ,widget.otherDays["day5"].toString(), widget.otherDays["day1icon"].toString(), widget.otherDays["day2icon"].toString(), widget.otherDays["day3icon"].toString(), widget.otherDays["day4icon"].toString(), widget.otherDays["day5icon"].toString()),
                Divider(
                  color: Colors.black,
                  height: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                _weatherStatistics(
                    widget.windSpeed, widget.humidity, widget.pressure),
              ],
            ),
          )),
    );
  }

  Widget _weatherName(String txtCity) {
    return Center(
      child: Text(
        "$txtCity",
        style: TextStyle(
            fontFamily: "Comfortaa",
            fontSize: 35.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _weatherCondition(String txtWeatherCondition) {
    return Center(
      child: getWeatherIconToString(txtWeatherCondition),
    );
  }

  Widget _weatherIcon() {
    return Center(
        child: getWeatherIcon("${widget.weatherCondition}"),
    );
  }

  Widget _weatherHeat(String txtWeatherTemp) {
    return Center(
      child: Text(
        "$txtWeatherTemp°",
        style: TextStyle(
            fontFamily: "Comfortaa",
            fontSize: 50.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _weatherHeatMaxMin(String txtWeatherMax, String txtWeatherMin) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Text("Max"), Text("$txtWeatherMax")],
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              color: Colors.black,
              width: 1.5,
              height: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Text("Min"), Text("$txtWeatherMin")],
          ),
        ],
      ),
    );
  }

  Widget _weatherStatistics(
      String txtWindSpeed, String txtHumidity, String txtPressure) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
      height: 70.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              width: 100.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.wind,
                    color: Colors.black54,
                  ),
                  Text(
                    "Rüzgar Hızı",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$txtWindSpeed m/s",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 100.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.wind,
                    color: Colors.black54,
                  ),
                  Text(
                    "Nem",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$txtHumidity",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 100.0,
              child: Column(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.wind,
                    color: Colors.black54,
                  ),
                  Text(
                    "Basınç",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$txtPressure",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _weatherOtherDays(String weather1, String weather2, String weather3, String weather4, String weather5, String icon1, String icon2, String icon3, String icon4, String icon5) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
      height: 80.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "${otherDay1}",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  getWeatherIconSimple("$icon1"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${weather1}°",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "${otherDay2}",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  getWeatherIconSimple("$icon2"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${weather2}°",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "${otherDay3}",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  getWeatherIconSimple("$icon3"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${weather3}°",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "${otherDay4}",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  getWeatherIconSimple("$icon4"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${weather4}°",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    "${otherDay5}",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  getWeatherIconSimple("$icon5"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${weather5}°",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _weatherComment() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.black),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Text(
            "Merhaba Berke. Bugün Havanın Güneşli Olduğunu Görebiliyorum.",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
