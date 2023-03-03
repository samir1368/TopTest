
import 'package:get/get.dart';
import '../../../controller/dataController.dart';
import '../../../core/export_core.dart';


String chooseOperatorIcon(String phoneNumber){

  String operatorIcon ="";
  String operatorName =Get.find<DataController>().operator.value;
  if (operatorName!=""){
    switch (operatorName){
      case AppStrings.mci :
        operatorIcon ="assets/mci_with_bg.svg";
        break;
      case AppStrings.rightel :
        operatorIcon ="assets/rightel_with_bg.svg";
        break;
      case AppStrings.irancel :
        operatorIcon ="assets/irancel_with_bg.svg";
        break;
      case AppStrings.shatel:
        operatorIcon ="assets/shatel_sim_light.svg";
        break;
      case AppStrings.aptel:
        operatorIcon ="assets/aptel_sim_light.svg";
        break;
      default :
        operatorIcon ="assets/mci_with_bg.svg";
        break;
    }
  }else {
    var code = phoneNumber.substring(0,4).trim();
    switch (code){
      case "0912" :
        operatorIcon ="assets/mci_with_bg.svg";
        break;
      case "0921" :
        operatorIcon ="assets/rightel_with_bg.svg";
        break;
      case "0933" :
        operatorIcon ="assets/irancel_with_bg.svg";
        break;
      case "0998" :
        operatorIcon ="assets/shatel_sim_light.svg";
        break;
      case "0999" :
        operatorIcon ="assets/aptel_sim_light.svg";
        break;
      default :
        operatorIcon ="assets/mci_with_bg.svg";
        break;
    }
  }
  return operatorIcon;
}