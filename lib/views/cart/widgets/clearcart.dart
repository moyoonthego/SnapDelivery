import 'dart:io';
import 'package:app/styles/constants.dart' as Constants;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// this is for a "clear cart" dialogue pop up
Future<void> onClearCart(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      // ios deletion pop up - native style!
      if (Platform.isIOS) {
        return CupertinoAlertDialog(
          title: Text('Clear Cart'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you would like to clear your cart?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: Constants.NORMAL_TEXT_BLACK),
              onPressed: () {
                // INSERT DELETION CODE HERE!!!
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes, Clear Cart',
                  style: TextStyle(color: Constants.RED)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      } else {
        // android/web deletion popup!
        return AlertDialog(
          title: Text('Clear Cart'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you would like to clear your cart?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: Constants.NORMAL_TEXT_BLACK),
              onPressed: () {
                // INSERT DELETION CODE HERE!!!
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes, Clear Cart',
                  style: TextStyle(color: Constants.RED)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    },
  );
}
