/*
 * @Author: daiGuilin
 * @Date: 2020-05-26 10:28:12
 * @LastEditTime: 2020-05-26 15:18:42
 * @LastEditors: daiGuilin
 */
import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/child_category.dart';

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);

  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  var listIndex = 0; //索引
  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  void _getCategory() async {
    await request('getCategory', null).then((val) {
      var data = json.decode(val.toString());
      CategoryModel category = CategoryModel.fromJson(data);
      setState(() {
        list = category.data;
      });

      Provide.value<ChildCategory>(context)
          .getChildCategory(list[0].bxMallSubDto);
      // print(list[0].bxMallSubDto);
    });
  }

  Widget _leftInWell(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: () {
        var childList = list[index].bxMallSubDto;
        setState(() {
          listIndex = index;
        });
        Provide.value<ChildCategory>(context).getChildCategory(childList);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isClick ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(list[index].mallCategoryName,
            style: TextStyle(fontSize: ScreenUtil().setSp(28))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setHeight(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _leftInWell(index);
          }),
    );
  }
}
