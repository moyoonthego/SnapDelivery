import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

// This is a menu button - stylized from iconed buttons
class MenuButton extends StatelessWidget {
  const MenuButton({@required this.buttonText, this.onclick});

  final String buttonText;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: onclick,
        child: Stack(children: <Widget>[
          Container(
              width: width - (width * 3 / 20),
              child: FlatButton(
                  splashColor: Colors.white24,
                  color: Constants.LIGHTGRAY,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("    " + this.buttonText,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontFamily: "Euclid Circular B",
                            fontWeight: FontWeight.w500,
                          ))),
                  onPressed: onclick)),
          new Positioned(
            left: width - 100.0,
            top: 7,
            child: new Icon(
              Icons.navigate_next,
              color: Colors.black54,
              size: 35,
            ),
          )
        ]));
  }
}
