import 'dart:io';
import 'package:app/models/menuitems.dart';
import 'package:app/models/store.dart';
import 'package:app/shared-assets/components/buttons/Snap_button_back.dart';
import 'package:app/shared-assets/components/displays/banner.dart';
import 'package:app/shared-assets/components/displays/item_tile.dart';
import 'package:app/shared-assets/components/displays/profile.dart';
import 'package:app/shared-assets/components/displays/styled_map_view.dart';
import 'package:app/views/store/ItemPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:app/styles/constants.dart' as Constants;
import 'package:app/views/store/widgets/storepageheaders.dart'
    as StorePageHeaders;

var _fillerMenuItems = [
  MenuItem(
      id: "1",
      name: "Egg McMuffin",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-egg-mcmuffin.jpg?\$Category_Desktop\$",
      price: 2.99,
      categories: ["Breakfast"]),
  MenuItem(
      id: "2",
      name: "Sausage 'N Egg McMuffin",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-sausage-n-egg-mcmuffin.jpg?\$Category_Desktop\$",
      price: 3.99,
      categories: ["Breakfast"]),
  MenuItem(
      id: "2",
      name: "Breakfast Burrito",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-breakfast-burrito.jpg?\$Category_Desktop\$",
      price: 5.99,
      categories: ["Breakfast"]),
  MenuItem(
      id: "2",
      name: "Hotcakes w/ Butter",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-hotcakes-syrup-butter.jpg?\$Category_Desktop\$",
      price: 4.59,
      categories: ["Breakfast"]),
  MenuItem(
      id: "2",
      name: "Apple Slices",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-apple-slices.jpg?\$Category_Desktop\$",
      price: 1.59,
      categories: ["Snacks"]),
  MenuItem(
      id: "2",
      name: "Poutine",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-poutine.jpg?\$Category_Desktop\$",
      price: 6.49,
      categories: ["Snacks"]),
  MenuItem(
      id: "2",
      name: "World Famous Fries",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-fries-medium.jpg?\$Category_Desktop\$",
      price: 0.99,
      categories: ["Snacks"]),
  MenuItem(
      id: "2",
      name: "Cranberry Muffin",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-cranberry-orange-muffin.jpg?\$Category_Desktop\$",
      price: 1.99,
      categories: ["Snacks"]),
  MenuItem(
      id: "2",
      name: "Happy Meal",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-crispy-chicken-snackwrap-happy-meal.jpg?\$Category_Desktop\$",
      price: 4.99,
      categories: ["Meals"]),
  MenuItem(
      id: "2",
      name: "McDouble Meal",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-mcdouble.jpg?\$Category_Desktop\$",
      price: 7.99,
      categories: ["Meals"]),
  MenuItem(
      id: "2",
      name: "Junior Chicken Sandwich",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-junior-chicken.jpg?\$Category_Desktop\$",
      price: 5.99,
      categories: ["Meals"]),
  MenuItem(
      id: "2",
      name: "Crispy Chicken Wrap",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-chicken-bacon-signature-mcwrap-crispy.jpg?\$Category_Desktop\$",
      price: 3.49,
      categories: ["Meals"]),
  MenuItem(
      id: "2",
      name: "Strawberry Milkshake",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-strawberry-milkshake.jpg?\$Category_Desktop\$",
      price: 2.49,
      categories: ["Beverages"]),
  MenuItem(
      id: "2",
      name: "McCafe Dark Roast",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-coffee.jpg?\$Category_Desktop\$",
      price: 0.99,
      categories: ["Beverages"]),
  MenuItem(
      id: "2",
      name: "Sprite",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-sprite.jpg?\$Category_Desktop\$",
      price: 0.99,
      categories: ["Beverages"]),
  MenuItem(
      id: "2",
      name: "Coca-Cola",
      image:
          "https://www.mcdonalds.com/is/image/content/dam/ca/nfl/web/nutrition/products/tile/en/mcdonalds-fries-medium.jpg?\$Category_Desktop\$",
      price: 0.99,
      categories: ["Beverages"]),
];

List foundcategories = [];

var _fillerStoreLocation = LatLng(43.443279, -79.736893);

var _fillerStore = Store(
    id: "1",
    customColor: Constants.RED,
    userInfoId: "1",
    name: "ChaTime",
    address: '251 Plimington Ave, Toronto, ON',
    banner:
        "https://dynamicmedia.zuza.com/zz/m/original_/d/1/d13dfd6f-1141-498f-9eee-5a2c7d5295d2/Chatime___Super_Portrait.jpg",
    deliveryMethods: [0],
    deliveryFee: 5,
    profilePic: "https://images.safe.com/logos/customers/mcdonalds.png",
    bio: "");

// This page is the profile on customer end for all stores
class StorePage extends StatelessWidget {
  StorePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // generating list of categories from all menu items.
    for (var menuitem in _fillerMenuItems) {
      for (var cat in menuitem.categories) {
        if (!foundcategories.contains(cat)) {
          foundcategories.add(cat);
        }
      }
    }

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        // scroll view store profile
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
          Stack(clipBehavior: Clip.none, children: [
            // store banner
            BannerPhoto(imagesrc: NetworkImage(_fillerStore.banner)),
            // store profile
            Positioned(
                left: 20,
                top: MediaQuery.of(context).size.width - 80,
                child: ProfilePicture(
                    imagesrc: NetworkImage(_fillerStore.profilePic))),
            // return button
            Positioned(
                left: 10,
                top: 60,
                child: SnapBackButton(
                  onclick: () {
                    Navigator.of(context).pop();
                  },
                  circleColor: _fillerStore.customColor,
                )),
          ]),
          // map for store
          Container(
              margin: EdgeInsets.fromLTRB(120, 7, 0, 0),
              child: StyledMapView(
                borderAmt: 5,
                location: _fillerStoreLocation,
                width: (width * 3) / 5,
                height: (width * 2) / 11,
              )),
          // store name - rating (one line)
          StorePageHeaders.buildStoreName(),
          // store address & phone address (one line)
          StorePageHeaders.buildStoreAddress(),
          // delivery info (one line)
          StorePageHeaders.buildStoreDelivery(),
          for (var category in foundcategories)
            Column(children: [
              Container(
                child: Text(
                  category.toString().toUpperCase(),
                  style: Constants.NORMAL_TEXT_GRAY,
                ),
                margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
                alignment: Alignment.centerLeft,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (MenuItem menuitem in _fillerMenuItems)
                        if (menuitem.categories.contains(category))
                          GestureDetector(
                              onTap: () {
                                // ALEX GREFF GOES HERE
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemPage()));
                              },
                              child: ItemTile(
                                width: 90,
                                height: 100,
                                imagesrc: NetworkImage(menuitem.image),
                                label: menuitem.name,
                                price: menuitem.price,
                              )),
                    ],
                  ))
            ]),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
          )
        ])));
  }
}
