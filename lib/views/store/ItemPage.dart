import 'package:app/shared-assets/components/actions/counter_toggle.dart';
import 'package:app/shared-assets/components/buttons/Snap_button.dart';
import 'package:app/shared-assets/components/displays/banner.dart';
import 'package:app/shared-assets/components/actions/option_dropdowns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;

var _fillerItems = [
  OptionDropdownData(title: "Happy Meal Drink", items: [
    OptionDropdownItemData(title: "Sprite"),
    OptionDropdownItemData(title: "Coke"),
    OptionDropdownItemData(title: "Pepsi"),
  ]),
  OptionDropdownData(
      title: "Remove from Hamburger",
      subtitle: "Pick up to 6",
      items: [
        OptionDropdownItemData(title: "Remove Onions"),
        OptionDropdownItemData(title: "Remove Mustard"),
        OptionDropdownItemData(title: "Remove Meat Patty", costModifier: -1.0),
        OptionDropdownItemData(title: "Remove Meat Ketchup"),
      ]),
  OptionDropdownData(title: "Add to Hamburger", items: [
    OptionDropdownItemData(title: "Extra Onions", costModifier: 0.5),
    OptionDropdownItemData(title: "Extra Tomatoes", costModifier: 0.5),
    OptionDropdownItemData(title: "Extra Meat Patty", costModifier: 1),
  ])
];

const _fillerItemCount = 1;

const _fillerBannerURL =
    "https://i2.cdn.turner.com/money/dam/assets/160923092857-mcdonalds-breakfast-happy-meal-340xa.jpg";

final _fillerTitle = "Happy Meal";
final _fillerDesc =
    "When you are looking to feed the kids, look no further than the legendary happy meal";

const SIDE_MARGIN = 10.0;

class ItemPage extends StatelessWidget {
  ItemPage({Key key}) : super(key: key);

  Widget _buildOptions() {
    return OptionDropdowns(options: _fillerItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BannerPhoto(imagesrc: NetworkImage(_fillerBannerURL)),
            Container(
              margin: EdgeInsets.fromLTRB(SIDE_MARGIN, 0, SIDE_MARGIN, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  // Title
                  Text(
                    _fillerTitle,
                    style: TextStyle(
                        color: Constants.MCDICKS_PRIMARY,
                        fontSize: 24,
                        fontFamily: "Euclid Circular B",
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  // Description
                  Text(
                    _fillerDesc,
                    style: TextStyle(
                        color: Constants.LARGE_TEXT_BLACK.color,
                        fontSize: 14,
                        fontFamily: "Euclid Circular B",
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 15),
                  // Options
                  _buildOptions(),
                  SizedBox(height: 15),
                  Center(
                    child: CounterToggle(
                      color: Constants.MCDICKS_PRIMARY,
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                      // TODO: need to figure out how to put the +$$$ thing at the end
                      child: SnapButton(
                    color: Constants.MCDICKS_PRIMARY,
                    vertPaddingMod: 10,
                    buttonText: 'Add to Cart',
                    onclick: () => {},
                  )),
                  SizedBox(height: 15),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
