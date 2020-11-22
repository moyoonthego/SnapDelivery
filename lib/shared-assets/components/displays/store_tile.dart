import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// This widget is for our store tiles on searches etc
class StoreTile extends StatelessWidget {
  StoreTile(
      {@required this.imagesrc,
      @required this.storename,
      @required this.address,
      this.strdeliverytime,
      this.rating,
      this.width = 320,
      this.height = 186,
      this.deliveryprice,
      this.onclick});

  ImageProvider imagesrc; // ex AssetImage, NetworkImage
  String storename;
  String address;
  String strdeliverytime;
  double rating;
  final double width;
  final double height;
  double deliveryprice;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    // reduce address text size if too long
    if (address.length > 24) {
      address = address.substring(0, 22) + "...";
    }

    // reduce store name if too long
    if (storename.length > 30) {
      storename = storename.substring(0, 28) + "...";
    }

    String totaldescription = address;

    // add delivery time, if present
    if (strdeliverytime != null) {
      totaldescription += "	  •  " + strdeliverytime.toString();
    }

    // add delivery fee if present
    if (deliveryprice != null) {
      totaldescription += "	  •  \$" + deliveryprice.toString();
    }

    Widget ratingcomponent = Container();
    Widget ratingstar = Container();
    // define the rating component and rating star, if rating exists
    if (rating != null) {
      ratingcomponent = Positioned(
        left: width - 40,
        top: height - 40,
        child: Text(
          rating.toString(),
          style: TextStyle(
            color: Color(0xff474747),
            fontSize: 14,
            fontFamily: "Euclid Circular B",
            fontWeight: FontWeight.w500,
          ),
        ),
      );

      ratingstar = Positioned(
        left: width - 20,
        top: height - 44,
        child: Opacity(
          opacity: 0.50,
          child: Container(
              width: 12.52,
              height: 12,
              child: Icon(
                Icons.star,
                color: Color(0xfffec77d),
              )),
        ),
      );
    }

    return GestureDetector(
        onTap: onclick,
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              // name of the store
              Positioned(
                left: 1,
                top: height - 44,
                child: Text(
                  this.storename,
                  style: TextStyle(
                    color: Color(0xff474747),
                    fontSize: 18,
                    fontFamily: "Euclid Circular B",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //  all the concatenated information above (address, delivery time, etc)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    totaldescription,
                    style: TextStyle(
                      color: Color(0xff474747),
                      fontSize: 14,
                      fontFamily: "Euclid Circular B",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              // image of the store
              Positioned(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: width,
                    height: height - 50,
                    child: Stack(
                      children: [
                        Container(
                          width: width,
                          height: height - 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imagesrc, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xfff5f5f5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // rating data below
              ratingcomponent,
              ratingstar
            ],
          ),
        ));
  }
}
