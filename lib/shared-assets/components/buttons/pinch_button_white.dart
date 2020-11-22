import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// This widget is the White on yellow version of the base classic button style
class SnapButtonWhite extends StatelessWidget {
  const SnapButtonWhite({@required this.buttonText, this.onclick});

  final String buttonText;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        width: width - (width * 3 / 20), // 85% screen ratio
        child: OutlineButton(
            borderSide: BorderSide(
              color: Color(0xfffec06a),
              width: 3,
            ),
            highlightedBorderColor: Constants.YELLOW,
            splashColor: Constants.PEACH,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
                padding: EdgeInsets.fromLTRB(30.0, 14.5, 30.0, 10.0),
                child:
                    Text(this.buttonText, style: Constants.NORMAL_TEXT_YELLOW)),
            onPressed: onclick));
  }
}
