/*
 * @Author: daiGuilin
 * @Date: 2020-05-17 16:42:17
 * @LastEditTime: 2020-05-26 14:13:52
 * @LastEditors: daiGuilin
 */
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category_example.dart';
import './left_category_nav .dart';
import './right_category_nav.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // void _getCategory() async {
  //   await request('getCategory', null).then((val) {
  //     var data = jsonDecode(val.toString());
  //     // print(data);
  //     CategoryBigListModel list = CategoryBigListModel.formJson(data['data']);
  //     list.data.forEach((item) => print(item.mallCategoryName));
  //   });
  // }

  @override
  // void initState() {
  //   super.initState();
  //   _getCategory();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
          child: Row(
        children: <Widget>[
          LeftCategoryNav(),
          Column(
            children: <Widget>[RightCategoryNav()],
          )
        ],
      )),
    );
  }
}
