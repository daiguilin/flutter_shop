/*
 * @Author: daiGuilin
 * @Date: 2020-05-21 15:12:14
 * @LastEditTime: 2020-05-21 15:14:05
 * @LastEditors: daiGuilin
 */
import 'package:flutter/material.dart';

class FloorTitle extends StatelessWidget {
  final String picture_address; // 图片地址
  const FloorTitle({Key key, this.picture_address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}
