import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeDetailBanner extends StatefulWidget {
  final String? imgData;
  final String? warna;
  final String? tanggal;
  final String? price;
  final String? km;
  final String? lokasi;
  const HomeDetailBanner({Key? key, this.imgData, this.warna, this.tanggal, this.price, this.km, this.lokasi}) : super(key: key);

  @override
  _HomeDetailBannerState createState() => _HomeDetailBannerState();
}

class _HomeDetailBannerState extends State<HomeDetailBanner> {
  ScreenUtil _dimens = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imgData!), fit: BoxFit.cover),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: _dimens.setWidth(5.0),
                              top: _dimens.setHeight(5.0),
                              bottom: _dimens.setHeight(0.0),
                              right: _dimens.setWidth(0.0),
                            ),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: tombolAtas(Icons.arrow_back, 20.0, () {
                                  Get.back();
                                })),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.45),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                          child: Text('Kijang Innova',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Nunito',
                                fontSize: _dimens.setSp(18.0),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: _dimens.setHeight(10.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('Warna : ${widget.warna}',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Nunito',
                                fontSize: _dimens.setSp(14.0),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('Kilometer : ${widget.km}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontSize: _dimens.setSp(14.0),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('Tanggal : ${widget.tanggal}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontSize: _dimens.setSp(14.0),),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('Lokasi : ${widget.lokasi}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontSize: _dimens.setSp(14.0),),
                          ),
                        ),
                        SizedBox(
                          height: _dimens.setHeight(20.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('Harga : ${widget.price}',
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Nunito',
                              fontSize: _dimens.setSp(16.0),
                            fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ]))
        ],
      ),
    );
  }

  Widget tombolAtas(icon, iconSize, onTapp) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(1, 1), // changes position of shadow
              )
            ],
            border: Border.all(color: Colors.grey, width: 0),
            color: Colors.white,
            shape: BoxShape.circle),
        child: Icon(icon, size: iconSize),
      ),
    );
  }
}
