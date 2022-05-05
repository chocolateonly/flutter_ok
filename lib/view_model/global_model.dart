import 'package:flutter/material.dart';
class GlobalModel extends ChangeNotifier {
  static const langList = ['zh', 'en', 'ms']; //中 英 马来文

  //   主题色
  static const _themeColor = Color(0xffD27633);

  get themeColor => _themeColor;

  themeData() {
    var themeData = ThemeData();
    return themeData;
  }

}
