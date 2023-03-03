
import 'package:flutter/material.dart';

import '../../theme/text_theme.dart';

void appSnackbar(BuildContext context, String title) {

  final snackBar = SnackBar(
    content: Text(
      title,
      style: textThemeWhite.bodyText2,
      textAlign: TextAlign.end,
    ),
  );
   ScaffoldMessenger.of(context).showSnackBar(snackBar);

}