import 'package:app/models/orderitem.dart';
import 'package:app/models/orderselections.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// This widget is for the price breakdown on order and cart pages
class SubtotalTile extends StatelessWidget {
  const SubtotalTile(
      {@required this.allOrderItems,
      this.deliveryFee = 0,
      this.taxesPercentage = 0.13});

  final List<OrderItem> allOrderItems;
  final double deliveryFee;
  final double taxesPercentage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    int num_items = 0;
    double subtotal = 0;

    // triple nested for loops are yucky- but this should be tiny so its ok i guess
    for (OrderItem item in allOrderItems) {
      // enumerate item prices
      subtotal += item.price * item.amount;
      num_items += item.amount;
      for (MapEntry selection in item.selections.entries) {
        // for each entry, also find the price of any addons or subselections
        for (OrderSelection addon in selection.value) {
          subtotal += addon.price * item.amount;
        }
      }
    }

    // calculate total, total with tax, delivery fee etc
    double taxtotal = (subtotal * taxesPercentage);
    double total = taxtotal + subtotal + deliveryFee;
    return Container(
        margin: EdgeInsets.fromLTRB(30, 5, 30, 25),
        child: Column(
          children: [
            // first, print out item subtotal
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Subtotal (" + num_items.toString() + " items):",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "\$" + subtotal.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w500,
                ),
              )
            ]),
            Divider(
              color: Constants.DARKGRAY,
              height: 20,
              thickness: 0.5,
            ),
            // next, print out delivery fee
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Delivery Fee (Trackless):",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "\$" + deliveryFee.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
            Divider(
              color: Constants.DARKGRAY,
              height: 20,
              thickness: 0.5,
            ),
            // next print out tax
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Tax:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "\$" + taxtotal.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
            Divider(
              color: Constants.DARKGRAY,
              height: 20,
              thickness: 1.5,
            ),
            //next print out total final cost
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Total:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "\$" + total.toStringAsFixed(2),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ],
        ));
  }
}
