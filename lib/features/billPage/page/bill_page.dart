import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/core/utils/app_strings.dart';
import 'package:top/core/widget/appbar.dart';
import 'package:top/core/widget/textfield_button.dart';
import 'package:top/theme/text_theme.dart';
import 'package:top/core/utils/app_size.dart';
import '../../../core/widget/confirm_button.dart';

/// This class is a StatefulWidget that shows information after paying your charge
class BillPage extends StatefulWidget {
  const BillPage({Key? key}) : super(key: key);

  @override
  BillPageState createState() => BillPageState();
}

class BillPageState extends State<BillPage> {
  bool _switchValue = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main_bg,
      resizeToAvoidBottomInset: false,
      appBar: myAppbar(context, AppStrings.buy_mci, "assets/mci_light.svg"),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            AppStrings.bill,
                            style: textTheme.bodyText2,
                            textDirection: TextDirection.rtl,
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        color: AppColors.white,
                        shadowColor: Colors.blueGrey,
                        elevation: 8,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: AppColors.white, width: 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildItem(AppStrings.phoneNumber, "0912416852"),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 8, right: 8),
                              child: const Divider(
                                thickness: 1,
                                color: AppColors.light_gray,
                              ),
                            ),
                            _buildItem(AppStrings.amount, "2100ریال"),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(left: 8, right: 8),
                              child: const Divider(
                                thickness: 1,
                                color: AppColors.light_gray,
                              ),
                            ),
                            _buildItemAmount(
                                AppStrings.finalAmount, "23 هزار ریال"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
                          color: AppColors.white,
                          shadowColor: Colors.blueGrey,
                          elevation: 8,
                          shape: const RoundedRectangleBorder(
                              side:
                                  BorderSide(color: AppColors.white, width: 1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                          child: _buildItemSwitch()),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppStrings.selectPayWay,
                        style: textTheme.bodyText2,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: AppColors.light_gray,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                     AppStrings.wallet,
                                      style: textTheme.bodyText2,
                                    )),
                                  )),
                              const SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Center(
                                      child: Text(
                                       AppStrings.card,
                                        style: textThemeOrange.bodyText2,
                                      ),
                                    ),
                                  ))
                            ],
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        AppStrings.bill,
                        style: textTheme.bodyText2,
                        textDirection: TextDirection.rtl,
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                        child: RotatedBox(
                                            quarterTurns: 3,
                                            child: SvgPicture.asset(
                                                "assets/next_arrow.svg"))),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: SizedBox(
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                      AppStrings.select,
                                      style: textTheme.bodyText2,
                                    )),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: AppColors.bg_orange,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Stack(
                                      children: [
                                        Center(
                                            child: SvgPicture.asset(
                                                "assets/bank_logo.svg")),
                                      ],
                                    ),
                                  ))
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: AppSize.heightConfirmButton,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: MyConfirmButton(
                            txt: AppStrings.payByCard,
                            color: AppColors.bg_unselected,
                            txtColorWhite: true,
                            clickConfirm: _clickConfirm,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _clickConfirm() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const BillPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    ));
  }

  _buildItem(String title, String message) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message,
              style: textTheme.bodyText2,
            ),
            Text(
              title,
              style: textTheme.bodyText2,
            ),
          ],
        ));
  }

  _buildItemAmount(String title, String message) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              message,
              style: textThemeBlack.bodyText2,
            ),
            Text(
              title,
              style: textThemeBlack.bodyText2,
            ),
          ],
        ));
  }

  _buildItemSwitch() {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: AppColors.darkOrange,
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = !_switchValue;
                  });
                },
              ),
            ),
            Text(
            AppStrings.saveMobilePhone,
              style: textTheme.bodyText2,
            ),
          ],
        ));
  }
}
