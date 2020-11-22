import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

class ProgressBar extends StatelessWidget {
  const ProgressBar({@required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        width: width - (width * 3 / 24),
        height: 12,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: Color(0xffffe9cb),
              valueColor: new AlwaysStoppedAnimation<Color>(Constants.YELLOW),
            )));
  }
}
