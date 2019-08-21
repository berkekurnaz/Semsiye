import 'dart:math';

class Comments {
  int number;

  String name = "";
  String surname = "";
  String city = "";

  Comments({this.name, this.surname, this.city}) {
    name = name;
    surname = surname;
    city = city;
    var random = new Random();
    number = random.nextInt(6);
  }

  String comment(
      int temperature, String weather, double windSpeed, double huminity) {
    if (weather == "Clear") {
      return commentForClearDays(temperature, weather, windSpeed, huminity);
    } else if (weather == "Clouds") {
      return commentForCloudsDays(temperature, weather, windSpeed, huminity);
    } else if (weather == "Rain") {
      return commentForRainDays(temperature, weather, windSpeed, huminity);
    } else if (weather == "Snow") {
      return commentForSnowDays(temperature, weather, windSpeed, huminity);
    }
  }

  String commentForClearDays(
      int temperature, String weather, double windSpeed, double huminity) {
    if (number == 0) {
      return "Bugün $city Şehrinde $temperature Derecesinde Güzel Güneşli Bir Gün Seni Bekliyor $name";
    } else if (number == 1) {
      return "Hadi Yine Bugün İyisin. $city Şehrinde Hava Tamı Tamına $temperature Derece. Birde Hava Güneşli";
    } else if (number == 2) {
      return "$city Şehrinde Harika Bir Gün. Keşke Bende Orada Olsaydım da $temperature Derece Güneşli Günün Tadını Çıkarsaydım $name";
    } else if (number == 3) {
      return "$name Bugün $city Baştan Sona Dolaşma Zamanı. Hava Son Derece Güzel. Sadece Kendini Dışarı At Ve Havanın Tadını Çıkar.";
    } else if (number == 4) {
      return "Güneşli $temperature Derece Bir Gün Mü? Harika, Harika, Harika. Kendini Yollara, Parklara, Bahçelere Atmalısın $name";
    } else if (number == 5) {
      return "Çabuk Bu Uygulamayı Kapat Ve Evin Dışarısına Çık. Hava Tek Kelime İle Muhteşem.";
    }
  }

  String commentForCloudsDays(
      int temperature, String weather, double windSpeed, double huminity) {
    if (number == 0) {
      return "$name Hava Bugün Bulutlu Olabilir. Ve Bu Bulutlar Birazdan Yağmura Dönüşebilir. Bunu Unutmasan İyi Edersin.";
    } else if (number == 1) {
      return "Bugün $city İlinde Hava Bulutlu Ve Rüzgar Hızı $windSpeed. Birazcık Dikkatli Olmakta Fayda Var.";
    } else if (number == 2) {
      return "Bulutlu Günleri Sevemiyorum. $name Dostum Bugün Seni Öyle Bulutlu Bir Gün Bekliyor. Evinde Kalıp Arkadaşların İle Bir Parti Yapabilirsin.";
    } else if (number == 3) {
      return "$city Bugün Bulutlu Bir Günün Etkisi Altında Olacak. Bu sözü Televizyonlardaki Kravat Takan Spikerler Gibi Söylediğime İnanamıyorum.";
    } else if (number == 4) {
      return "$name Bulutlu Bir Güne Kendini Hazırlasan İyi Edersin Gibi..";
    } else if (number == 5) {
      return "Bulutlar Bulutlar.. Sıkı Dur Geliyorlar, Belki de Ben Bu Cümleyi Kurana Kadar Çoktan Gelmişlerdir.";
    }
  }

  String commentForRainDays(
      int temperature, String weather, double windSpeed, double huminity) {
    if (number == 0) {
      return "$name Bugün $city İçin Yağmurlu Bir Gün. Bugün Fazlasıyla Islanmamaya Çalış Olur Mu?";
    } else if (number == 1) {
      return "Yağmur Yağıyor, Seller Akıyor, $name Cama Çıkmış Tüm Olanları İzliyor...";
    } else if (number == 2) {
      return "O ne Yağmurlu Bir Gün Mü. Hemen Eline Bir Kitap Al, Kahveni Yap Ve Pencere Kenarına Çıkıp İnstagrama Story At.";
    } else if (number == 3) {
      return "Yağmurlu Günleri Gerçekten Çok Fazla Seviyorum. $name Bu Yağmurlu Günün Tadını Çıkarmalısın Dostum.";
    } else if (number == 4) {
      return "Yağmurlu Serin Bir $city Günü. Gerçekten Bugün Uzun Zamandır Aradığın Huzuru Bulacak Gibisin.";
    } else if (number == 5) {
      return "Serin Muhteşem Bir $city Günü. $name Bugün Fazla Islanmadan Keyfini Çıkarmaya Bak. Ayrıca Rüzgar Hızı $windSpeed Ve Nem $huminity";
    }
  }

  String commentForSnowDays(
      int temperature, String weather, double windSpeed, double huminity) {
    if (number == 0) {
      return "$name Dostum Dışarıda Kar Yağıyor. Kesinlikle Bunu İzlemelisin. Ayrıca Rüzgar Hızı İse $windSpeed";
    } else if (number == 1) {
      return "Şimdi Kardam Adam Yapma Zamanı. $name Kendini Evin Dışına At Ve Capslere Konu Olacak O Başyapıtını Hemen İnşa Et.";
    } else if (number == 2) {
      return "Yağıyor, Yağıyor, Kar Yağıyor. Acaba Bugün Okullar Tatil Mi?";
    } else if (number == 3) {
      return "Bembeyaz Bir $city Günü. Adeta Huzurun, Mutluluğun Resmi. Bugünü Ölümsüzleştir Ve $city Şehrinde Fotoğraflar Çek. Banada Göndermeyi Unutma.";
    } else if (number == 4) {
      return "En Sevdiğim Zamanlar $city Şehrine Kar Yağdığı Zamanlar Dostum $name $surname";
    } else if (number == 5) {
      return "Kar Topu Savaşı Zamanı. Dışarıda Kar Yağıyor. Hemen Dışarıya Çık Ve İnsanlarla Bu Güzel Anın Zevkini Çıkar.. Hala Ne Diye Bekleyip Bu Yazıyı Okuyorsun..";
    }
  }
}
