import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/core/utils/app_size.dart';

import '../../theme/text_theme.dart';

class TextFieldButton extends StatefulWidget {
  final ValueChanged<bool> showBottomSheet;
  final bool showSuffix;
  final String hintMessage;

  const TextFieldButton(
      {Key? key,
      required this.showBottomSheet,
      required this.showSuffix,
      required this.hintMessage})
      : super(key: key);

  @override
  State<TextFieldButton> createState() => _TextFieldButtonState();
}

class _TextFieldButtonState extends State<TextFieldButton> {
  final _phoneNumberController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: _phoneNumberController,
          focusNode: _focusNode,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.darkOrange, width: 1.0),
              borderRadius: BorderRadius.circular(AppSize.radiusConfirmButton),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.gray, width: 1.0),
              borderRadius: BorderRadius.circular(AppSize.radiusConfirmButton),
            ),
            hintStyle: textTheme.bodyText2,
            // color of hint
            hintText: widget.hintMessage,

            suffixIcon: widget.showSuffix
                ? IconButton(
                    padding: EdgeInsets.all(10),
                    icon: SvgPicture.asset(
                      "assets/contact_icon.svg",
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {
                      widget.showBottomSheet(true);
                    },
                  )
                : null,

            counterText: '', // to hide length counter
          ),
          cursorColor: Color(0xFFADADAD),
          style: textThemeBlack.caption,
          keyboardType: TextInputType.number,
          autofocus: false,
          maxLength: 11,
        ),
      ),
    );
  }
}
