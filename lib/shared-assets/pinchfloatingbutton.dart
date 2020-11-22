import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

// This button is meant to float over the screen during scrolling
// NOTE: This button is a WIP!! It should inherit from Disabled button too!
class SnapFloatingButton extends StatelessWidget {
  const SnapFloatingButton(
      {@required this.buttonText, this.onclick, this.color = Constants.YELLOW});

  final String buttonText;
  final VoidCallback onclick;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(children: <Widget>[
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: width - (width * 3 / 22), // 85% screen ratio,
              child: FloatingActionButton(
                  elevation: 1,
                  splashColor: color,
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                      child: Text(this.buttonText,
                          style: Constants.NORMAL_TEXT_WHITE)),
                  onPressed: onclick)))
    ]);
  }
}
