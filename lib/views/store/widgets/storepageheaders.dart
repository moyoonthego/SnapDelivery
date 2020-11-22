import 'dart:io';
import 'package:app/models/menuitems.dart';
import 'package:app/models/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:app/styles/constants.dart' as Constants;

var store = Store(
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

Widget buildStoreName() {
  // single row containing store name and rating
  return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Row(children: [
        Text(
          store.name,
          style: TextStyle(
            color: Constants.RED,
            fontSize: 26,
            fontFamily: "Euclid Circular B",
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(margin: EdgeInsets.fromLTRB(10, 0, 0, 0), child: Text("4.6")),
        Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: 12.52,
            height: 12,
            child: Icon(
              Icons.star,
              color: Color(0xfffec77d),
            )),
      ]));
}

Widget buildStoreAddress() {
  // single row containing phone number, address, location info
  return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 5),
      child: Row(children: [
        Text(
          "1500 Upper Middle Rd W. Oakv...",
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Text(
            "(905) 476-5442",
            style: TextStyle(color: Constants.BLUE),
          ),
        ),
      ]));
}

Widget buildStoreDelivery() {
  // this widget is one row for all delivery info for store
  return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
      child: Row(children: [
        Text(
          "~${store.deliveryTime} min Delivery  •  ",
          style: Constants.TINY_TEXT_BLACK,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text("Offers Pickup & Trackless Delivery  •  ",
              style: Constants.TINY_TEXT_BLACK),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child:
              Text("\$${store.deliveryFee}", style: Constants.TINY_TEXT_BLACK),
        ),
      ]));
}
