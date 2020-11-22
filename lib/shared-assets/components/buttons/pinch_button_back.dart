import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// This is the default back button -> define a circleColor to implement circle
class PinchBackButton extends StatelessWidget {
  const PinchBackButton({@required this.onclick, this.circleColor});

  final VoidCallback onclick;
  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: circleColor != null
            ? RawMaterialButton(
                splashColor: circleColor,
                onPressed: onclick,
                fillColor: circleColor,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(Icons.arrow_back_ios, color: Colors.white)),
                padding: EdgeInsets.fromLTRB(17, 10.0, 10, 10),
                shape: CircleBorder(),
              )
            : IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Constants.YELLOW,
                onPressed: onclick,
              ));
  }
}
