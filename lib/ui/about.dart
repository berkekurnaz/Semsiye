import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
        child: ListView(
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
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "Bir Garip Hava Durumu Uygulaması",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Nedir \n---------------------\nSemsiye Açık Kaynak Kodlu Olarak Geliştirilen Bir Hava Durumu Uygulamasıdır. Semsiye İle Yaşadığınız Şehri Kaydederek Hava Durumunu Ve Hava Durumuna Ait Yorumları Okuyabilirsiniz.\nSemsiye Diğer Hava Durumu Uygulamalarından Farklı Olarak O Güne Ait Eğlenceli Bir Yorum Gösterir.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Nasıl Kullanılır \n---------------------\n1- İsminizi Ve Soyadınızı Girin.\n2- Yaşadığınız Şehri Kaydedin.\n3- Hava Durumunu Ve Diğer İstatistikleri İnceleyin.\n4- Hava Durumuna Ait Eğlenceli Yorumu Okuyun.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Geliştirici \n---------------------\nBerke Kurnaz",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Destekleyin \n---------------------\nSemsiye'yi Açık Kaynak Kodlu Olarak Geliştirdik. Sizde bu projeye bir el atarak daha güzel ve daha iyi hale gelmesine destekçi olabilirsiniz. Destekçilerimizi Burayada Eklemeyi Tabii Ki De Unutmayız.\n\nGithub: www.github.com/berkekurnaz/Semsiye",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "İletişim \n---------------------\nwww.berkekurnaz.com\nkurnaz.berke1907@gmail.com",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
