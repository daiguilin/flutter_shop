/*
 * @Author: daiGuilin
 * @Date: 2020-05-17 16:42:45
 * @LastEditTime: 2020-05-26 11:39:16
 * @LastEditors: daiGuilin
 */
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Provide<Counter>(
        builder: (context, child, counter) {
          return Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.display1,
          );
        },
      ),
    ));
  }
}
