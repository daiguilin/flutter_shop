/*
 * @Author: daiGuilin
 * @Date: 2020-05-17 16:41:56
 * @LastEditTime: 2020-05-20 10:33:08
 * @LastEditors: daiGuilin
 */
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../service/service_method.dart';
import 'package:url_launcher/url_launcher.dart';
import './recommend.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  String homePageContent = '正在获取数据';
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    print('111111111111111111111111111');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(title: Text('百姓生活+')),
            body: SingleChildScrollView(
              child: FutureBuilder(
                future: getHomePageContent(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = jsonDecode(snapshot.data.toString());
                    List<Map> swiper = (data['data']['slides'] as List).cast();
                    List<Map> navigatorList =
                        (data['data']['category'] as List).cast();
                    String adPicture =
                        data['data']['advertesPicture']['PICTURE_ADDRESS'];
                    String leaderImage =
                        data['data']['shopInfo']['leaderImage'];
                    String leaderPhone =
                        data['data']['shopInfo']['leaderPhone'];
                    List<Map> recommendList =
                        (data['data']['recommend'] as List).cast(); // 商品推荐
                    return Column(
                      children: <Widget>[
                        SwiperDiy(swiperDateList: swiper),
                        TopNavigator(navigatorList: navigatorList),
                        AdBanner(adPicture: adPicture),
                        LeaderPhone(
                            leaderImage: leaderImage, leaderPhone: leaderPhone),
                        Recommend(recommendList: recommendList)
                      ],
                    );
                  } else {
                    return Center(
                      child: Text('加载中。。。'),
                    );
                  }
                },
              ),
            )));
  }
}

//首页轮播
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;

  const SwiperDiy({Key key, this.swiperDateList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('设备的像素密度：${ScreenUtil.pixelRatio}');
    print('设备的高：${ScreenUtil.screenHeight}');
    print('设备的宽：${ScreenUtil.screenWidth}');
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
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

//网格列表
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);
  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (navigatorList.length > 10) {
      this.navigatorList.removeRange(10, this.navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(), //注意：需要进行类型转换
      ),
    );
  }
}

//广告模块
class AdBanner extends StatelessWidget {
  final String adPicture;
  const AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}

//店长电话模块
class LeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话
  void _launchURL() async {
    String url = 'tel:' + leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  const LeaderPhone({Key key, this.leaderImage, this.leaderPhone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(onTap: _launchURL, child: Image.network(leaderImage)),
    );
  }
}
