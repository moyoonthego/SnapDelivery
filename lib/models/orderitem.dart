import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/models/orderselections.dart';

class OrderItem {
  final String orderItemId;
  final String itemId;
  final int amount;
  final String name;
  final String desc;
  final double price;
  final Map<String, List<OrderSelection>>
      selections; // map of selection name (str) to List[addons/selections, string] goes here

  OrderItem(this.orderItemId, this.itemId, this.amount, this.name, this.desc,
      this.price, this.selections);
}
