import 'package:flutter/material.dart';
import 'package:top/core/utils/app_size.dart';
import '../../theme/text_theme.dart';

/// confirm button in app
class MyConfirmButton extends StatelessWidget {
  final VoidCallback clickConfirm;
  final String txt;
  final Color color;

  const MyConfirmButton(
      {Key? key,
      required this.txt,
      required this.color,
      required this.clickConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        clickConfirm();
      },
      child: Container(
        height: AppSize.heightButton,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
                Radius.circular(AppSize.radiusButton)),
            color: color),
        child: Center(
          child: Text(
            txt,
            style: textThemeWhite.bodyText2,
          ),
        ),
      ),
    );
  }
}
