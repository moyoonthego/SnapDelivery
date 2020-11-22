import 'package:app/models/orders.dart';
import 'package:app/shared-assets/components/buttons/Snap_button.dart';
import 'package:app/views/orders/orderdetails.dart';
import 'package:app/views/orders/trackorder.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// TBH IM NOT SURE HOW TO BREAK THIS DOWN FURTHER
// There's so many miniscle parts and details to this, it seems useless
// to try and move them all out

// This widget is for individual item blocks on an order page
class OrderPreviewTile extends StatelessWidget {
  const OrderPreviewTile({@required this.orderObj});

  final Order orderObj;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // color for type of order (current, complete, etc)
    var tempcolor = Colors.black;
    if (orderObj.status == 'Ongoing') {
      tempcolor = Constants.GREEN;
    } else if (orderObj.status == 'Cancelled') {
      tempcolor = Constants.RED;
    }

    // updating the recieval pop up message based on order type
    String recievalmessage;
    orderObj.isPickup
        ? recievalmessage = "Est. Pickup At ${orderObj.startTime}"
        : recievalmessage = "Est. Arrival: ${orderObj.startTime}";
    orderObj.status != 'Ongoing'
        ? recievalmessage = "Order Ended Oct. 4th, ${orderObj.startTime}"
        : null;

    // individual order preview box (for my orders page)
    return Container(
      width: width - 40,
      height: 185,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Constants.LIGHTGRAY,
      ),
      // items inside box
      child: Stack(
        children: [
          // store profile photo
          Positioned(
            left: 14,
            top: 11,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: orderObj.storePhoto,
                  )),
              padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
              child: Container(
                width: 20,
                height: 16,
              ),
            ),
          ),
          // store name
          Positioned(
            left: 68,
            top: 11,
            child: Text(
              orderObj.storeName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // amount of items (preview)
          Positioned(
            left: 68,
            top: 37,
            child: Text(
              "${orderObj.getAmount()} item(s)  • ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // total cost of order
          Positioned(
            left: 142,
            top: 37,
            child: Text(
              "\$15.05", // pass order total here
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // status of order (Current, Complete, Cancelled, etc)
          Positioned(
            right: 35,
            top: 37,
            child: Text(
              orderObj.status,
              style: TextStyle(
                color: tempcolor,
                fontSize: 14,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // recieval message
          Positioned(
            left: 14,
            top: 63,
            child: Text(
              recievalmessage,
              style: TextStyle(
                color: Color(0xff474747),
                fontSize: 14,
              ),
            ),
          ),
          // Datetime order was made
          Positioned(
            left: 14,
            top: 91,
            child: Text(
              "Placed: ${orderObj.startTime}",
              style: TextStyle(
                color: Color(0xff474747),
                fontSize: 14,
              ),
            ),
          ),
          // Order ID (Snap internal)
          Positioned(
            left: 216,
            top: 93,
            child: Text(
              "Order #${orderObj.orderId}",
              style: TextStyle(
                color: Color(0xff474747),
                fontSize: 11,
                fontFamily: "Euclid Circular B",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Order buttons (details, track) - where applicable
          Positioned(
              top: 124,
              child: Row(children: [
                // if ongoing, show track order option
                orderObj.status == 'Ongoing'
                    ? Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: SnapButton(
                          buttonText: "Track Order",
                          onclick: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrackOrderPage()))
                          },
                          width: 60,
                          color: Constants.GREEN,
                        ),
                      )
                    : Container(),
                // details button
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: SnapButton(
                    buttonText: "View Details",
                    onclick: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetailsPage()))
                    },
                    // if this order is not ongoing make view details full size
                    width: orderObj.status == 'Ongoing'
                        ? 60
                        : width - (width * 3 / 16),
                    color: Constants.YELLOW,
                  ),
                )
              ])),
        ],
      ),
    );
  }
}
