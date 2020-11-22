import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';

final currency = new NumberFormat("#,##0.00", "en_US");

// A simple wrapper over Text that nicely formats the cost text
class CurrencyText extends StatelessWidget {
  CurrencyText(this.cost, {this.showPlus = false});

  final num cost;
  // Show the plus "+" text when the cost is positive
  final bool showPlus;

  String formatCost(num _cost) {
    num cost = _cost.abs();
    num sign = _cost.sign;

    String signPrefix = "";
    if (sign > 0 && showPlus)
      signPrefix = "+";
    else if (sign < 0) signPrefix = "-";

    return "$signPrefix\$${currency.format(cost)}";
  }

  @override
  Widget build(BuildContext context) {
    return Text(formatCost(cost));
  }
}
