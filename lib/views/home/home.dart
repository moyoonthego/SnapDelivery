import 'package:app/models/store.dart';
import 'package:app/shared-assets/components/displays/store_tile.dart';
import 'package:app/views/home/widgets/homestatic.dart';
import 'package:app/views/store/storepage.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

var _fillerVals = [
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
var _fillerAddress = "385 Morrish Rd, Toronto, ON";

// TODO: we need to add actual search functionality
Future<List<Store>> search(String search) async {
  await Future.delayed(Duration(milliseconds: 600));
  // search bar narrows by bio containing keyword or store name
  List<Store> found = _fillerVals
      .where((element) =>
          element.bio.toLowerCase().contains(search.toLowerCase()) ||
          element.name.toLowerCase().contains(search))
      .toList();
  if (found == null) {
    return null;
  }
  return found;
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  // This widget is the home page of your application.

  Widget _buildSearchStoreTile(BuildContext context, Store store) {
    return GestureDetector(
        onTap: () {
          // TODO: needs to open the right store page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StorePage()));
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: StoreTile(
              imagesrc: NetworkImage(store.banner, scale: 1),
              storename: store.name,
              address: store.address,
              rating: store.rating,
              deliveryprice: store.deliveryFee,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SearchBar<Store>(
                minimumChars: 1,
                onSearch: search,
                onItemFound: (Store store, int index) {
                  // layout each store item, with gesture controls
                  return _buildSearchStoreTile(context, store);
                },
                // styling search bar
                textStyle: (TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w800,
                )),
                hintText: "Search for food, items or stores...",
                hintStyle: (TextStyle(
                  color: Constants.DARKGRAY,
                  fontSize: 14,
                  fontFamily: "Euclid Circular B",
                  fontWeight: FontWeight.w800,
                )),
                // display message when search is empty
                emptyWidget: Align(
                  alignment: Alignment.center,
                  child: Text("No Results Found! Try a different search..."),
                ),
                iconActiveColor: Constants.YELLOW,
                // header for store address
                header: Container(
                    padding: EdgeInsets.fromLTRB(10.0, 1.0, 0.0, 7.0),
                    child: Text("Delivering to - $_fillerAddress")),
                searchBarStyle: SearchBarStyle(
                  backgroundColor: Constants.LIGHTGRAY,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                crossAxisSpacing: 5,
                // standard body of page (no search)
                placeHolder: homePageStatic(context))));
  }
}
