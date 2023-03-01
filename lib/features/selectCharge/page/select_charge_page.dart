import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/core/utils/app_strings.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: myAppbar(context, AppStrings.buy, "assets/buy_credit_icon.svg"),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: AppColors.main_bg,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppStrings.selectPayCharge,
                        style: textTheme.bodyText2,
                        textDirection: TextDirection.rtl,
                      ),
                      Card(
                        margin: EdgeInsets.all(10),
                        color: AppColors.white,
                        shadowColor: Colors.blueGrey,
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                  color: AppColors.light_gray,
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
                                      return _buildWidgetItem(model, context,
                                          _chargeData.indexOf(model));
                                    }),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                AppStrings.desire_amount,
                                style: textThemeBlack.bodyText2,
                                textDirection: TextDirection.rtl,
                              ),
                              TextFieldButton(
                                showBottomSheet: (_) {},
                                showSuffix: false,
                                hintMessage: AppStrings.amount,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(15),
              height: AppSize.heightConfirmButton,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MyConfirmButton(
                  txt: AppStrings.confirm,
                  color: AppColors.lightOrange,
                  txtColorWhite: true,
                  clickConfirm: _clickConfirm,
                ),
              ),
            ),
          ),
        ],
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
                  color: AppColors.bg_orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: AppColors.lightOrange,
                    width: 1,
                  ),
                )
              : BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: AppColors.gray,
                    width: 1,
                  ),
                ),
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                chargeModel.toString() + " ریال",
                style: _selectedIndex == index
                    ? textThemeOrange.bodyText2
                    : textTheme.bodyText2,
              )),
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
                    Text(
                      "09124168652",
                      style: textThemeBlack.bodyText2,
                    ),
                    Text(
                      AppStrings.mci,
                      style: textTheme.bodyText2,
                    )
                  ],
                )),
            Expanded(
                flex: 1, child: SvgPicture.asset("assets/mci_with_bg.svg")),
          ],
        ));
  }
}
