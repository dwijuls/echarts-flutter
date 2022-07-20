import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:djubli_echarts/helpers/bottomsheet.dart';
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

class _HomePageState extends State<HomePage> {
  ScreenUtil _dimens = ScreenUtil();
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();
  bool _show = false;

  var dataObj = [
    [
      '2018-03-03',
      '200000000',
      'https://drive.google.com/uc?export=view&id=1UR8Z2f9suoM8SauZJruMVsxkbAGUWkns',
      'Abu-abu',
      '41513',
      'DKI Jakarta'
    ],
    [
      '2017-04-20',
      '300000000',
      'https://drive.google.com/uc?export=view&id=1UR8Z2f9suoM8SauZJruMVsxkbAGUWkns',
      'Putih',
      '23200',
      'Bandung'
    ],
    [
      '2017-02-02',
      '335000000',
      'https://drive.google.com/uc?export=view&id=1UR8Z2f9suoM8SauZJruMVsxkbAGUWkns',
      'Silver',
      '26520',
      'DKI Jakarta'
    ],
    [
      '2016-11-30',
      '400000000',
      'https://drive.google.com/uc?export=view&id=1UR8Z2f9suoM8SauZJruMVsxkbAGUWkns',
      'Putih',
      '12300',
      'DKI Jakarta'
    ],
    [
      '2015-01-31',
      '500000000',
      'https://drive.google.com/uc?export=view&id=1UR8Z2f9suoM8SauZJruMVsxkbAGUWkns',
      'Hitam',
      '1250',
      'Surabaya'
    ]
  ];

  getDatas() {
    var axis = [];
    dataObj.forEach((element) {
      axis.add([element[0], element[1], element[2], element[3], element[4], element[5]]);
    });

    return axis;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _show = true;
      });
    });
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
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          BottomsheetDeveloper().createState().showInfoDeveloper(context, _dimens);
                        },
                        child: Image.asset(
                          DrawableX.imageAsset(AssetGambar.logo),
                          width: _dimens.setWidth(110.0),
                        ),
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
                  padding: EdgeInsets.only(
                      left: _dimens.setWidth(15.0),
                      right: _dimens.setWidth(15.0)),
                  child: Text(
                    'Scatter Grafik',
                    style: TextStyle(
                        fontFamily: 'Nunito', fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: _dimens.setHeight(15.0),
                ),
                _show ? Container(
                  padding: EdgeInsets.only(
                      left: _dimens.setWidth(15.0),
                      right: _dimens.setWidth(15.0)),
                  child: Echarts(
                    option: '''
    {
    tooltip: {
                      backgroundColor: 'rgba(255,255,255,0.7)',
                      formatter: function (param) {
                        var value = param.value;
                        return 'Tanggal : '+value[0]+'<br>'
                        + 'Price : Rp '+value[1]+'<br>'
                        + 'Warna : '+value[3]+'<br>'
                        + 'km : '+value[4]+'<br>'
                        + 'Lokasi : '+value[5]+'<br>'
                        ;
                      }
                    },
      xAxis : [
        {        
            name: 'Waktu',
            type: 'time',
            axisLabel: {              
              formatter: {
              year: '{yyyy}',
              month: '',
              day: '',
              hour: '',
              minute: '',
              second: '',
              millisecond: '',
              none: '{yyyy}'
            },                            
              interval: 1,                
            },
        }
      ],
        dataset: {
          source: ${jsonEncode(getDatas())},
        },
      yAxis: {
        name: 'Harga',
        type: 'value',
        scale: false,
        axisLabel:{
          formatter: function (value, index) {            
            return value/1000000;
          }
        }
      },
      series:
      [{
        data: ${jsonEncode(getDatas())},
        type: 'scatter',
        symbolSize: 18,
        zlevel: 11,
        markPoint: {
          symbol: 'pin',
          symbolSize: 20,
          data: [
          { name: 'mark', xAxis: "${dataObj[_currentIndex][0].toString()}", yAxis: ${int.parse(dataObj[_currentIndex][1].toString())},
                  itemStyle: {
                    color: '#FF0000',
                  }
                }]
        },
      }]
      
    }
''',
                    extraScript: '''
                chart.on('click', (params) => {
                  if(params.componentType === 'series') {
                    Messager.postMessage(JSON.stringify({
                      type: 'select',
                      payload: params.dataIndex,                                    
                    }));
                  }
                });
''',
                    onMessage: (String message) {
                      jsonDecode(message);
                      var messageAction =
                          new Map<String, dynamic>.from(json.decode(message));
                      if (messageAction['type'] == 'select') {
                        var index = messageAction["payload"];
                        _controller.animateToPage(index);
                      }
                    },
                  ),
                  width: 300,
                  height: 250,
                ) : Container(),
                SizedBox(
                  height: _dimens.setHeight(20.0),
                ),
                carouselWdgt(context),
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

  List<Widget> imageSliders (BuildContext context) {
    return dataObj
        .map((item) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        Get.to(HomeDetailBanner(imgData: item[2], warna: item[3], price: item[1], tanggal: item[0], km: item[4], lokasi: item[5]));
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item[2],
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
                      '${item[3]}',
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
    )).toList();
  }

  Widget carouselWdgt(BuildContext context) {
    return Column(children: [
      CarouselSlider(
    items: imageSliders(context),
    carouselController: _controller,
    options: CarouselOptions(
        height: _dimens.setHeight(130.0),
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        }),
      ),
      Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: dataObj.asMap().entries.map((entry) {
      return GestureDetector(
        onTap: () => _controller.animateToPage(entry.key),
        child: Container(
          width: 12.0,
          height: 12.0,
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black)
                  .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4)),
        ),
      );
    }).toList(),
      ),
    ]);
  }
}
