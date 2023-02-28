import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/core/widget/appbar.dart';
import 'package:top/core/widget/textfield_button.dart';
import 'package:top/features/billPage/page/bill_page.dart';
import 'package:top/theme/text_theme.dart';
import 'package:top/core/utils/app_size.dart';
import '../../../core/widget/confirm_button.dart';

class SelectChargePage extends StatefulWidget {
  const SelectChargePage({Key? key}) : super(key: key);

  @override
  SelectChargePageState createState() => SelectChargePageState();
}

class SelectChargePageState extends State<SelectChargePage> {
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
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(

              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "انتخاب مبلغ شارژ",
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _phoneNumber(),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(10),
                        child: const Divider(
                          thickness: 1,
                          color: AppColors.gray,
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: StaggeredGrid.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                          children: [
                            ..._chargeData.map((model) {
                              return _buildWidgetItem(
                                  model, context, _chargeData.indexOf(model));
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "مبلغ دلخواه",
                        style: textTheme.bodyText2,
                        textDirection: TextDirection.rtl,
                      ),
                      TextFieldButton(showBottomSheet: (_) {}),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    height: AppSize.heightConfirmButton,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MyConfirmButton(
                        txt: "تایید و ادامه",
                        color: AppColors.lightOrange,
                        txtColorWhite: true,
                        clickConfirm: _clickConfirm,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clickConfirm() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          BillPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    ));
  }

  Widget _buildWidgetItem(int chargeModel, BuildContext context, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_selectedIndex != index)
            _selectedIndex = index;
          else
            _selectedIndex = -1;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: _selectedIndex == index
              ? BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: AppColors.dark_blue,
                    width: 1,
                  ),
                )
              : BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: AppColors.gray,
                    width: 1,
                  ),
                ),
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(chargeModel.toString() + " ریال")),
        ),
      ),
    );
  }

  _phoneNumber() {
    return Container(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("انتخاب مخاطبین"),
                    Text("ادامه با لیست مخاطب ها")
                  ],
                )),
            Expanded(
                flex: 1, child: SvgPicture.asset("assets/add_contact.svg")),
          ],
        ));
  }
}
