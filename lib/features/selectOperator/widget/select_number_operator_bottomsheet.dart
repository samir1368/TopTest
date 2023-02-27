import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../theme/text_theme.dart';

class SelectNumberOperatorBottomSheet extends StatelessWidget {
  final ValueChanged<bool> showBottomSheet;
  const SelectNumberOperatorBottomSheet({Key? key,required this.showBottomSheet}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return BottomSheet(
        onClosing: () {
          showBottomSheet(false);
         // setState(() {});
        },
        builder: (context) {
          return Container(
            height: 120,
            decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {
                        showBottomSheet(false);

                      },
                      child: Text(
                        "  MyStrings.free",
                        style: textThemeWhite.subtitle1,
                        textDirection: TextDirection.rtl,
                      )),
                ),

              ],
            ),
          );
        },
      );


  }
}
