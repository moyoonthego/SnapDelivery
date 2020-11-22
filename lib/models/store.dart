// this is for our UI representation of stores
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

class Store {
  final String id;
  final String userInfoId;
  final String name;
  final bool isOpen;
  final double rating;
  final int deliveryTime;
  final double deliveryFee;
  final String banner;
  final Color customColor;
  final List<int> deliveryMethods;
  final String bio;
  final String profilePic;
  final String address;

  Store(
      {@required this.id,
      @required this.userInfoId,
      @required this.name,
      this.isOpen = true,
      this.rating = 5,
      this.deliveryTime = 25,
      this.deliveryFee = 0,
      @required this.banner, //URL
      this.customColor = Constants.YELLOW,
      @required this.deliveryMethods, //Array enum to existing delivery methods
      @required this.address,
      @required this.profilePic, //URL
      @required this.bio});
}
