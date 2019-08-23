import 'package:flutter/material.dart';
import 'package:semsiye_app_project/ui/welcome.dart';

class InternetControl extends StatefulWidget {
  @override
  _InternetControlState createState() => _InternetControlState();
}

class _InternetControlState extends State<InternetControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İnternet Bağlantısı Hatası",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "İnternet Bağlantısı Yok",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 5,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Lütfen İnternet Bağlantısı Kontrol Edin"),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                "Tekrar Kontrol Et",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
