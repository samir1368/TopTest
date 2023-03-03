import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:top/controller/dataController.dart';
import 'package:top/theme/text_theme.dart';
import 'package:top/core/export_core.dart';

/// This class is a StatefulWidget that shows information after paying your charge
class BillPage extends StatefulWidget {
  final String operatorIcon;

  const BillPage({Key? key, required this.operatorIcon}) : super(key: key);

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
      appBar: myAppbar(context, Get.find<DataController>().operator.value,
          widget.operatorIcon),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.all(AppSize.margin_16),
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
                              topLeft: Radius.circular(AppSize.radiusButton),
                              topRight: Radius.circular(AppSize.radiusButton),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildItem(AppStrings.phoneNumber,
                                Get.find<DataController>().phoneNumber.value),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  left: AppSize.margin_8,
                                  right: AppSize.margin_8),
                              child: const Divider(
                                thickness: 1,
                                color: AppColors.light_gray,
                              ),
                            ),
                            _buildItem(AppStrings.amount,
                                "${Get.find<DataController>().price.value}${AppStrings.rial}"),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  left: AppSize.margin_8,
                                  right: AppSize.margin_8),
                              child: const Divider(
                                thickness: 1,
                                color: AppColors.light_gray,
                              ),
                            ),
                            _buildItemAmount(AppStrings.finalAmount),
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
                                bottomLeft:
                                    Radius.circular(AppSize.radiusButton),
                                bottomRight:
                                    Radius.circular(AppSize.radiusButton),
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
                          margin: const EdgeInsets.only(top: AppSize.margin_10),
                          padding: const EdgeInsets.all(AppSize.margin_8),
                          decoration: const BoxDecoration(
                              color: AppColors.light_gray,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppSize.radiusButton))),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: AppSize.heightButton,
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
                                    height: AppSize.heightButton,
                                    decoration: const BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                AppSize.radiusButton))),
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
                          margin: const EdgeInsets.only(top: AppSize.margin_10),
                          padding: const EdgeInsets.all(AppSize.margin_8),
                          decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppSize.radiusButton))),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    height: AppSize.heightButton,
                                    child: Center(
                                        child: RotatedBox(
                                            quarterTurns: 3,
                                            child: SvgPicture.asset(
                                                "assets/next_arrow.svg"))),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: SizedBox(
                                    height: AppSize.heightButton,
                                    child: Center(
                                        child: Text(
                                      AppStrings.select,
                                      style: textTheme.bodyText2,
                                    )),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: AppSize.heightButton,
                                    decoration: const BoxDecoration(
                                        color: AppColors.bg_orange,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                AppSize.radiusButton))),
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
                        height: AppSize.heightButton,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: MyConfirmButton(
                            txt: AppStrings.payByCard,
                            color: AppColors.bg_unselected,
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
    appSnackbar(context, AppStrings.finishMessage);
  }

  _buildItem(String title, String message) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          padding: const EdgeInsets.all(AppSize.margin_10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textTheme.bodyText2,
              ),
              Text(
                message,
                style: textThemeNumber.bodyText2,
              ),
            ],
          )),
    );
  }

  _buildItemAmount(String title) {
    int realPrice = int.parse(Get.find<DataController>().price.value) + 1000;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          padding: const EdgeInsets.all(AppSize.margin_10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textThemeBlack.bodyText2,
              ),
              Text(
                "${realPrice}${AppStrings.rial}",
                style: textThemeBlackNumber.subtitle1,
              ),
            ],
          )),
    );
  }

  _buildItemSwitch() {
    return Container(
        padding: const EdgeInsets.all(AppSize.margin_8),
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
