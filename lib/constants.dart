import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const MaterialColor kPrimaryColor = const MaterialColor(
  0xFF6F35A5,
  const <int, Color>{
    50: const Color(0xFF6F35A5),
    100: const Color(0xFF6F35A5),
    200: const Color(0xFF6F35A5),
    300: const Color(0xFF6F35A5),
    400: const Color(0xFF6F35A5),
    500: const Color(0xFF6F35A5),
    600: const Color(0xFF6F35A5),
    700: const Color(0xFF6F35A5),
    800: const Color(0xFF6F35A5),
    900: const Color(0xFF6F35A5),
  },
);

const MaterialColor kPrimaryLightColor = const MaterialColor(
  0xFFF1E6FF,
  const <int, Color>{
    50: const Color(0xFFF1E6FF),
    100: const Color(0xFFF1E6FF),
    200: const Color(0xFFF1E6FF),
    300: const Color(0xFFF1E6FF),
    400: const Color(0xFFF1E6FF),
    500: const Color(0xFFF1E6FF),
    600: const Color(0xFFF1E6FF),
    700: const Color(0xFFF1E6FF),
    800: const Color(0xFFF1E6FF),
    900: const Color(0xFFF1E6FF),
  },
);

const MaterialColor greenColor = const MaterialColor(
  0xFF00AF19,
  const <int, Color>{
    50: const Color(0xFF00AF19),
    100: const Color(0xFF00AF19),
    200: const Color(0xFF00AF19),
    300: const Color(0xFF00AF19),
    400: const Color(0xFF00AF19),
    500: const Color(0xFF00AF19),
    600: const Color(0xFF00AF19),
    700: const Color(0xFF00AF19),
    800: const Color(0xFF00AF19),
    900: const Color(0xFF00AF19),
  },
);

const kSpacingUnit = 10;

const MaterialColor kDarkPrimaryColor = const MaterialColor(
  0xFF212121,
  const <int, Color>{
    50: const Color(0xFF212121),
    100: const Color(0xFF212121),
    200: const Color(0xFF212121),
    300: const Color(0xFF212121),
    400: const Color(0xFF212121),
    500: const Color(0xFF212121),
    600: const Color(0xFF212121),
    700: const Color(0xFF212121),
    800: const Color(0xFF212121),
    900: const Color(0xFF212121),
  },
);

const MaterialColor kDarkSecondaryColor = const MaterialColor(
  0xFF373737,
  const <int, Color>{
    50: const Color(0xFF373737),
    100: const Color(0xFF373737),
    200: const Color(0xFF373737),
    300: const Color(0xFF373737),
    400: const Color(0xFF373737),
    500: const Color(0xFF373737),
    600: const Color(0xFF373737),
    700: const Color(0xFF373737),
    800: const Color(0xFF373737),
    900: const Color(0xFF373737),
  },
);

const MaterialColor kLightPrimaryColor = const MaterialColor(
  0xFF373737,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

const MaterialColor kLightSecondaryColor = const MaterialColor(
  0xFFF3F7FB,
  const <int, Color>{
    50: const Color(0xFFF3F7FB),
    100: const Color(0xFFF3F7FB),
    200: const Color(0xFFF3F7FB),
    300: const Color(0xFFF3F7FB),
    400: const Color(0xFFF3F7FB),
    500: const Color(0xFFF3F7FB),
    600: const Color(0xFFF3F7FB),
    700: const Color(0xFFF3F7FB),
    800: const Color(0xFFF3F7FB),
    900: const Color(0xFFF3F7FB),
  },
);

const MaterialColor kAccentColor = const MaterialColor(
  0xFFFFC107,
  const <int, Color>{
    50: const Color(0xFFFFC107),
    100: const Color(0xFFFFC107),
    200: const Color(0xFFFFC107),
    300: const Color(0xFFFFC107),
    400: const Color(0xFFFFC107),
    500: const Color(0xFFFFC107),
    600: const Color(0xFFFFC107),
    700: const Color(0xFFFFC107),
    800: const Color(0xFFFFC107),
    900: const Color(0xFFFFC107),
  },
);

const MaterialColor kRoyalBlue = const MaterialColor(
  0xFF4169e1,
  const <int, Color>{
    50: const Color(0xFF4169e1),
    100: const Color(0xFF4169e1),
    200: const Color(0xFF4169e1),
    300: const Color(0xFF4169e1),
    400: const Color(0xFF4169e1),
    500: const Color(0xFF4169e1),
    600: const Color(0xFF4169e1),
    700: const Color(0xFF4169e1),
    800: const Color(0xFF4169e1),
    900: const Color(0xFF4169e1),
  },
);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
  color: kRoyalBlue,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
);
