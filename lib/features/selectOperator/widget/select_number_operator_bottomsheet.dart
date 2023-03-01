import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../theme/text_theme.dart';

class SelectNumberOperatorBottomSheet extends StatelessWidget {
  final ValueChanged<bool> showBottomSheet;

  const SelectNumberOperatorBottomSheet(
      {Key? key, required this.showBottomSheet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {
        showBottomSheet(false);
        // setState(() {});
      },
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: AppColors.main_bg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
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
                      margin: EdgeInsets.all(10),
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
                                    padding: const EdgeInsets.all(4.0),
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
                    margin: EdgeInsets.all(10),
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
      },
      child: Container(
          padding: EdgeInsets.all(8),
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
                        style: textTheme.bodyText2,
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
