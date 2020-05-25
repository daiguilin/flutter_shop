/*
 * @Author: daiGuilin
 * @Date: 2020-05-17 16:42:17
 * @LastEditTime: 2020-05-25 10:44:51
 * @LastEditors: daiGuilin
 */
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  void _getCategory() async {
    await request('getCategory', null).then((val) {
      var data = jsonDecode(val.toString());
      print('分类--' + data);
    });
  }

  @override
  Widget build(BuildContext context) {
    _getCategory();
    return Container(
      child: Center(
        child: Text('sssss'),
      ),
    );
  }
}
