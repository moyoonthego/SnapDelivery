import 'package:app/models/store.dart';
import 'package:app/shared-assets/components/displays/item_tile.dart';
import 'package:app/shared-assets/components/displays/store_tile.dart';
import 'package:app/views/home/widgets/homestatic.dart';
import 'package:app/views/store/storepage.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

Future<List<Store>> search(String search) async {
  await Future.delayed(Duration(milliseconds: 600));
  // search bar narrows by bio containing keyword or store name
  List<Store> found = fillervals
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
                    child: Text("Delivering to - 385 Morrish Rd, Toronto, ON")),
                searchBarStyle: SearchBarStyle(
                  backgroundColor: Constants.LIGHTGRAY,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                crossAxisSpacing: 5,
                // standard body of page (no search)
                placeHolder: homePageStatic())));
  }
}
