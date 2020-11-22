import 'dart:io';
import 'package:app/models/orderitem.dart';
import 'package:app/models/orderselections.dart';
import 'package:app/models/orders.dart';
import 'package:app/views/orders/widgets/orderpreviewtile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;
import 'package:flutter/src/painting/image_provider.dart';

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
      orderId: '1',
      storeId: '3',
      isPickup: false,
      status: 'Ongoing',
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
      status: 'Completed',
      orderInstructions: 'Leave at my door please.',
      startTime: 'Oct 3rd 2020, 4:35pm'),
  Order(
      orderItems: fillervals,
      storePhoto: NetworkImage(
          "https://www.subway.com/-/media/_SubwayV2/AboutUs/PressReleases/pressroom_choicemark_450x450.jpg"),
      storeName: 'Subway',
      orderId: '3',
      storeId: '3',
      isPickup: true,
      status: 'Cancelled',
      orderInstructions: 'Leave at my door please.',
      startTime: 'Sept 29th 2020, 1:10pm'),
];

class MyOrdersPage extends StatelessWidget {
  MyOrdersPage({Key key}) : super(key: key);

  // This widget is the orders page of your application.

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(20, 30, 0, 10),
            // first, order page header
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "My Orders",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 28,
                    fontFamily: "Euclid Circular B",
                    fontWeight: FontWeight.w600,
                  ),
                ))),
        // show active orders header
        Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "ACTIVE ORDERS",
                  style: Constants.NORMAL_TEXT_GRAY,
                ))),
        // show all active orders
        for (Order order in myorders)
          if (order.status == 'Ongoing') OrderPreviewTile(orderObj: order),
        // show past orders header
        Container(
            margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "ORDER HISTORY",
                  style: Constants.NORMAL_TEXT_GRAY,
                ))),
        // show all past orders
        for (Order order in myorders)
          if (order.status != 'Ongoing') OrderPreviewTile(orderObj: order),
      ],
    ));
  }
}
