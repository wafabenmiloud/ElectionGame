import 'package:flutter/material.dart';

import 'constants.dart';

final kThemeData = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: kBackgroundColor,
  elevatedButtonTheme: kElevatedButtonThemeData,
);

final kElevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    side: MaterialStateProperty.all(
      const BorderSide(
        width: 2,
        color: Color(0XFF30538C),
      ),
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 23, horizontal: 60),
    ),
    fixedSize: MaterialStateProperty.all(const Size.fromHeight(60)),
    foregroundColor: MaterialStateProperty.all(kSecondaryColor),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        color: Color(0XFF0F2140),
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
    ),
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        // return const Color(0XFF0F2140);
      } else {
        return const Color(0XFF0CA0F3);
      }
      return null;
    }),
    elevation: MaterialStateProperty.all(0),
  ),
);
