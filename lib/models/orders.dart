import 'package:flutter/material.dart';
import 'package:app/models/orderitem.dart';
import 'package:app/styles/constants.dart' as Constants;

// this is for our UI interpetation of a whole order
class Order {
  final ImageProvider storePhoto;
  final List<OrderItem> orderItems;
  final String storeName;
  final String orderId;
  final String storeId;
  // double orderTotal; // LOLOL how do we wanna do this?
  final bool isPickup;
  final String orderInstructions;
  final String
      status; // derived from isCompleted, (need Cancelled, Completed, Ongoing)
  final String startTime;
  // final String expectedTime; // LOLOL how do we wanna do this?

  Order(
      {this.storePhoto,
      this.orderItems,
      this.storeName,
      this.orderId,
      this.storeId,
      this.isPickup,
      this.status,
      this.orderInstructions,
      this.startTime});

  int getAmount() {
    int num = 0;
    for (OrderItem item in this.orderItems) {
      num += item.amount;
    }
    return num;
  }
}
