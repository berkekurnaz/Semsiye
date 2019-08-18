import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:semsiye_app_project/ui/about.dart';
import 'package:semsiye_app_project/ui/settings.dart';
import 'package:semsiye_app_project/utilities/dateConvertToString.dart';

DateConvertToString date = new DateConvertToString(country: "tr");

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  
  String todayDate = date.ConvertForTurkish();
  String comment = "berke";
  MyAppBar({this.comment});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
            showDialog(
                        context: context,
                        builder: (_) => FlareGiffyDialog(
                              buttonCancelText: Text("Kapat",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              buttonOkText: Text("Tamam",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              flarePath: "assets/animations/space.flr",
                              flareAnimation: "loading",
                              title: Text(
                                'Hava Durumu Yorumu',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                              description: Text(
                                "$comment",
                                textAlign: TextAlign.center,
                              ),
                              onOkButtonPressed: () {
                                Navigator.pop(context);
                              },
                            ));
        },
        icon: Icon(Icons.info_outline),
        color: Colors.black,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "$todayDate",
        style: TextStyle(color: Colors.black),
      ),
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(Icons.menu, color: Colors.black),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About()));
                },
                child: Text("Hakkımızda"),
              )),
              PopupMenuItem(
                  child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
                child: Text("Ayarlar"),
              )),
            ];
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
