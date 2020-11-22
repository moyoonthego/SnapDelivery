import 'dart:io';
import 'package:app/models/orderselections.dart';
import 'package:app/models/orderitem.dart';
import 'package:app/models/orders.dart';
import 'package:app/shared-assets/components/buttons/pinch_button.dart';
import 'package:app/shared-assets/components/buttons/pinch_button_back.dart';
import 'package:app/shared-assets/components/displays/progress_bar.dart';
import 'package:app/shared-assets/components/displays/styled_map_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:app/styles/constants.dart' as Constants;
import 'package:app/views/orders/widgets/sendmessage.dart' as SendMessage;

var fillervals = [
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

var myorders = [
  Order(
      orderItems: fillervals,
      storePhoto:
          NetworkImage("https://images.safe.com/logos/customers/mcdonalds.png"),
      storeName: 'McDonalds',
      orderId: 'EKFKS21',
      storeId: '3',
      isPickup: false,
      status: 'Completed',
      orderInstructions: 'Leave at my door please.',
      startTime: 'Oct 5th 2020, 4:15pm'),
  Order(
      orderItems: fillervals,
      storePhoto: NetworkImage(
          "https://awards.brandingforum.org/wp-content/uploads/2015/01/Chatime-Logo.jpg"),
      storeName: 'ChaTime',
      orderId: '2',
      storeId: '3',
      isPickup: false,
      status: 'Ongoing',
      orderInstructions: 'Leave at my door please.',
      startTime: 'Oct 7th 2020, 4:15pm'),
  Order(
      orderItems: fillervals,
      storePhoto:
          NetworkImage("https://images.safe.com/logos/customers/mcdonalds.png"),
      storeName: 'McDonalds',
      orderId: '3',
      storeId: '3',
      isPickup: true,
      status: 'Cancelled',
      orderInstructions: 'Leave at my door please.',
      startTime: 'Oct 11th 2020, 4:15pm'),
];

class TrackOrderPage extends StatelessWidget {
  TrackOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // track order page header
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
                      "ORDER #${myorders[0].orderId}",
                      style: Constants.NORMAL_TEXT_BLACK,
                    )),
              ],
            )),
        // Arrival time (expected)
        Row(children: [
          Container(
              margin: EdgeInsets.fromLTRB(15, 10, 10, 15),
              child: Text("6:32pm", style: Constants.GIANT_TEXT_BLACK)),
          Text(
            "Estimated Arrival",
            style: Constants.NORMAL_TEXT_GRAY,
          )
        ]),
        // Order status
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 10, 15),
            child: Text(
              "Order currently being prepared in-store",
              style: TextStyle(
                color: Color(0xff474747),
                fontSize: 16,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w500,
              ),
            )),
        ProgressBar(
          value: 0.4, // out of 1
        ),
        // delivery address
        Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Row(
              children: [
                Text("DELIVERING TO - "),
                Text(
                  "385 Morrish Rd, Toronto, ON",
                  style: TextStyle(color: Constants.YELLOW),
                )
              ],
            )),
        // Map view
        Center(
          child: StyledMapView(
              location: LatLng(43.443279, -80.736893), height: 250),
        ),
        // Send Message button
        SendMessage.buildSendMessage(context)
      ],
    )));
  }
}
