import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

// This widget is for uniformly styled search bars
// refer to flappy_search_bar documentation to better understand!
// This is just a wrapped, styled version of it (can be edited below) WIPPPPP
class StyledSearchBar<Object> extends StatefulWidget {
  StyledSearchBar(
      {this.hintText = "Search for food, items or stores...",
      @required this.searchbarController,
      this.noResultsWidget,
      this.suggestions,
      this.buildSuggestion,
      this.onSearch,
      this.onItemsFound,
      this.onError,
      this.onCancelled});

  String hintText;
  Text noResultsWidget;
  SearchBarController searchbarController;
  List<dynamic> suggestions;
  Widget Function(dynamic, int) buildSuggestion;
  Future<List<dynamic>> Function(String) onSearch;
  Widget Function(dynamic, int) onItemsFound;
  void Function() onCancelled;
  Widget Function(Error) onError;

  static _SearchState of(BuildContext context) =>
      context.findAncestorStateOfType();

  @override
  _SearchState createState() => _SearchState<Object>(
      hintText: hintText,
      noResultsWidget: noResultsWidget,
      suggestions: suggestions,
      buildSuggestion: buildSuggestion,
      onSearch: onSearch,
      onItemsFound: onItemsFound,
      onError: onError,
      onCancelled: onCancelled,
      searchbarController: searchbarController);
}

class _SearchState<Object> extends State<StyledSearchBar> {
  _SearchState(
      {this.hintText = "Search for food, items or stores...",
      @required this.searchbarController,
      this.noResultsWidget,
      this.suggestions,
      this.buildSuggestion,
      this.onSearch,
      this.onItemsFound,
      this.onError,
      this.onCancelled});

  String hintText;
  Text noResultsWidget;
  SearchBarController searchbarController;
  List<dynamic> suggestions;
  Widget Function(dynamic, int) buildSuggestion;
  Future<List<dynamic>> Function(String) onSearch;
  Widget Function(dynamic, int) onItemsFound;
  void Function() onCancelled;
  Widget Function(Error) onError;

  Icon icon = const Icon(Icons.search);

  Future<List<dynamic>> Function(String) internalOnSearch() {
    setState(() {
      this.icon = const Icon(Icons.arrow_back_ios);
    });
    return onSearch;
  }

  void Function() internalOnCancelled() {
    setState(() {
      this.icon = const Icon(Icons.search);
    });
    return onCancelled;
  }

  @override
  Widget build(BuildContext context) {
    if (noResultsWidget == null) {
      noResultsWidget = Text(
        "No results were found! Try another search...",
        style: Constants.NORMAL_TEXT_BLACK,
      );
    }

    double width = MediaQuery.of(context).size.width - 10;
    return SearchBar<Object>(
        searchBarController: searchbarController,
        onSearch: internalOnSearch(),
        onItemFound: onItemsFound,
        onCancelled: internalOnCancelled(),
        onError: onError,
        textStyle: (TextStyle(
          color: Colors.black54,
          fontSize: 14,
          fontFamily: "Euclid Circular B",
          fontWeight: FontWeight.w800,
        )),
        hintText: hintText,
        hintStyle: (TextStyle(
          color: Constants.DARKGRAY,
          fontSize: 14,
          fontFamily: "Euclid Circular B",
          fontWeight: FontWeight.w800,
        )),
        emptyWidget: Align(
          alignment: Alignment.center,
          child: noResultsWidget,
        ),
        icon: icon,
        header: Container(padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0)),
        iconActiveColor: Constants.YELLOW,
        suggestions: suggestions != null ? suggestions : [],
        buildSuggestion: buildSuggestion,
        searchBarStyle: SearchBarStyle(
          backgroundColor: Constants.LIGHTGRAY,
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        crossAxisSpacing: 5);
  }
}
