import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

class SnapButtonIcon extends StatelessWidget {
  // This widget is the base classic button style - with a required icon
  const SnapButtonIcon(
      {@required this.buttonText, @required this.icon, this.onclick});

  final String buttonText;
  final Icon icon;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ButtonTheme(
        buttonColor: Constants.YELLOW,
        minWidth: width - (width * 3 / 20), // 85% screen ratio
        child: FlatButton.icon(
            splashColor: Color(0xfffedfb3),
            icon: icon,
            color: Constants.YELLOW,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            label: Text(this.buttonText, style: Constants.NORMAL_TEXT_WHITE),
            onPressed: onclick));
  }
}
