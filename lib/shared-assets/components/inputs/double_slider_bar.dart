import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// This widget is for store or user profile photos
class DoubleSlideBar extends StatefulWidget {
  DoubleSlideBar({@required this.start, @required this.end});

  double start;
  double end;

  static _DoubleSlideState of(BuildContext context) =>
      context.findAncestorStateOfType();

  @override
  _DoubleSlideState createState() =>
      new _DoubleSlideState(start: start, end: end);
}

class _DoubleSlideState extends State<DoubleSlideBar> {
  _DoubleSlideState({@required this.start, @required this.end});

  double start;
  double end;
  var selectedRange = RangeValues(0, 200);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        width: width - (width * 3 / 20),
        child: RangeSlider(
            divisions: 50,
            activeColor: Constants.YELLOW,
            inactiveColor: Color(0xffffe9cb),
            values: selectedRange,
            onChanged: (RangeValues newrange) {
              setState(() => selectedRange = newrange);
            },
            min: 0,
            max: 200,
            labels: RangeLabels('\$${selectedRange.start.round()}',
                '\$${selectedRange.end.round()}')));
  }
}
