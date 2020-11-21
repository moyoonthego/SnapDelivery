import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

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
          Positioned(
            top: 10,
            left: 40,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (count > 1) {
                      count -= 1;
                    }
                  });
                },
                child: Icon(
                  Icons.remove_sharp,
                  color: color,
                  size: 32,
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "${count}",
              style: Constants.NORMAL_TEXT_BLACK,
            ),
          ),
          Positioned(
              top: 10,
              right: 40,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (count < 20) {
                      count += 1;
                    }
                  });
                },
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
