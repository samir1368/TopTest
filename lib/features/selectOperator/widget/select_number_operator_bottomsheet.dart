import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/dataController.dart';
import '../../../theme/text_theme.dart';
import 'package:top/core/export_core.dart';
class SelectNumberOperatorBottomSheet extends StatelessWidget {
  final ValueChanged<bool> showBottomSheet;

   SelectNumberOperatorBottomSheet(
      {Key? key, required this.showBottomSheet})
      : super(key: key);
  final _controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {
        showBottomSheet(false);
        // setState(() {});
      },
      builder: (context) {
        return Container(
          margin:  EdgeInsets.only(top: AppSize.margin_100),
          padding: EdgeInsets.all(AppSize.margin_20),
          decoration: const BoxDecoration(
              color: AppColors.main_bg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.radiusBottomSheet),
                topRight: Radius.circular(AppSize.radiusBottomSheet),
              )),
          width: double.infinity,
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          showBottomSheet(false);
                        },
                        icon: SvgPicture.asset(
                          "assets/close_icon.svg",
                          width: 30,
                        )),
                    Spacer(),
                    Text(
                      "انتخاب شماره",
                      style: textThemeBlack.bodyText2,
                    ),
                    Spacer(),
                    Container(
                      width: 30,
                    )
                  ],
                ),
                Column(
                  children: [
                    Card(
                      margin: EdgeInsets.all(AppSize.margin_10),
                      color: AppColors.white,
                      shadowColor: Colors.blueGrey,
                      elevation: 8,
                      child: Container(
                          height: 70,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: SvgPicture.asset(
                                      "assets/next_arrow.svg")),
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppStrings.selectContact,
                                        style: textThemeBlack.bodyText2,
                                      ),
                                      Text(AppStrings.continueByContactList,
                                          style: textTheme.bodyText2)
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(AppSize.margin_8),
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        SvgPicture.asset(
                                            "assets/bg_select_contact_icon.svg"),
                                        Center(
                                            child: SvgPicture.asset(
                                                "assets/add_contact.svg")),
                                      ],
                                    ),
                                  )),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(AppStrings.contactList,
                          style: textTheme.bodyText2),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(AppSize.margin_10),
                    color: AppColors.white,
                    shadowColor: Colors.blueGrey,
                    elevation: 8,
                    child: ListView.separated(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return _buildItems(index);
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          indent: 15,
                          endIndent: 15,
                          color: AppColors.light_gray,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildItems(int index) {
    String phoneNumber = "";
    String operator = "";
    String icon = "";
    switch (index) {
      case 0:
        phoneNumber = "09121234567";
        operator = AppStrings.mci;
        icon = "assets/mci_with_bg.svg";
        break;
      case 1:
        phoneNumber = "09124168652";
        operator = AppStrings.irancel;
        icon = "assets/irancel_with_bg.svg";
        break;
      case 2:
        phoneNumber = "09124168652";
        operator = AppStrings.rightel;
        icon = "assets/rightel_with_bg.svg";
        break;
    }
    return InkWell(
      onTap: () {
        showBottomSheet(false);
        _controller.operator.value = operator;
        _controller.phoneNumber.value = phoneNumber;

      },
      child: Container(
          padding: EdgeInsets.all(AppSize.margin_8),
          child: Row(
            children: [
              Expanded(
                  flex: 1, child: SvgPicture.asset("assets/next_arrow.svg")),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        phoneNumber,
                        style: textThemeNumber.bodyText2,
                      ),
                      Text(
                        operator,
                        style: textTheme.bodyText2,
                      )
                    ],
                  )),
              Expanded(flex: 2, child: SvgPicture.asset(icon)),
            ],
          )),
    );
  }
}
