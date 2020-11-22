import 'package:app/models/orderitem.dart';
import 'package:app/models/orderselections.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// This widget is for individual item blocks on an order page
class OrderItemTile extends StatelessWidget {
  const OrderItemTile({@required this.orderItemObj});

  final OrderItem orderItemObj;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      // defining order item box and shape
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      width: width - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Constants.LIGHTGRAY,
      ),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          // first print out amount of item for order item
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(orderItemObj.amount.toString() + "x  " + orderItemObj.name,
                style: Constants.NORMAL_TEXT_BLACK),
            Text("\$" + orderItemObj.price.toString())
          ]),
          // printing out each subselection category for this item (ie, toppings)
          for (MapEntry selection in orderItemObj.selections.entries)
            Align(
                alignment: Alignment.centerLeft,
                child: Column(children: [
                  Row(
                      // printing the category name
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selection.key,
                          textAlign: TextAlign.start,
                        )
                      ]),
                  // going through selected options for subselection category
                  for (OrderSelection val in selection.value)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //selection name
                        Text(
                          "    • " + val.name,
                          textAlign: TextAlign.start,
                        ),
                        // selection price, if applicable
                        if (val.price != 0)
                          Text(
                            "\$" + val.price.toString(),
                            textAlign: TextAlign.start,
                          )
                      ],
                    )
                ])),
        ],
      ),
    );
  }
}
