import 'package:app/shared-assets/components/buttons/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;
import 'editaccount.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key key}) : super(key: key);

  // This widget is the settings page of your application.

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
              buttonText: "Edit Account",
              onclick: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditAccountPage()))
              },
            ),
            MenuButton(
              buttonText: "Change Password",
              onclick: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditAccountPage()))
              },
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: MenuButton(
                  buttonText: "Log Out",
                  onclick: () => {},
                )),
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Text(
                "Delete Acount",
                style: TextStyle(
                  color: Constants.RED,
                  fontSize: 13,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage("lib/assets/images/SnapWhite.png"),
                ))
          ],
        ));
  }
}
