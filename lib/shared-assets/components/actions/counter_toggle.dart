import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

const MIN_COUNT = 1;
const MAX_COUNT = 20;

// This component increases or decrease the amount of an item for an order
class CounterToggle extends StatefulWidget {
  CounterToggle(
      {this.width = 212, this.height = 50, this.color = Constants.YELLOW});

  final double width;
  final double height;
  final Color color;

  static _CounterState of(BuildContext context) =>
      context.findAncestorStateOfType();

  @override
  _CounterState createState() =>
      new _CounterState(width: width, height: height, color: color);
}

class _CounterState extends State<CounterToggle> {
  _CounterState({this.width, this.height, this.color = Constants.YELLOW});

  final double width;
  final double height;
  final Color color;

  // as always this can be extracted through .of(context).count
  int count = 1;

  // when a click occurs, this changes the amount of the widget
  handleClick(int amount) {
    int nextCount = count + amount;
    if (nextCount >= MIN_COUNT && nextCount <= MAX_COUNT) {
      setState(() {
        count = nextCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Constants.LIGHTGRAY,
      ),
      child: Stack(
        children: [
          // "-"" Button
          Positioned(
            top: 10,
            left: 40,
            child: GestureDetector(
                onTap: () => handleClick(-1),
                child: Icon(
                  Icons.remove_sharp,
                  color: color,
                  size: 32,
                )),
          ),
          // Counter text
          Align(
            alignment: Alignment.center,
            child: Text(
              "$count",
              style: Constants.NORMAL_TEXT_BLACK,
            ),
          ),
          // "+" text
          Positioned(
              top: 10,
              right: 40,
              child: GestureDetector(
                onTap: () => handleClick(1),
                child: Icon(
                  Icons.add,
                  color: color,
                  size: 32,
                ),
              ))
        ],
      ),
    );
  }
}
