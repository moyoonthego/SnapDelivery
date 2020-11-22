import 'package:app/models/store.dart';
import 'package:app/shared-assets/components/displays/item_tile.dart';
import 'package:app/shared-assets/components/displays/store_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/styles/constants.dart' as Constants;

var fillervals = [
  Store(
      id: "1",
      userInfoId: "1",
      name: "ChaTime",
      address: '251 Plimington Ave, Toronto, ON',
      banner:
          "https://dynamicmedia.zuza.com/zz/m/original_/d/1/d13dfd6f-1141-498f-9eee-5a2c7d5295d2/Chatime___Super_Portrait.jpg",
      deliveryMethods: [0],
      deliveryFee: 5,
      profilePic: "https://images.safe.com/logos/customers/mcdonalds.png",
      bio: ""),
  Store(
      id: "2",
      userInfoId: "2",
      name: "Subway",
      address: '762 Kipling St., Toronto, ON',
      banner:
          "https://images.squarespace-cdn.com/content/v1/529fc0c0e4b088b079c3fb6d/1572811400501-S18A4EDLCC6ZNJPL2AUN/ke17ZwdGBToddI8pDm48kKO1Zu0gRyL0iZ3EWhnKj8oUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKc2kNPpahUxG_SeZ3lCm9Erx0oSt5CbIck99e5lqgLgKnVTaG8o708mz2pvYLZ45w5/subway+hero.jpg",
      deliveryMethods: [0],
      deliveryFee: 6.99,
      profilePic: "https://images.safe.com/logos/customers/mcdonalds.png",
      bio: ""),
  Store(
      id: "3",
      userInfoId: "3",
      name: "McDonalds",
      deliveryFee: 3.99,
      address: '365 Nairn Ave., Toronto, ON',
      banner:
          "https://i.pinimg.com/originals/d5/56/fa/d556fae6c6ceea6b52ae95faf5ac43c0.jpg",
      deliveryMethods: [0],
      profilePic: "https://images.safe.com/logos/customers/mcdonalds.png",
      bio: "Enjoy delicious McDonalds on us! Mcloving it! Thrice!")
];

var fillercategories = [
  ItemTile(
      width: 90,
      height: 100,
      imagesrc: NetworkImage(
          'https://i.insider.com/5e4efe32f0201416265717e3?width=1800&format=jpeg'),
      label: 'Sushi'),
  ItemTile(
      width: 90,
      height: 100,
      imagesrc: NetworkImage(
          'https://www.budgetbytes.com/wp-content/uploads/2010/07/Classic-Homemade-Pizza-Dough-close-V3.jpg'),
      label: 'Pizza'),
  ItemTile(
      width: 90,
      height: 100,
      imagesrc: NetworkImage(
          'https://assets.wsimgs.com/wsimgs/rk/images/dp/recipe/202029/0005/img85l.jpg'),
      label: 'Burgers'),
  ItemTile(
      width: 90,
      height: 100,
      imagesrc: NetworkImage(
          'https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Tomato-Spinach-Pasta-V2-bowl.jpg'),
      label: 'Pasta'),
  ItemTile(
      width: 90,
      height: 100,
      imagesrc: NetworkImage(
          'https://www.welcometothetable.coop/sites/default/files/wp-content/uploads/2013/02/Traditional_Asian_Food_Flavorful_Healthful_0.jpg'),
      label: 'Asian'),
  ItemTile(
      width: 90,
      height: 100,
      imagesrc: NetworkImage(
          'https://www.blueosa.com/wp-content/uploads/2020/01/the-best-top-10-indian-dishes.jpg'),
      label: 'Indian'),
];

Widget homePageStatic() {
  return SingleChildScrollView(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // first, scroll row with all categeories to choose from
          Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: fillercategories))),
          // header title for stores
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "NEARBY RESTAURANTS",
                    style: Constants.NORMAL_TEXT_GRAY,
                  ))),
          // scroll column with selected nearby stores (pagination or MAX 5?)
          for (Store store in fillervals)
            Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: StoreTile(
                  imagesrc: NetworkImage(store.banner, scale: 1),
                  storename: store.name,
                  address: store.address,
                  rating: store.rating,
                  deliveryprice: store.deliveryFee,
                ))
        ]),
  );
}
