import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// This is a rendition of the classic button that is initially disabled,
// and can be programmatically enabled (see comment below)
class PinchButtonDisabled extends StatefulWidget {
  PinchButtonDisabled({@required this.buttonText, this.onclick});

  final String buttonText;
  final VoidCallback onclick;

  static _PinchButtonState of(BuildContext context) =>
      context.findAncestorStateOfType();

  @override
  _PinchButtonState createState() =>
      new _PinchButtonState(buttonText: buttonText, onclick: onclick);
}

class _PinchButtonState extends State<PinchButtonDisabled> {
  _PinchButtonState({@required this.buttonText, this.onclick});

  final String buttonText;
  final VoidCallback onclick;

  bool disabled = true;

  // IMPORTANT: This button can be enabled with the method below by invoking:
  // ".of(context).enableButton();" on your instance of PinchButtonDisabled
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
        child: FlatButton(
            splashColor: disabled ? Color(0xfffedfb3) : Color(0xfffedfb3),
            color: disabled ? Color(0xfffedfb3) : Constants.YELLOW,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                child:
                    Text(this.buttonText, style: Constants.NORMAL_TEXT_WHITE)),
            onPressed: () {
              if (!disabled) {
                onclick;
              }
            }));
  }
}
