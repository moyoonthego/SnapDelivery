import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

// This widget is for store or user profile photos
class ProfilePicture extends StatelessWidget {
  const ProfilePicture(
      {@required this.imagesrc, this.onclick, this.diameter = 100});

  final ImageProvider imagesrc;
  final VoidCallback onclick;
  final double diameter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onclick,
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            image: DecorationImage(image: imagesrc, fit: BoxFit.cover),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Constants.DARKGRAY,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
            color: Constants.LIGHTGRAY,
          ),
        ));
  }
}
