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
import 'package:app/views/orders/messages.dart';

Widget buildSendMessage(context) {
  return Stack(children: [
    Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: PinchButton(
          buttonText: "Send Message",
          width: MediaQuery.of(context).size.width - 40,
          color: Constants.BLUE,
          onclick: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MessagePage()))
          },
        )),
    Positioned(
        right: 20,
        top: 2,
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffff7979),
          ),
        )),
    Positioned(
        right: 35,
        top: 5,
        child: Icon(
          Icons.navigate_next,
          color: Colors.white,
          size: 40,
        ))
  ]);
}
