import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

// This widget is for store banner photos or item banners
class BannerPhoto extends StatelessWidget {
  const BannerPhoto({@required this.imagesrc});

  final ImageProvider imagesrc;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      Container(
          width: width,
          height: width - 60,
          decoration: BoxDecoration(
            image: DecorationImage(image: imagesrc, fit: BoxFit.cover),
            color: Constants.LIGHTGRAY,
          )),
      Container(
        width: width,
        height: width - 60,
        decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.center,
                colors: [Color(0x66000000), Color(0x11f6f6f6)],
                stops: [0.0, 1.0])),
      )
    ]);
  }
}
