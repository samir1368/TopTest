import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/core/utils/app_size.dart';
import 'package:top/core/utils/app_strings.dart';

import '../../controller/dataController.dart';
import '../../theme/text_theme.dart';


/// `TextFieldButton` is a stateful widget that displays a text field
class TextFieldButton extends StatefulWidget {
  final ValueChanged<bool> changeListenerFunction;
  final bool showSuffixIcon;
  final String hintMessage;

  const TextFieldButton(
      {Key? key,
      required this.changeListenerFunction,
      required this.showSuffixIcon,
      required this.hintMessage})
      : super(key: key);

  @override
  State<TextFieldButton> createState() => _TextFieldButtonState();
}

class _TextFieldButtonState extends State<TextFieldButton> {
  final _phoneNumberController = TextEditingController();
  final _controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    widget.showSuffixIcon
        ? _phoneNumberController.text =
            Get.find<DataController>().phoneNumber.value
        : null;
    return Padding(
      padding: const EdgeInsets.all(AppSize.margin_8),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: _phoneNumberController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.darkOrange, width: 1.0),
              borderRadius: BorderRadius.circular(AppSize.radiusButton),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.gray, width: 1.0),
              borderRadius: BorderRadius.circular(AppSize.radiusButton),
            ),
            hintStyle: textThemeNumber.bodyText2,
            // color of hint
            hintText: widget.hintMessage,

            suffixIcon: widget.showSuffixIcon
                ? IconButton(
                    padding: EdgeInsets.all(AppSize.margin_10),
                    icon: SvgPicture.asset(
                      "assets/contact_icon.svg",
                      width: AppSize.iconSize_25,
                      height: AppSize.iconSize_25,
                    ),
                    onPressed: () {
                      widget.changeListenerFunction(true);
                    },
                  )
                : Container(
                    width: AppSize.heightButton,
                    padding: const EdgeInsets.only(left: AppSize.margin_16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.rial,
                        style: textThemeNumber.caption,
                      ),
                    ),
                  ),

            counterText: '', // to hide length counter
          ),
          onChanged: (value) {
            if (widget.showSuffixIcon) {
              _controller.phoneNumber.value = value.toString();
            } else {
              _controller.price.value = value.toString();
              widget.changeListenerFunction(true);
            }
          },
          cursorColor: AppColors.cursor_color,
          style: textThemeBlackNumber.bodyText2,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          autofocus: false,
          maxLength: widget.showSuffixIcon ? 11 : 7,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneNumberController.dispose();
    super.dispose();
  }
}
