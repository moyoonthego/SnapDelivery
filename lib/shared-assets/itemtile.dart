import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

// This widget is for our store item tiles
// NOTE: this can also be used for categories (Sushi, Pizza, etc) with no price
class ItemTile extends StatelessWidget {
  ItemTile(
      {@required this.imagesrc,
      this.width = 155,
      this.height = 138,
      @required this.label,
      this.price = null,
      this.onclick});

  ImageProvider imagesrc; // ex AssetImage, NetworkImage
  final double width;
  final double height;
  String label;
  final VoidCallback onclick;
  final double price;

  @override
  Widget build(BuildContext context) {
    Widget pricepart = Container();
    if (price != null) {
      pricepart = Positioned.fill(
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "\$" + price.toString(),
            style: TextStyle(
              color: Color(0xff474747),
              fontSize: 12,
              fontFamily: "Euclid Circular B",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    if (label.length > 18) {
      label = label.substring(0, 15) + "...";
    }

    return GestureDetector(
        onTap: onclick,
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: price == null
                      ? Alignment.bottomCenter
                      : Alignment.bottomLeft,
                  child: Text(
                    this.label,
                    style: TextStyle(
                      color: Color(0xff474747),
                      fontSize: 12,
                      fontFamily: "Euclid Circular B",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              pricepart,
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: width,
                    height: height - 20,
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
            ],
          ),
        ));
  }
}
