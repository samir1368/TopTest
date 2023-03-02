
import 'package:top/core/utils/app_strings.dart';

String ChooseOperator(String phoneNumber){
  String operatorName ="";
  var code = phoneNumber.substring(0,4).trim();
  switch (code){
    case "0912" :
      operatorName =AppStrings.mci;
      break;
    case "0921" :
      operatorName =AppStrings.rightel;
      break;
    case "0933" :
      operatorName =AppStrings.irancel;
      break;
    case "0998" :
      operatorName =AppStrings.shatel;
      break;
    case "0999" :
      operatorName =AppStrings.aptel;
      break;
    default :
      operatorName =AppStrings.mci;
      break;
  }

  return operatorName;
}
