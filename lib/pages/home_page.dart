/*
 * @Author: daiGuilin
 * @Date: 2020-05-17 16:41:56
 * @LastEditTime: 2020-05-17 22:52:31
 * @LastEditors: daiGuilin
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text('百姓生活+')),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data.toString());
            List<Map> swiper = (data['data']['slides'] as List).cast();
            return Column(
              children: <Widget>[SwiperDiy(swiperDateList: swiper)],
            );
          } else {
            return Center(
              child: Text('加载中。。。'),
            );
          }
        },
      ),
    ));
  }
}

//首页轮播
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;

  const SwiperDiy({Key key, this.swiperDateList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
      child: Swiper(
        itemCount: 3,
        itemBuilder: ((BuildContext context, int index) {
          return Image.network(
            "${swiperDateList[index]['image']}",
            fit: BoxFit.fill,
          );
        }),
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
