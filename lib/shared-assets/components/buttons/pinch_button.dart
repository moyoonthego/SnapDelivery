import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

class PinchButton extends StatelessWidget {
  // This widget is the base classic button style
  PinchButton(
      {@required this.buttonText,
      this.onclick,
      this.color = Constants.YELLOW,
      this.width = 0,
      this.height,
      this.vertPaddingMod = 0});

  final String buttonText;
  final VoidCallback onclick;
  final Color color;
  double width;
  final double height;
  // Vertical padding modifier from the default amount (to make buttons thicker)
  final double vertPaddingMod;

  @override
  Widget build(BuildContext context) {
    if (width < 1) {
      double fullwidth = MediaQuery.of(context).size.width;
      width = fullwidth - (fullwidth * 3 / 20);
    }

    // padding differs by button width
    var padding = width > 80
        ? EdgeInsets.fromLTRB(
            30.0, 7.0 + this.vertPaddingMod, 30.0, 7.0 + this.vertPaddingMod)
        : EdgeInsets.fromLTRB(
            10.0, 7.0 + this.vertPaddingMod, 10.0, 7.0 + this.vertPaddingMod);

    return ButtonTheme(
        buttonColor: Constants.YELLOW,
        minWidth: width, // 85% screen ratio
        child: FlatButton(
            splashColor: color,
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)),
            child: Padding(
                padding: padding,
                child:
                    Text(this.buttonText, style: Constants.NORMAL_TEXT_WHITE)),
            onPressed: onclick));
  }
}
