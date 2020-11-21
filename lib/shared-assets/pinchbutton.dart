import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

class PinchButton extends StatelessWidget {
  // This widget is the base classic button style
  const PinchButton(
      {@required this.buttonText, this.onclick, this.color = Constants.YELLOW});

  final String buttonText;
  final VoidCallback onclick;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ButtonTheme(
        buttonColor: Constants.YELLOW,
        minWidth: width - (width * 3 / 20), // 85% screen ratio
        child: FlatButton(
            splashColor: color,
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                child:
                    Text(this.buttonText, style: Constants.NORMAL_TEXT_WHITE)),
            onPressed: onclick));
  }
}
