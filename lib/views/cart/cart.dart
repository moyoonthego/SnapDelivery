import 'dart:io';
import 'package:app/models/orderselections.dart';
import 'package:app/models/orderitem.dart';
import 'package:app/shared-assets/components/actions/delivery_toggle.dart';
import 'package:app/shared-assets/components/actions/slideout_delete.dart';
import 'package:app/shared-assets/components/buttons/Snap_button.dart';
import 'package:app/shared-assets/components/displays/order_item.dart';
import 'package:app/shared-assets/components/displays/styled_map_view.dart';
import 'package:app/shared-assets/components/displays/subtotal.dart';
import 'package:app/shared-assets/components/inputs/styled_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/views/cart/widgets/clearcart.dart';
import 'package:app/styles/constants.dart' as Constants;

var _fillerVals = [
  OrderItem("1", "1", 2, "Chicken McNuggets", "not needed", 3.59, {
    'Drink': [OrderSelection(name: 'Chocolate Shake', price: 5.45)],
    'Sauces': [
      OrderSelection(name: 'Ketchup'),
      OrderSelection(name: 'Mustard'),
      OrderSelection(name: 'Szechuan R&M Style', price: 2.99)
    ]
  }),
  OrderItem("2", "2", 1, "Chicken Sandwich", "not needed", 14.99, {
    'Toppings': [
      OrderSelection(name: 'Ketchup'),
      OrderSelection(name: 'Relish'),
      OrderSelection(name: 'Onions', price: 0.5),
      OrderSelection(name: 'Pickles')
    ]
  }),
];

var _fillerAddress = "385 Morrish Rd, Toronto, ON";
var _fillerStoreName = "McDonald's";
var _fillerDeliveryRange = "10-20min";

class MyCartPage extends StatelessWidget {
  MyCartPage({Key key}) : super(key: key);

  // this method is to print out orders header titles and clear cart button
  Widget _buildHeaderItems(context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "YOUR ORDER",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w700,
              ),
            ),
            GestureDetector(
                onTap: () {
                  onClearCart(context);
                },
                child: Text(
                  "CLEAR CART",
                  style: TextStyle(
                    color: Constants.RED,
                    fontSize: 16,
                    fontFamily: "Euclid Circular B",
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // the entire my cart page, scroll view
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // title
        Align(
            alignment: Alignment.topCenter,
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: Text(
                  "MY CART",
                  style: Constants.NORMAL_TEXT_BLACK,
                ))),
        // store name
        Container(
          child: Text(
            _fillerStoreName,
            style: Constants.LARGE_TEXT_BLACK,
          ),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        ),
        // deliver or pickup
        DeliveryToggle(),
        // delivery address
        Container(
            padding: EdgeInsets.fromLTRB(20, 15, 0, 10),
            child: Row(
              children: [
                Text("DELIVER TO - "),
                Text(
                  _fillerAddress,
                  style: TextStyle(color: Constants.YELLOW),
                )
              ],
            )),
        // map view
        StyledMapView(location: null),
        // delivery info
        Container(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Time: $_fillerDeliveryRange",
                  style: Constants.NORMAL_TEXT_BLACK,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text("Trackless Delivery"))
              ],
            )),
        // header for order items
        _buildHeaderItems(context),
        // order items
        for (OrderItem item in _fillerVals)
          SlideOutDelete(
              deleteActivity: () => {},
              undoActivity: () => {},
              listWidgets: [OrderItemTile(orderItemObj: item)]),
        // text notes
        StyledTextField(
            hint: "Add Notes for the Store...", icon: Icon(Icons.edit)),
        Divider(
          color: Constants.DARKGRAY,
          indent: 20,
          height: 40,
          endIndent: 20,
          thickness: 2.3,
        ),
        // pricing information
        SubtotalTile(
          allOrderItems: _fillerVals,
          taxesPercentage: 0.13,
        ),
        // submit cart to order
        Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
            child: SnapButton(
              buttonText: 'Place Order',
              onclick: () => {},
            ))
      ],
    ));
  }
}
