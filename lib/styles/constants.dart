library constants;

import 'package:flutter/material.dart';

// Pinch colors and accents
const YELLOW = const Color(0xfffec06a);
const DARKGRAY = const Color(0xffc1c1c1);
const LIGHTGRAY = const Color(0xffededed);
const RED = const Color(0xfffe6a6a);
const GREEN = const Color(0xff79d662);
const BLUE = const Color(0xff18a0fb);
const PEACH = const Color(0xffffe9cb);

// material yellow color (swatches and shades)
const MATERIAL_YELLOW = const MaterialColor(0xfffec06a, {
  50: Color.fromRGBO(255, 226, 186, 1),
  100: Color.fromRGBO(255, 222, 176, 1),
  200: Color.fromRGBO(255, 212, 153, 1),
  300: Color.fromRGBO(252, 203, 136, 1),
  400: Color.fromRGBO(250, 197, 125, 1),
  500: Color.fromRGBO(255, 198, 120, 1),
  600: Color.fromRGBO(254, 192, 106, 1),
  700: Color.fromRGBO(247, 179, 84, 1),
  800: Color.fromRGBO(255, 182, 79, 1),
  900: Color.fromRGBO(255, 176, 64, 1),
});

const MATERIAL_BLUE = const MaterialColor(0xff18a0fb, {
  50: Color(0xff18a0fb),
  100: Color(0xff18a0fb),
  200: Color(0xff18a0fb),
  300: Color(0xff18a0fb),
  400: Color(0xff18a0fb),
  500: Color(0xff18a0fb),
  600: Color(0xff18a0fb),
  700: Color(0xff18a0fb),
  800: Color(0xff18a0fb),
  900: Color(0xff18a0fb),
});

/* a set of quickly accessible text stylings for uniformity purposes.
 Had to make different versions per color since colors are final and cannot
 be "set". If we are comfortable without colors or are capable of making these
 ourselves, let me know.
 */
const TINY_TEXT_BLACK = const TextStyle(
  color: Colors.black,
  fontSize: 10,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w600,
);

const TINY_TEXT_YELLOW = const TextStyle(
  color: YELLOW,
  fontSize: 10,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w600,
);

const TINY_TEXT_GRAY = const TextStyle(
  color: DARKGRAY,
  fontSize: 10,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w600,
);

const NORMAL_TEXT_BLACK = const TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w500,
);

const NORMAL_TEXT_YELLOW = const TextStyle(
  color: YELLOW,
  fontSize: 16,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w500,
);

const NORMAL_TEXT_GRAY = const TextStyle(
  color: DARKGRAY,
  fontSize: 16,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w500,
);

const NORMAL_TEXT_WHITE = const TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w500,
);

const LARGE_TEXT_BLACK = const TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w600,
);

const LARGE_TEXT_YELLOW = const TextStyle(
  color: YELLOW,
  fontSize: 24,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w600,
);

const LARGE_TEXT_GRAY = const TextStyle(
  color: DARKGRAY,
  fontSize: 24,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w600,
);

const GIANT_TEXT_BLACK = const TextStyle(
  color: Colors.black,
  fontSize: 48,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w400,
);

const GIANT_TEXT_YELLOW = const TextStyle(
  color: YELLOW,
  fontSize: 48,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w400,
);

const GIANT_TEXT_GRAY = const TextStyle(
  color: DARKGRAY,
  fontSize: 48,
  fontFamily: "Euclid Circular B",
  fontWeight: FontWeight.w400,
);

const DELETE_ICON = Icon(Icons.delete, color: Colors.white);

// Business Specific stuf
// TODO: this needs to be removed and put in witht he PROPER business-specific
// theming system
const MCDICKS_PRIMARY = RED;
