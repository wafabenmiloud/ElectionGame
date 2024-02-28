import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Spacings
const kBigSpace = 50.0;
const kHorizontalPadding = 30.0;

const kCardPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 5);
// Colors
const kBackgroundColor = Color(0XFF13264A);
const kStrokeColor = Color(0XFF23478A);
const kCardFill = Color(0XFF254272);
const kCardFill2 = Color(0XFF30538C);
const kBigCardFill = Color(0XFF23478A);
const kPrimaryColor = Color(0XFF46CAF4);
const kGreenColor = Color(0XFF19BE99);
const kRedColor = Color(0XFFF24261);
const kWhiteBlueishColor = Color(0XFFBFD6FF);
const kSecondaryColor = Color(0XFF0F2140);

// Text styles
const kP1 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: kGreenColor,
);

const kP2 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: kWhiteBlueishColor,
);
const kP5 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Color(0xffffffff),
);
const kP6 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  color: Color(0xffffffff),
);
const kP3 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w300,
  color: kWhiteBlueishColor,
);

const kP4 = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w300,
  color: Color(0XFF3A86BB),
);

const kSemiBold = TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.w600,
);
const kSemiBold2 = TextStyle(
  fontSize: 20,
  color: Color(0xff69DE98),
  fontWeight: FontWeight.w600,
);

const kBold = TextStyle(
  fontSize: 20,
  color: kWhiteBlueishColor,
  fontWeight: FontWeight.w700,
);

const kMouvStyle = TextStyle(
  fontSize: 12,
  color: Colors.white,
  fontWeight: FontWeight.w500,
);
// Styles

final kBoxFill = BoxDecoration(
  color: const Color(0XFF172F5C),
  borderRadius: BorderRadius.circular(10),
  border: Border.all(
    color: kStrokeColor,
    width: 2,
  ),
);

// Formats

final dateformat = DateFormat('yyyy-MM-dd');

// Enums

enum CountryDataType {
  percentage,
  number;

  String toJson() => name;
  static CountryDataType fromJson(String json) => values.byName(json);
}
