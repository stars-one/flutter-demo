import 'package:flutter/material.dart';

class NavigatorUtil{

  ///跳转到指定页面
  static Future push(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  /// 返回到之前的页面
  static popToBeforePage(BuildContext context, int index) {
    int saveIndex = 0;
    return Navigator.of(context).popUntil((route) {
      if (saveIndex == index) {
        return true;
      } else {
        saveIndex ++;
        return false;
      }
    });
  }
}