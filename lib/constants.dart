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
