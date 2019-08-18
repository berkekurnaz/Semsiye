import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:semsiye_app_project/ui/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var txtName = TextEditingController();
  var txtSurname = TextEditingController();
  String txtCity = 'Adana';

  @override
  void initState() {
    super.initState();
    txtName.text = "berke";
    _getUserData().then((value){

    });
  }

  Future<String> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      txtName.text = prefs.getString("UserName");
      txtSurname.text = prefs.getString("UserSurname");
      txtCity = prefs.getString("UserCity");
    });
  }

  Future<String> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("UserName", txtName.text);
    await prefs.setString("UserSurname", txtSurname.text);
    await prefs.setString("UserCity", txtCity);
  }

  final List<String> _dropdownValues = [
    "Adana",
    "Adıyaman",
    "Afyon",
    "Ağrı",
    "Amasya",
    "Ankara",
    "Antalya",
    "Artvin",
    "Aydın",
    "Balıkesir",
    "Bilecik",
    "Bingöl",
    "Bitlis",
    "Bolu",
    "Burdur",
    "Bursa",
    "Çanakkale",
    "Çankırı",
    "Çorum",
    "Denizli",
    "Diyarbakır",
    "Edirne",
    "Elazığ",
    "Erzincan",
    "Erzurum",
    "Eskişehir",
    "Gaziantep",
    "Giresun",
    "Gümüşhane",
    "Hakkari",
    "Hatay",
    "Isparta",
    "İçel",
    "İstanbul",
    "İzmir",
    "Kars",
    "Kastamonu",
    "Kayseri",
    "Kırklareli",
    "Kırşehir",
    "Kocaeli",
    "Konya",
    "Kütahya",
    "Malatya",
    "Manisa",
    "Kahramanmaraş",
    "Mardin",
    "Muğla",
    "Muş",
    "Nevşehir",
    "Niğde",
    "Ordu",
    "Rize",
    "Sakarya",
    "Samsun",
    "Siirt",
    "Sinop",
    "Sivas",
    "Tekirdağ",
    "Tokat",
    "Trabzon",
    "Tunceli",
    "Şanlıurfa",
    "Uşak",
    "Van",
    "Yozgat",
    "Zonguldak",
    "Aksaray",
    "Bayburt",
    "Karaman",
    "Kırıkkale",
    "Batman",
    "Şırnak",
    "Bartın",
    "Ardahan",
    "Iğdır",
    "Yalova",
    "Karabük",
    "Kilis",
    "Osmaniye",
    "Düzce",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                "Ayarlar",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Buradan İsmini Ve Şehrini Değiştirebilirsin",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: txtName,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: txtSurname,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.0, color: Colors.black)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: DropdownButton(
                    items: _dropdownValues
                        .map((value) => DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            ))
                        .toList(),
                    onChanged: (String value) {
                      txtCity = value;
                      setState(() {
                        txtCity;
                      });
                    },
                    value: txtCity,
                    isExpanded: true,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                child: Text("Verileri Kaydet", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                onPressed: (){
                    _saveUserData().then((value){
                      Navigator.pop(context);
                    });
                },
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}
