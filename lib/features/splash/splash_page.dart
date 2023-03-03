

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top/core/utils/app_colors.dart';
import 'package:top/features/selectOperator/page/select_operator.dart';

/*
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/logo.png',

            fit: BoxFit.cover,
            height: 250.0, image: 'assets/logo.png',
          ));
  }

}*/

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<SplashPage>  {

  @override
  void initState() {
    super.initState();
    _init();
  }
  _init()async {
    await Future<void>.delayed(const Duration(seconds: 2));
    Get.to(() => const SelectOperator());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child:  Image.asset("assets/logo.png",height: 300,),
          )
        ],
      ),
    );
  }
}