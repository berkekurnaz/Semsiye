import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:semsiye_app_project/ui/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BuildSettings extends StatefulWidget {
  @override
  _BuildSettingsState createState() => _BuildSettingsState();
}

class _BuildSettingsState extends State<BuildSettings> {
  List<Slide> slides = new List();

  final txtName = TextEditingController();
  final txtSurname = TextEditingController();
  String txtCity = 'Adana';

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

  void _addSlides() {
    slides.add(
      new Slide(
        title: "Yapılandırma Ekranı",
        description:
            "Uygulama İçerisinde Hangi Şehrin Hava Durumunu Almak İstediğin, Adının Soyadının Ne Olduğu Gibi Bilgileri Bu Aşamada Senden Almak İstiyorum.",
        pathImage: "assets/images/photo_pencil.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "Adınız Soyadınız",
        centerWidget: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: "Adınızı Giriniz..",
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: txtSurname,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: "Soyadınızı Giriniz..",
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(46, 204, 113, 1.0),
      ),
    );
  
    slides.add(
      new Slide(
        title: "Şehriniz",
        centerWidget: Column(
          children: <Widget>[
            SizedBox(
              height: 110,
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 3.0, color: Colors.white)),
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
                )),
          ],
        ),
        backgroundColor: Color.fromRGBO(46, 204, 113, 1.0),
      ),
    );

    slides.add(
      new Slide(
        title: "Hepsi Bu Kadar",
        description:
            "Artık Bütün Bilgiler Hazır. Uygulamayı Senin İçin Hemen Yapılandırıyorum. Tamam Butonuna Bastıktan Sonra Birazcık Bekleyebilirsin..",
        pathImage: "assets/images/photo_pencil.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _addSlides();
  }

  void onDonePress() {
    if (txtName.text.length < 1 && txtSurname.text.length < 1) {
      _showMaterialDialog();
    } else {
      _showLoadDialog();
      _addUserData(txtName.text, txtSurname.text, txtCity).then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Welcome()));
      });
    }
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Oopppsss !'),
            content: Text(
                'Adını ve Soyadını Boş Bırakmamalısın. Lütfen Geri Dön ve Adını Soyadını Yaz..'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tamam'),
              )
            ],
          );
        });
  }

  void _showLoadDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Yapılandırıyorum !'),
            content: SpinKitDualRing(
              color: Colors.white,
              size: 50.0,
            ),
          );
        });
  }

  Future<String> _addUserData(String name, String surname, String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("UserName", name);
    await prefs.setString("UserSurname", surname);
    await prefs.setString("UserCity", city);
    return "Kulllanıcı Bilgi Alma İşlemleri Tamamlandı.";
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      nameNextBtn: "İleri",
      namePrevBtn: "Geri",
      nameDoneBtn: "Tamamla",
      isShowPrevBtn: true,
      isShowSkipBtn: false,
      onDonePress: this.onDonePress,
    );
  }
}
