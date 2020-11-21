import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

class StyledTextField extends StatelessWidget {
  // This widget is a stylized version of a text input field
  // It can also convert into a textbox when the height is declared large!

  StyledTextField(
      {@required this.hint, @required this.icon, this.height = 40.0});

  final String hint;
  final Icon icon;
  final double height;

  bool box = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (this.height > 50) {
      box = true;
    }

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Constants.LIGHTGRAY),
        width: width - (width * 3 / 20),
        height: this.height,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: TextFormField(
          maxLines: box ? null : 1,
          style: (TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontFamily: "Euclid Circular B",
            fontWeight: FontWeight.w800,
          )),
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: (TextStyle(
                color: Constants.DARKGRAY,
                fontSize: 14,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w800,
              )),
              contentPadding: EdgeInsets.fromLTRB(0.0, 5.0, 30.0, 10.0),
              icon: icon),
        ));
  }
}
