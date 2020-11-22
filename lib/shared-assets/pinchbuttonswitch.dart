import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

// this button can toggle on and off-  only difference between this and "Disabled"
// is color schemes and that USER can switch this on and off + icons
class SnapButtonSwitch extends StatefulWidget {
  SnapButtonSwitch(
      {@required this.buttonText, @required this.icon, this.onclick});

  final String buttonText;
  final VoidCallback onclick;
  final Icon icon;

  @override
  _SnapButtonState createState() => new _SnapButtonState(
      buttonText: buttonText, onclick: onclick, icon: icon);
}

class _SnapButtonState extends State<SnapButtonSwitch> {
  _SnapButtonState(
      {@required this.buttonText, @required this.icon, this.onclick});

  final String buttonText;
  final VoidCallback onclick;
  final Icon icon;

  bool disabled = true;

  void enableButton() {
    setState(() {
      disabled = !disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ButtonTheme(
        buttonColor: Constants.YELLOW,
        minWidth: width - (width * 3 / 20), // 85% screen ratio
        child: FlatButton.icon(
            splashColor: disabled ? Constants.YELLOW : Constants.LIGHTGRAY,
            icon: Icon(icon.icon,
                color: disabled ? Constants.DARKGRAY : Colors.white),
            color: disabled ? Constants.LIGHTGRAY : Constants.YELLOW,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            label: Text(this.buttonText,
                style: disabled
                    ? Constants.NORMAL_TEXT_GRAY
                    : Constants.NORMAL_TEXT_WHITE),
            onPressed: () {
              enableButton();
              onclick;
            }));
  }
}
