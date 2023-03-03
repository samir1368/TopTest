
import 'package:flutter/material.dart';
import 'package:top/core/utils/app_colors.dart';
/// This class is for text style
final textTheme= const TextTheme(
  subtitle1:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  bodyText2:  TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  caption:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  overline:  TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  headline5:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
).apply(
  bodyColor:  AppColors.txt_color,
  displayColor:  AppColors.txt_color,
  fontFamily: "IRANSansMobile",

);
final textThemeBlack= const TextTheme(
  subtitle1:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  bodyText2:  TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  caption:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  overline:  TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  headline5:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
).apply(
  bodyColor:  AppColors.black,
  displayColor:  AppColors.black,
  fontFamily: "IRANSansMobile",

);
final textThemeWhite = const TextTheme(
  subtitle1:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  bodyText2:  TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  caption:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  overline:  TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  headline5:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
).apply(
  bodyColor:  AppColors.white,
  displayColor: AppColors.white,
  fontFamily: "IRANSansMobile",

);

final textThemeOrange = const TextTheme(
  subtitle1:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  bodyText2:  TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  caption:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  overline:  TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  headline5:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
).apply(
  bodyColor:  AppColors.lightOrange,
  displayColor: AppColors.lightOrange,
  fontFamily: "IRANSansMobile",

);

final textThemeNumber= const TextTheme(
  subtitle1:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  bodyText2:  TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  caption:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  overline:  TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  headline5:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
).apply(
  bodyColor:  AppColors.txt_color,
  displayColor:  AppColors.txt_color,
  fontFamily: "Dana-FaNum-Light",

);

final textThemeBlackNumber= const TextTheme(
  subtitle1:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  bodyText2:  TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  caption:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  overline:  TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  headline5:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
).apply(
  bodyColor:  AppColors.black,
  displayColor:  AppColors.black,
  fontFamily:  "Dana-FaNum-Light",

);


final textThemeOrangeNumber = const TextTheme(
  subtitle1:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  bodyText2:  TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  caption:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  overline:  TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  headline5:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
).apply(
  bodyColor:  AppColors.lightOrange,
  displayColor: AppColors.lightOrange,
  fontFamily:  "Dana-FaNum-Light",

);