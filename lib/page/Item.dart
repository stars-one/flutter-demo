

import 'package:flutter/material.dart';
import 'package:flutter_demo/page/ButtonPage.dart';
import 'package:flutter_demo/page/DialogPage.dart';
import 'package:flutter_demo/page/LayoutPage.dart';
import 'package:flutter_demo/page/TabPage.dart';
import 'package:flutter_demo/page/TextPage.dart';
import 'package:flutter_demo/page/WebviewPage.dart';
import 'package:flutter_demo/utils/NavigatorUtil.dart';
import 'package:flutter_demo/page/ListViewPage.dart';

class Item extends StatelessWidget{
  int index;
  String title;

  Item(this.title,this.index);

  @override
  Widget build(BuildContext context) {
    return FlatButton(child: Text(title),onPressed: (){
      switch(this.index) {
        case 1:
          //跳转到对话框页面
          NavigatorUtil.push(context,DialogPage());
          break;
        case 2:
          NavigatorUtil.push(context,TextPage());
          break;
        case 3:
          NavigatorUtil.push(context,ButtonPage());
          break;
        case 4:
          NavigatorUtil.push(context,LayoutPage());
          break;
        case 5:
          NavigatorUtil.push(context,TabPage());
          break;
        case 6:
          NavigatorUtil.push(context,ListViewPage());
          break;
        case 7:
          NavigatorUtil.push(context,WebViewPage());
          break;
      }
    },);
  }

}