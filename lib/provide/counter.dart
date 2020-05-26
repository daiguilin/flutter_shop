/*
 * @Author: daiGuilin
 * @Date: 2020-05-26 11:26:22
 * @LastEditTime: 2020-05-26 11:28:00
 * @LastEditors: daiGuilin
 */
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int value = 0;
  increment() {
    value++;
    notifyListeners();
  }
}
