import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// This component toggles between pickup and delivery
class DeliveryToggle extends StatefulWidget {
  DeliveryToggle();

  static _DeliveryState of(BuildContext context) =>
      context.findAncestorStateOfType();

  @override
  _DeliveryState createState() => new _DeliveryState();
}

class _DeliveryState extends State<DeliveryToggle> {
  _DeliveryState();

  // IMPORTANT: These values can be enabled/found with the  below by invoking:
  // ".of(context).selections" on your instance
  List<bool> selections = [false, true];

  String getDeliveryMethod() {
    if (selections[1]) {
      return "Pickup";
    }
    return "Delivery";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Constants.LIGHTGRAY, borderRadius: BorderRadius.circular(10)),
      child: ToggleButtons(
        isSelected: selections,
        splashColor: Constants.YELLOW,
        color: Constants.DARKGRAY,
        renderBorder: false,
        fillColor: Constants.YELLOW,
        borderRadius: BorderRadius.circular(10),
        selectedColor: Colors.white,
        children: [
          // the delivery button toggle
          Row(children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                child: Icon(Icons.drive_eta)),
            Text(
              "    Delivery      ",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w600,
              ),
            )
          ]),
          // the pickup button toggle
          Row(children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                child: Icon(Icons.shopping_basket_sharp)),
            Text(
              "     Pickup       ",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w600,
              ),
            )
          ]),
        ],
        // flipping state on click
        onPressed: (int index) {
          setState(() {
            selections[index] = true;
            if (selections[1 - index] == true) {
              selections[1 - index] = !selections[1 - index];
            }
          });
        },
      ),
    );
  }
}
