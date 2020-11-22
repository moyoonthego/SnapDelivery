import 'dart:io';
import 'package:app/models/orderselections.dart';
import 'package:app/models/orderitem.dart';
import 'package:app/models/orders.dart';
import 'package:app/models/store.dart';
import 'package:app/shared-assets/components/buttons/Snap_button.dart';
import 'package:app/shared-assets/components/buttons/Snap_button_back.dart';
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

Widget buildCurrentOrderOptions(context) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Container(
        padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
        child: SnapButton(
          buttonText: "Track Order",
          width: 60,
          color: Constants.GREEN,
          onclick: () => {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TrackOrderPage()))
          },
        )),
    Stack(children: [
      Container(
          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
          child: SnapButton(
            buttonText: "Send Message",
            width: 60,
            color: Constants.BLUE,
            onclick: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MessagePage()))
            },
          )),
      Positioned(
          right: 23,
          top: 2,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffff7979),
            ),
          ))
    ])
  ]);
}
