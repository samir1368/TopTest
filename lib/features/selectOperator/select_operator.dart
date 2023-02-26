import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/core/widget/appbar.dart';
import 'package:top/core/widget/textfield_button.dart';
import 'package:top/theme/text_theme.dart';

class SelectOperator extends StatelessWidget {
  const SelectOperator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(alignment:Alignment.centerRight,
                child: Text("شماره موبایل",style: textTheme.bodyText2,textDirection: TextDirection.rtl,)),
            const SizedBox(height: 8,),
            const TextFieldButton(),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10 ),
          child: Divider(
            thickness: 1, color: AppColors.gray,),
        ),
            Align(alignment:Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Text("ترابرد کرده‌اید؟ اپراتور خود را تغییر دهید",style: textTheme.bodyText2,textDirection: TextDirection.rtl,),
                    SvgPicture.asset("assets/info.svg"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
