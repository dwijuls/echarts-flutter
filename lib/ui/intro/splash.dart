import 'package:djubli_echarts/helpers/constants.dart';
import 'package:djubli_echarts/helpers/drawable.dart';
import 'package:djubli_echarts/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  ScreenUtil _dimens = ScreenUtil();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAll(HomePage());
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.primaryColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Get.offAll(HomePage());
        },
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                DrawableX.imageAsset(AssetGambar.logo),
                width: _dimens.setWidth(252),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
