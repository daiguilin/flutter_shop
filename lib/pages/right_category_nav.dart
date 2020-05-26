/*
 * @Author: daiGuilin
 * @Date: 2020-05-26 11:49:54
 * @LastEditTime: 2020-05-26 15:01:03
 * @LastEditors: daiGuilin
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/provide/child_category.dart';
import '../model/category.dart';
import 'package:provide/provide.dart';

class RightCategoryNav extends StatefulWidget {
  RightCategoryNav({Key key}) : super(key: key);

  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  List list = ['名酒', '宝丰', '北京二锅头'];
  Widget _rightInWell(BxMallSubDto item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(item.mallSubName,
            style: TextStyle(fontSize: ScreenUtil().setSp(28))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          child: Container(
            height: ScreenUtil().setHeight(80),
            width: ScreenUtil().setWidth(570),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.black12))),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: childCategory.childCategoryList.length,
                itemBuilder: (context, index) {
                  return _rightInWell(childCategory.childCategoryList[index]);
                }),
          ),
        );
      },
    ));
  }
}
