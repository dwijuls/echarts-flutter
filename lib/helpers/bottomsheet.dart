import 'package:djubli_echarts/helpers/drawable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomsheetDeveloper extends StatefulWidget {
  const BottomsheetDeveloper({Key? key}) : super(key: key);

  @override
  _BottomsheetDeveloperState createState() => _BottomsheetDeveloperState();
}

class _BottomsheetDeveloperState extends State<BottomsheetDeveloper> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  showInfoDeveloper(BuildContext context, ScreenUtil _dimens) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        // <-- make bottom sheet resize to content height
        shape: RoundedRectangleBorder(
          // <-- for border radius
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        builder: (BuildContext context) {
          return AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _dimens.setWidth(20.0),
                  vertical: _dimens.setHeight(20.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    child: Container(
                      width: _dimens.setWidth(80.0),
                      height: _dimens.setHeight(5.0),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: _dimens.setHeight(25.0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: _dimens.setHeight(0.0)),
                        child: Text(
                          'Developer Info',
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: _dimens.setSp(14.0)),
                        ),
                      ),
                      SizedBox(
                        height: _dimens.setHeight(20.0),
                      ),
                      Center(child: Column(
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(48), // Image radius
                              child: Image.asset(DrawableX.imageAsset(AssetGambar.kris)),
                            ),
                          ),
                          Text(
                            'Krisnadi Dwi Julianto',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: _dimens.setSp(14.0)),
                          ),
                          Text(
                            '(Frontend Developer)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: _dimens.setSp(14.0)),
                          ),
                          SizedBox(
                            height: _dimens.setHeight(5.0),
                          ),
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
          ); // <-- any widget you want
        });
  }
}
