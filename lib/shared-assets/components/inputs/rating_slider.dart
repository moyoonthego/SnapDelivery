import 'package:flutter/material.dart';
import 'package:app/styles/constants.dart' as Constants;
import 'package:reviews_slider/reviews_slider.dart';

// This widget has been wrapped up for uniformity, but otherwise uses an
// excellent review component, 'reviews_slider'
class RatingSlider extends StatelessWidget {
  RatingSlider();

  int rating = 5;

  int getRating() {
    return rating;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ReviewSlider(
        circleDiameter: width / 8,
        width: width - (width * 3 / 22),
        initialValue: 4,
        optionStyle: TextStyle(
          color: Colors.black54,
          fontSize: 12,
          fontFamily: "Euclid Circular B",
          fontWeight: FontWeight.w700,
        ),
        onChange: (int value) {
          // active value is an int number from 0 to 4, where:
          // 0 is the worst review value
          // and 4 is the best review value
          rating = value + 1;
        });
  }
}
