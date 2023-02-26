
import 'package:flutter/material.dart';
import 'package:top/core/utils/app_size.dart';

import '../../theme/text_theme.dart';

/// confirm button in app
class MyConfirmButton extends StatelessWidget {
  final String txt;
  final Color color;
  final bool txtColorWhite;
  const MyConfirmButton({Key? key,required this.txt,required this.color,required this.txtColorWhite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: AppSize.heightConfirmButton,
      decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.radiusConfirmButton)),

          color: color),
      child: Center(
        child: Text(
          txt,
          style: txtColorWhite ?textTheme.bodyText2 :textTheme.bodyText2,
        ),
      ),
    );
  }
}