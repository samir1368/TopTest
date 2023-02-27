
import 'package:flutter/material.dart';
import 'package:top/core/utils/app_colors.dart';

final textTheme= const TextTheme(
  subtitle1:  TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  bodyText2:  TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  caption:  TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  overline:  TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  headline5:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
).apply(
  bodyColor:  AppColors.black,
  displayColor:  AppColors.black,
  fontFamily: "Dana-FaNum-Light",

);

final textThemeWhite = const TextTheme(
  subtitle1: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  bodyText2: const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  caption: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  overline: const TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  headline5: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
).apply(
  bodyColor:  AppColors.white,
  displayColor: AppColors.white,
  fontFamily: "Dana-FaNum-Light",

);