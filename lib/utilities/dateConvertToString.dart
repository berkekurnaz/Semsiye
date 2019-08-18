
class DateConvertToString {

  String country;

  DateConvertToString({this.country});

  String getToday(){
    var dateInfo = DateTime.parse(new DateTime.now().toString());
    String today = dateInfo.day.toString();
    return today;
  }

  String getHour(){
    var dateInfo = DateTime.parse(new DateTime.now().toString());
    String hour = dateInfo.hour.toString();
    return hour;
  }

  String ConvertForTurkish(){
    var dateInfo = DateTime.parse(new DateTime.now().toString());
    String day = dateInfo.day.toString();
    String month = "";
    String year =dateInfo.year.toString();
    if(dateInfo.month == 1){
      month = "Ocak";
    }else if(dateInfo.month == 2){
      month = "Şubat";
    }else if(dateInfo.month == 3){
      month = "Mart";
    }else if(dateInfo.month == 4){
      month = "Nisan";
    }else if(dateInfo.month == 5){
      month = "Mayıs";
    }else if(dateInfo.month == 6){
      month = "Haziran";
    }else if(dateInfo.month == 7){
      month = "Temmuz";
    }else if(dateInfo.month == 8){
      month = "Ağustos";
    }else if(dateInfo.month == 9){
      month = "Eylül";
    }else if(dateInfo.month == 10){
      month = "Ekim";
    }else if(dateInfo.month == 11){
      month = "Kasım";
    }else if(dateInfo.month == 12){
      month = "Aralık";
    }

    return "$day $month $year";
  }


}
