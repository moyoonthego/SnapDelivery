// this is for our UI representation of menu item previews (search, store page)
import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final String image;
  final String name;
  final double price;
  final List<String> categories;

  MenuItem(
      {@required this.id,
      @required this.name,
      @required this.image,
      @required this.price,
      this.categories = const []});
}
