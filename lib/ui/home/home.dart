import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:djubli_echarts/helpers/constants.dart';
import 'package:djubli_echarts/helpers/drawable.dart';
import 'package:djubli_echarts/ui/home/home_detail_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final List<Items> imgList = [
  Items(
      img:
          'https://drive.google.com/uc?export=view&id=1F5a5tIlnd4GVEwAQJLF0MGq76t3HwyVt',
      title: 'Toyota Calya'),
  Items(
      img:
          'https://drive.google.com/uc?export=view&id=1YAUhg6QDEcoTqC7zHhQhhh8SAO_IlzTc',
      title: 'Toyota New Avanza'),
  Items(
      img:
          'https://drive.google.com/uc?export=view&id=10EkGiwEsxdE8-6UnSBAPwyJA3cLfKTPG',
      title: 'Toyota Raize'),
];

class _HomePageState extends State<HomePage> {
  ScreenUtil _dimens = ScreenUtil();

  final List<Widget> imageSliders = imgList
      .map((item) => GestureDetector(
    behavior: HitTestBehavior.opaque,
            onTap: (){
      Get.to(HomeDetailBanner(imgData: item.img!,title: item.title!,));
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item.img!,
                          fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            '${item.title}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  List<Map<String, Object>> _data1 = [{ 'name': 'Please wait', 'value': 0 }];

  getData1() async {
    await Future.delayed(Duration(seconds: 4));

    const dataObj = [{
      'price': '200000000',
      'date': '2018-03-03',
      'color': 'Abu-abu',
      'km': '41513',
      'location': 'DKI Jakarta'
    }, {
      'price': '300000000',
      'date': '2017-04-20',
      'color': 'Putih',
      'km': '23200',
      'location': 'Bandung'
    }, {
      'price': '335000000',
      'date': '2017-02-02',
      'color': 'Silver',
      'km': '26520',
      'location': 'DKI Jakarta'
    }, {
      'price': '400000000',
      'date': '2016-11-30',
      'color': 'Putih',
      'km': '12300',
      'location': 'DKI Jakarta'
    }, {
      'price': '500000000',
      'date': '2015-01-31',
      'color': 'Hitam',
      'km': '1250',
      'location': 'Surabaya'
    }];

    this.setState(() { this._data1 = dataObj;});
  }

  @override
  void initState() {
    super.initState();

    this.getData1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    ClipPath(
                      clipper: ArcClipper(),
                      child: Container(
                        height: _dimens.setHeight(228.0),
                        color: constants.secondaryColor,
                        child: Center(child: Text("")),
                      ),
                    ),
                    Positioned(
                      top: _dimens.setHeight(57.0),
                      right: _dimens.setWidth(15.0),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Get.snackbar('Perhatian', 'Ini adalah notifikasi!',
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        },
                        child: Image.asset(
                          DrawableX.imageAsset(AssetGambar.bell),
                          width: _dimens.setWidth(25.0),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: _dimens.setHeight(55.0),
                      left: _dimens.setWidth(15.0),
                      child: Image.asset(
                        DrawableX.imageAsset(AssetGambar.logo),
                        width: _dimens.setWidth(110.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: _dimens.setHeight(160.0)),
                      child: GestureDetector(
                        child: Container(
                          height: _dimens.setHeight(40.0),
                          margin: EdgeInsets.symmetric(
                              horizontal: _dimens.setWidth(20.0)),
                          padding: EdgeInsets.symmetric(
                              horizontal: _dimens.setWidth(20.0)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: constants.greyColor,
                                size: _dimens.setWidth(23.0),
                              ),
                              SizedBox(
                                width: _dimens.setWidth(10.0),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.snackbar(
                                        'Perhatian', 'Ini adalah pencarian!',
                                        backgroundColor: Colors.yellow,
                                        colorText: Colors.black);
                                  },
                                  behavior: HitTestBehavior.opaque,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cari mobil ...',
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            color: constants.greyColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: _dimens.setHeight(150.0),
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        initialPage: 0,
                        autoPlay: true,
                      ),
                      items: imageSliders,
                    )),
                SizedBox(
                  height: _dimens.setHeight(15.0),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: _dimens.setWidth(15.0), right: _dimens.setWidth(15.0)),
                  child: Text(
                    'Toyota Innova 2.5V AT \n2015',
                    style: TextStyle(
                        fontFamily: 'Nunito', fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: _dimens.setHeight(20.0),
                ),
                Container(
                  padding: EdgeInsets.only(left: _dimens.setWidth(15.0), right: _dimens.setWidth(15.0)),
                  child: Echarts(
                    option: '''
                    {
                    tooltip: {
                      backgroundColor: 'rgba(255,255,255,0.7)',
                      formatter: function (param) {
                        var value = param.value;

                        return 'Tanggal : '+value.date+'<br>'
                        + 'Warna : '+value.color+'<br>'
                        + 'Price : Rp '+value.price+'<br>'
                        + 'km : '+value.km+'<br>'
                        + 'Lokasi : '+value.location+'<br>'
                        ;
                      }
                    },
                      dataset: {
                        dimensions: ['date', 'price'],
                        source: ${jsonEncode(_data1)},
                      },
                      color: ['#3398DB'],
                      grid: {
                        left: '0%',
                        right: '0%',
                        bottom: '5%',
                        top: '10%',
                        height: '90%',
                        containLabel: true,
                        z: 22,
                      },
                      xAxis: [{
                        name: 'Waktu',
                        type: 'category',
                        gridIndex: 0,
                        axisTick: {
                          show: false,
                        },
                        axisLine: {
                          lineStyle: {
                            color: '#0c3b71',
                          },
                        },
                        axisLabel: {
                          show: true,
                          color: 'rgb(170,170,170)',
                          formatter: function xFormatter(value, index) {
                            if (index === 6) {
                              return `\${value}\\n*`;
                            }
                            return value;
                          },
                        },
                      }],
                      yAxis: {
                      name: 'Harga',
                        type: 'value',
                        gridIndex: 0,
                        splitLine: {
                          show: true,
                        },
                        axisTick: {
                            show: false,
                        },
                        axisLine: {
                          lineStyle: {
                            color: '#0c3b71',
                          },
                        },
                        axisLabel: {
                          color: 'rgb(170,170,170)',
                        },
                        splitNumber: 8,
                        splitArea: {
                          show: true,
                          areaStyle: {
                            color: ['rgba(250,250,250,0.0)', 'rgba(250,250,250,0.05)'],
                          },
                        },
                      },
                      series: [{
                        type: 'scatter',
                        barWidth: '50%',
                        xAxisIndex: 0,
                        yAxisIndex: 0,
                        itemStyle: {
                          normal: {
                            barBorderRadius: 5,
                            color: {
                              type: 'linear',
                              x: 0,
                              y: 0,
                              x2: 0,
                              y2: 1,
                              colorStops: [
                                {
                                  offset: 0, color: '#00feff',
                                },
                                {
                                  offset: 1, color: '#027eff',
                                },
                                {
                                  offset: 1, color: '#0286ff',
                                },
                              ],
                            },
                          },
                        },
                        zlevel: 11,
                      }],
                    }
                  ''',
                  ),
                  width: 300,
                  height: 250,
                ),
                SizedBox(
                  height: _dimens.setHeight(20.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Items {
  String? img;
  String? title;

  Items({this.img, this.title});
}
