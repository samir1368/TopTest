import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top/features/splash/splash_page.dart';
import 'features/selectOperator/page/select_operator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home:  SplashPage(),
    );
  }
}
