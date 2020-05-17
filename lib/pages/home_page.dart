/*
 * @Author: daiGuilin
 * @Date: 2020-05-17 16:41:56
 * @LastEditTime: 2020-05-17 22:05:37
 * @LastEditors: daiGuilin
 */
import 'package:flutter/material.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';
  @override
  void initState() {
    getHomePageContent().then((val) {
      setState(() {
        homePageContent = val.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(title: Text('美好人间')),
          body: SingleChildScrollView(child: Text(homePageContent))),
    );
  }
}
