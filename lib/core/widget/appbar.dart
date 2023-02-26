import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/core/utils/app_strings.dart';
import 'package:top/theme/text_theme.dart';

  AppBar myAppbar() {
   return AppBar(
      toolbarHeight: 60,
      elevation: 1,
      iconTheme:  const IconThemeData(
        color: AppColors.gray, //change your color here
      ),
      actions: [IconButton(icon: SvgPicture.asset("assets/back_icon.svg"), onPressed: () {  },)],
      leading: IconButton(icon: SvgPicture.asset("assets/support_icon.svg",height: 25,), onPressed: () {  },),
      automaticallyImplyLeading: false,
      title: Row(mainAxisSize: MainAxisSize.min, children:  <Widget>[

        Text(
         AppStrings.buy,
          style: textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
        SvgPicture.asset("assets/buy_credit_icon.svg",height: 25,)
      ]),
      centerTitle: true,
      backgroundColor: AppColors.white,
    );

}
