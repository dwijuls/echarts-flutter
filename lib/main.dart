import 'package:djubli_echarts/ui/intro/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (BuildContext context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: true,
        home: Splash(),
        theme: ThemeData(fontFamily: 'Nunito'),
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('id', 'ID'), // Indonesia
        ],
      ),
    ),
  );
}
