import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/theme/text_theme.dart';
import '../export_core.dart';

/// It returns an AppBar with a title and a leading icon.
///
/// Args:
///   context (BuildContext): The context of the page.
///   title (String): The title of the appbar
///   path (String): The path to the image you want to use as the background.
AppBar myAppbar(BuildContext context, String title, String path) {
  return AppBar(
    toolbarHeight: AppSize.toolbarHeight,
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
        height: AppSize.iconSize_25,
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
        height: AppSize.iconSize_25,
      )
    ]),
    centerTitle: true,
    backgroundColor: AppColors.white,
  );
}

/// The same as `myAppbar` but it closes the app when the back button is pressed.
AppBar firstPageAppbar(BuildContext context, String title, String path) {
  return AppBar(
    toolbarHeight: AppSize.toolbarHeight,
    elevation: 1,
    iconTheme: const IconThemeData(
      color: AppColors.gray, //change your color here
    ),
    actions: [
      IconButton(
        icon: SvgPicture.asset("assets/back_icon.svg"),
        onPressed: () async {
          await SystemNavigator.pop();
        },
      )
    ],
    leading: IconButton(
      icon: SvgPicture.asset(
        "assets/support_icon.svg",
        height: AppSize.iconSize_25,
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
        height: AppSize.iconSize_25,
      )
    ]),
    centerTitle: true,
    backgroundColor: AppColors.white,
  );
}
