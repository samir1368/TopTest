import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/core/utils/app_strings.dart';
import 'package:top/core/widget/appbar.dart';
import 'package:top/core/widget/textfield_button.dart';
import 'package:top/features/selectCharge/page/select_charge_page.dart';
import 'package:top/features/selectOperator/widget/select_number_operator_bottomsheet.dart';
import 'package:top/theme/text_theme.dart';

import '../../../core/widget/confirm_button.dart';
import '../model/operator_model.dart';

class SelectOperator extends StatefulWidget {
  const SelectOperator({Key? key}) : super(key: key);

  @override
  SelectOperatorState createState() => SelectOperatorState();
}

class SelectOperatorState extends State<SelectOperator> {
  late final List<OperatorModel> _operatorData = [];
  bool _showBottomSheet = false;

  int _selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _operatorData.add(OperatorModel(AppStrings.mci, "assets/mci_sim_light.svg",
        "assets/irancell_sim_off_light.svg"));
    _operatorData.add(OperatorModel(AppStrings.irancel,
        "assets/irancell_sim_light.svg", "assets/irancell_sim_off_light.svg"));
    _operatorData.add(OperatorModel(AppStrings.rightel,
        "assets/rightel_sim_light.svg", "assets/rightel_sim_off_light.svg"));
    _operatorData.add(OperatorModel(AppStrings.shatel,
        "assets/shatel_sim_light.svg", "assets/shatel_sim_off_light.svg"));
    _operatorData.add(OperatorModel(AppStrings.aptel,
        "assets/aptel_sim_light.svg", "assets/aptel_sim_off_light.svg"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main_bg,
      appBar: FirstPageAppbar(context, AppStrings.buy, "assets/buy_credit_icon.svg"),
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Card(
                    color: AppColors.white,
                    shadowColor: Colors.blueGrey,
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                AppStrings.phoneNumber,
                                style: textTheme.bodyText2,
                                textDirection: TextDirection.rtl,
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFieldButton(
                              showBottomSheet: showBottomSheet,
                              showSuffix: true,
                              hintMessage: "مثلا 09123456789"),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(10),
                            child: const Divider(
                              thickness: 1,
                              color: AppColors.light_gray,
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    AppStrings.changeTaraboard,
                                    style: textTheme.bodyText2,
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SvgPicture.asset("assets/info.svg"),
                                ],
                              )),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: StaggeredGrid.count(
                              crossAxisCount: 3,
                              mainAxisSpacing: 3,
                              crossAxisSpacing: 3,
                              children: [
                                ..._operatorData.map((model) {
                                  return _buildWidgetItem(model, context,
                                      _operatorData.indexOf(model));
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                const Spacer(),
                MyConfirmButton(
                  txt: AppStrings.confirm,
                  color: AppColors.lightOrange,
                  txtColorWhite: true,
                  clickConfirm: _clickConfirm,
                )
              ],
            ),
          )),
      bottomSheet: _showBottomSheet
          ? SelectNumberOperatorBottomSheet(
              showBottomSheet: showBottomSheet,
            )
          : SizedBox(),
    );
  }

  _clickConfirm() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SelectChargePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    ));
  }

  void showBottomSheet(bool show) {
    setState(() {
      _showBottomSheet = show;
    });
  }

  Widget _buildWidgetItem(
      OperatorModel operatorModel, BuildContext context, int index) {
    return StaggeredGridTile.count(
        crossAxisCellCount: 1,
        mainAxisCellCount: 1,
        child: InkWell(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        _selectedIndex == index || _selectedIndex == -1
                            ? operatorModel.imagePath
                            : operatorModel.imagePathUnSelected),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      operatorModel.operatorName,
                      style: textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
