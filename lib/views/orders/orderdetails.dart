import 'dart:io';
import 'package:app/models/orderselections.dart';
import 'package:app/models/orderitem.dart';
import 'package:app/models/orders.dart';
import 'package:app/models/store.dart';
import 'package:app/shared-assets/components/buttons/pinch_button.dart';
import 'package:app/shared-assets/components/buttons/pinch_button_back.dart';
import 'package:app/shared-assets/components/displays/order_item.dart';
import 'package:app/shared-assets/components/displays/styled_map_view.dart';
import 'package:app/shared-assets/components/displays/subtotal.dart';
import 'package:app/shared-assets/components/inputs/styled_text_field.dart';
import 'package:app/views/orders/messages.dart';
import 'package:app/views/orders/trackorder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:app/styles/constants.dart' as Constants;
import 'package:app/views/orders/widgets/currentorderoptions.dart';

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

var _fillerOrder = Order(
    orderItems: _fillerVals,
    storePhoto:
        NetworkImage("https://images.safe.com/logos/customers/mcdonalds.png"),
    storeName: 'McDonalds',
    orderId: 'EKFKS21',
    storeId: '3',
    isPickup: false,
    status: 'Completed',
    orderInstructions: 'Leave at my door please.',
    startTime: 'Oct 5th 2020, 4:15pm');

var _fillerStore = Store(
    id: "1",
    customColor: Constants.RED,
    userInfoId: "1",
    name: "ChaTime",
    address: '251 Plimington Ave, Toronto, ON',
    banner:
        "https://dynamicmedia.zuza.com/zz/m/original_/d/1/d13dfd6f-1141-498f-9eee-5a2c7d5295d2/Chatime___Super_Portrait.jpg",
    deliveryMethods: [0],
    deliveryFee: 5,
    profilePic: "https://images.safe.com/logos/customers/mcdonalds.png",
    bio: "");

var _fillerAddress = "385 Morrish Rd, Toronto, ON";
var _fillerExpectedDate = "Oct 2, 6:32pm";

class OrderDetailsPage extends StatelessWidget {
  OrderDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // order item page header
        Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: PinchBackButton(
                        onclick: () => {Navigator.pop(context)})),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 20, 20),
                    child: Text(
                      "ORDER #${_fillerOrder.orderId}",
                      style: Constants.NORMAL_TEXT_BLACK,
                    )),
              ],
            )),
        // store name
        Container(
          child: Text(
            _fillerStore.name,
            style: Constants.LARGE_TEXT_BLACK,
          ),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
        ),
        if (_fillerOrder.status != 'Current') buildCurrentOrderOptions(context),
        // delivery address header
        Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: [
                Text("DELIVERING TO - "),
                Text(
                  _fillerAddress,
                  style: TextStyle(color: Constants.YELLOW),
                )
              ],
            )),
        // map view
        StyledMapView(location: LatLng(43.443279, -79.736893)),
        // expected time header
        Container(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Expected: $_fillerExpectedDate",
                  style: Constants.NORMAL_TEXT_BLACK,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text("Trackless Delivery"))
              ],
            )),
        // order details header
        Container(
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
              ],
            )),
        // all order details
        for (OrderItem item in _fillerVals) OrderItemTile(orderItemObj: item),
        // FILLED old delivery notes
        StyledTextField(
            value: _fillerOrder.orderInstructions,
            editable: false,
            hint: "Add Notes for the Store...",
            icon: Icon(Icons.edit)),
        Divider(
          color: Constants.DARKGRAY,
          indent: 20,
          height: 40,
          endIndent: 20,
          thickness: 2.3,
        ),
        // delivery subtotal
        SubtotalTile(
          allOrderItems: _fillerOrder.orderItems,
          taxesPercentage: 0.13,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
        )
      ],
    )));
  }
}
