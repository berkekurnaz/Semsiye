import 'package:flutter/material.dart';

class DateConvertToTurkish {

  DateTime date = DateTime.now();

  String dayToday;
  String day1;
  String day2;
  String day3;
  String day4;
  String day5;

  DateConvertToTurkish(){
    var _day1 =  DateTime(date.year, date.month, date.day + 1);
    var _day2 =  DateTime(date.year, date.month, date.day + 2);
    var _day3 =  DateTime(date.year, date.month, date.day + 3);
    var _day4 =  DateTime(date.year, date.month, date.day + 4);
    var _day5 =  DateTime(date.year, date.month, date.day + 5);

    dayToday = getDayName(date.weekday);
    
    day1 = getDayName(_day1.weekday);
    day2 = getDayName(_day2.weekday);
    day3 = getDayName(_day3.weekday);
    day4 = getDayName(_day4.weekday);
    day5 = getDayName(_day5.weekday);
  }

  String getDayName(int dateWeek){
    if(dateWeek == 1){
      return "Pazartesi";
    }else if(dateWeek == 2){
      return "Salı";
    }else if(dateWeek == 3){
      return "Çarşamba";
    }else if(dateWeek == 4){
      return "Perşembe";
    }else if(dateWeek == 5){
      return "Cuma";
    }else if(dateWeek == 6){
      return "Cumartesi";
    }else if(dateWeek == 7){
      return "Pazar";
    }
  }

}