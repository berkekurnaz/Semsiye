import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:dio/dio.dart';
import 'package:semsiye_app_project/data/apiKey.dart';
import 'package:semsiye_app_project/ui/buildSettings.dart';
import 'package:semsiye_app_project/ui/home.dart';
import 'package:semsiye_app_project/utilities/dateConvertToString.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String url =
      "http://api.openweathermap.org/data/2.5/weather?q=Balikesir,tr&APPID=${ApiKey.apiKey}&units=metric";

  String cityName = "";

  String weatherCondition = "Tester";

  String weatherTemp = "";

  String weatherMax = "";
  String weatherMin = "";

  String windSpeed = "";
  String humidity = ""; //nem
  String pressure = ""; //basınç

  String day1;
  String day2;
  String day3;
  String day4;
  String day5;

  String day1icon;
  String day2icon;
  String day3icon;
  String day4icon;
  String day5icon;

  Future<String> getData(String userCity) async {
    Response response = await Dio().get("http://api.openweathermap.org/data/2.5/weather?q=${userCity},tr&APPID=${ApiKey.apiKey}&units=metric");
    var weather = response.data;
    cityName = weather["name"].toString();
    weatherTemp = weather["main"]["temp"].toString();
    weatherMax = weather["main"]["temp_max"].toString();
    weatherMin = weather["main"]["temp_min"].toString();
    windSpeed = weather["wind"]["speed"].toString();
    pressure = weather["main"]["pressure"].toString();
    humidity = weather["main"]["humidity"].toString();
    var list =weather["weather"];
    weatherCondition =list[0]["main"].toString();
    print(
        "$cityName de Hava Sıcaklığı: $weatherTemp Max : $weatherMax Min: $weatherMin $windSpeed $pressure $humidity");
  }

  Future<String> _getOtherDays() async {
    DateConvertToString myDate = new DateConvertToString();

    Response response = await Dio().get(
        "http://api.openweathermap.org/data/2.5/forecast?q=Balikesir,tr&APPID=ca3135c07ccd74c35e27ad817b5714ca&units=metric");
    var weather = response.data;
    var list = weather["list"];

    day1 = list[0]["main"]["temp"].toString();
    day2 = list[8]["main"]["temp"].toString();
    day3 = list[16]["main"]["temp"].toString();
    day4 = list[24]["main"]["temp"].toString();
    day5 = list[32]["main"]["temp"].toString();

    var iconList1 = list[0]["weather"];
    day1icon = iconList1[0]["main"].toString();

    var iconList2 = list[8]["weather"];
    day2icon = iconList2[0]["main"].toString();

    var iconList3 = list[16]["weather"];
    day3icon = iconList3[0]["main"].toString();

    var iconList4 = list[24]["weather"];
    day4icon = iconList4[0]["main"].toString();

    var iconList5 = list[32]["weather"];
    day5icon = iconList5[0]["main"].toString();

    return "Tamam";
  }

  String userName;
  String userSurname;
  String userCity;

  Future<String> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString("UserName");
      userSurname = prefs.getString("UserSurname");
      userCity = prefs.getString("UserCity");
    });
    return "de";
  }

  @override
  void initState() {
    super.initState();
    _getUserData().then((value) {
      if (userName == null || userName == "null" || userSurname == null) {
        print("Null Degerler Var");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BuildSettings()));
      } else {
        getData(userCity).then((value) {
          _getOtherDays().then((value) {
            var otherDays = {
              "day1": day1,
              "day2": day2,
              "day3": day3,
              "day4": day4,
              "day5": day5,
              "day1icon": day1icon,
              "day2icon": day2icon,
              "day3icon": day3icon,
              "day4icon": day4icon,
              "day5icon": day5icon,
            };
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                        cityName: cityName,
                        weatherTemp: weatherTemp,
                        weatherMax: weatherMax,
                        weatherMin: weatherMin,
                        windSpeed: windSpeed,
                        pressure: pressure,
                        humidity: humidity,
                        weatherCondition: weatherCondition,
                        otherDays: otherDays,
                      )),
            );
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Semsiye",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: FlareActor(
                "assets/animations/space.flr",
                animation: "loading",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Semsiye",
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Bir Garip Hava Durumu Uygulaması",
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitDualRing(
              color: Colors.black,
              size: 50.0,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Hemen Açıyorum...",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
