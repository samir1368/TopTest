import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/theme/text_theme.dart';

AppBar myAppbar(BuildContext context, String title, String path) {
  return AppBar(
    toolbarHeight: 60,
    elevation: 1,
    iconTheme: const IconThemeData(
      color: AppColors.gray, //change your color here
    ),
    actions: [
      IconButton(
        icon: SvgPicture.asset("assets/back_icon.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
    leading: IconButton(
      icon: SvgPicture.asset(
        "assets/support_icon.svg",
        height: 25,
      ),
      onPressed: () {},
    ),
    automaticallyImplyLeading: false,
    title: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text(
        title,
        style: textThemeBlack.subtitle1,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        width: 4,
      ),
      SvgPicture.asset(
        path,
        height: 25,
      )
    ]),
    centerTitle: true,
    backgroundColor: AppColors.white,
  );
}
AppBar FirstPageAppbar(BuildContext context, String title, String path) {
  return AppBar(
    toolbarHeight: 60,
    elevation: 1,
    iconTheme: const IconThemeData(
      color: AppColors.gray, //change your color here
    ),
    actions: [
      IconButton(
        icon: SvgPicture.asset("assets/back_icon.svg"),
        onPressed: ()async {
          await SystemNavigator.pop();
        },
      )
    ],
    leading: IconButton(
      icon: SvgPicture.asset(
        "assets/support_icon.svg",
        height: 25,
      ),
      onPressed: () {},
    ),
    automaticallyImplyLeading: false,
    title: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text(
        title,
        style: textThemeBlack.subtitle1,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        width: 4,
      ),
      SvgPicture.asset(
        path,
        height: 25,
      )
    ]),
    centerTitle: true,
    backgroundColor: AppColors.white,
  );
}
