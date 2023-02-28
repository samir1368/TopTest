import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/core/widget/appbar.dart';
import 'package:top/core/widget/textfield_button.dart';
import 'package:top/theme/text_theme.dart';
import 'package:top/core/utils/app_size.dart';
import '../../../core/widget/confirm_button.dart';

class BillPage extends StatefulWidget {
  const BillPage({Key? key}) : super(key: key);

  @override
  BillPageState createState() => BillPageState();
}

class BillPageState extends State<BillPage> {
  late final List<int> _chargeData = [];

  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _chargeData.add(2100);
    _chargeData.add(2500);
    _chargeData.add(6000);
    _chargeData.add(7000);
    _chargeData.add(1000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: myAppbar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "صورتحساب",
                        style: textTheme.bodyText2,
                        textDirection: TextDirection.rtl,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.green[100],
                    shadowColor: Colors.blueGrey,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.darkOrange, width: 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildItem(),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          child: const Divider(
                            thickness: 1,
                            color: AppColors.gray,
                          ),
                        ),
                        _buildItem(),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          child: const Divider(
                            thickness: 1,
                            color: AppColors.gray,
                          ),
                        ),
                        _buildItem(),
                      ],
                    ),
                  ),
                  Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.green[100],
                      shadowColor: Colors.blueGrey,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          side:
                              BorderSide(color: AppColors.darkOrange, width: 1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                      child: _buildItemSwitch()),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "صورتحساب",
                    style: textTheme.bodyText2,
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: AppColors.background_bottomsheet,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,

                                child: Center(child: Text("sami")),
                              )),
                          SizedBox(
                            width: 2,
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: AppColors.blue,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(child: Text("ffdd")),
                              ))
                        ],
                      )),
                  Text(
                    "صورتحساب",
                    style: textTheme.bodyText2,
                    textDirection: TextDirection.rtl,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: AppColors.background_bottomsheet,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              flex:1,
                              child: Container(
                                height: 50,

                                child: Center(child: Text("sami")),
                              )),
                          Expanded(
                              flex: 4,
                              child: Container(
                                height: 50,

                                child: Center(child: Text("انتخاب کنید")),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: AppColors.blue,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Center(child: Text("ffdd")),
                              ))
                        ],
                      )),
                    SizedBox(height: 10,),
                  Container(
                    height: AppSize.heightConfirmButton,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MyConfirmButton(
                        txt: "پرداخت با کارت",
                        color: AppColors.lightOrange,
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
    );
  }

  void _clickConfirm() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BillPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    ));
  }

  _buildItem() {
    return Container(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("انتخاب مخاطبین"),
            Text("09124168652 "),
          ],
        ));
  }

  _buildItemSwitch() {
    return Container(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("انتخاب مخاطبین"),
            Transform.scale(
              scale: 0.6,
              child: CupertinoSwitch(
                activeColor: AppColors.darkOrange,
                value: true,
                onChanged: (bool value) {
                  setState(() {
                    //  _switchValuePremium = value;
                  });
                },
              ),
            )
          ],
        ));
  }
}
