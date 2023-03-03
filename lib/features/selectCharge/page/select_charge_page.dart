import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:top/features/billPage/page/bill_page.dart';
import 'package:top/theme/text_theme.dart';
import '../../../controller/dataController.dart';
import '../model/choose_operator_icon.dart';
import '../model/convert_digit_to_letter.dart';
import 'package:top/core/export_core.dart';

/// This class is a stateful widget that user can select a price
class SelectChargePage extends StatefulWidget {
  const SelectChargePage({Key? key}) : super(key: key);

  @override
  SelectChargePageState createState() => SelectChargePageState();
}

class SelectChargePageState extends State<SelectChargePage> {
  late final List<int> _chargeData = [];
  int _selectedIndex = -1;
  final _controller = Get.put(DataController());
  String operatorIcon = "";
  String _favPrice = "";

  @override
  void initState() {
    super.initState();
    _chargeData.add(2100);
    _chargeData.add(2500);
    _chargeData.add(6000);
    _chargeData.add(7000);
    _chargeData.add(1000);
    operatorIcon =
        chooseOperatorIcon(Get.find<DataController>().phoneNumber.value);
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
              padding: EdgeInsets.all(AppSize.margin_10),
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
                        margin: EdgeInsets.all(AppSize.margin_10),
                        color: AppColors.white,
                        shadowColor: Colors.blueGrey,
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(AppSize.margin_8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _phoneNumberRow(),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(AppSize.margin_10),
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
                              const  SizedBox(
                                height: 20,
                              ),
                              Text(
                                AppStrings.desire_amount,
                                style: textThemeBlack.bodyText2,
                                textDirection: TextDirection.rtl,
                              ),
                              TextFieldButton(
                                changeListenerFunction: (_) {
                                  setState(() {
                                    _favPrice =
                                        Get.find<DataController>().price.value;
                                    _selectedIndex = -1;
                                  });
                                },
                                showSuffixIcon: false,
                                hintMessage: AppStrings.amount,
                              ),
                              const  SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  _favPrice.length > 1
                                      ? "${toPersianWords(int.parse(_convertRialToToman(_favPrice)))}${AppStrings.toman}"
                                      : "",
                                  style: textThemeNumber.bodyText2,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              )
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
              margin: EdgeInsets.all(AppSize.margin_16),
              height: AppSize.heightButton,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MyConfirmButton(
                  txt: AppStrings.confirm,
                  color: AppColors.lightOrange,
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
    if (Get.find<DataController>().price.value.isEmpty) {
      appSnackbar(context, AppStrings.choose_price);
      return;
    }
    Get.to(
      () => BillPage(
        operatorIcon: operatorIcon,
      ),
    );
  }

  Widget _buildWidgetItem(int chargeModel, BuildContext context, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _controller.price.value = chargeModel.toString();
          if (_selectedIndex != index)
            _selectedIndex = index;
          else
            _selectedIndex = -1;
        });
      },
      child: Container(
        padding: EdgeInsets.all(AppSize.margin_16),
        margin: EdgeInsets.all(4),
        decoration: _selectedIndex == index
            ? BoxDecoration(
                color: AppColors.bg_orange,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.radiusButton),
                ),
                border: Border.all(
                  color: AppColors.lightOrange,
                  width: 1,
                ),
              )
            : BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppSize.radiusButton),
                ),
                border: Border.all(
                  color: AppColors.gray,
                  width: 1,
                ),
              ),
        child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${_addCommaToNumbers(chargeModel.toString())} ${AppStrings.rial}",
              style: _selectedIndex == index
                  ? textThemeOrangeNumber.bodyText2
                  : textThemeNumber.bodyText2,
            )),
      ),
    );
  }

  _phoneNumberRow() {
    return Container(
        padding: EdgeInsets.all(AppSize.margin_8),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Get.find<DataController>().phoneNumber.value,
                      style: textThemeBlackNumber.bodyText2,
                    ),
                    Text(
                      Get.find<DataController>().operator.value,
                      style: textTheme.bodyText2,
                    )
                  ],
                )),
            Expanded(flex: 1, child: SvgPicture.asset(operatorIcon)),
          ],
        ));
  }

  String _addCommaToNumbers(String price) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    return price.replaceAllMapped(reg, mathFunc);
  }

  String _convertRialToToman(String rialPrice) {
    return rialPrice.substring(0, rialPrice.length - 1);
  }
}
