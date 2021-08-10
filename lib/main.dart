import 'package:flutter/material.dart';
import 'package:flutter_demo/page/DialogPage.dart';
import 'package:flutter_demo/page/Item.dart';
import 'package:flutter_demo/page/MyMaterialPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyMaterialPage("Widget的使用及演示",Center(
        child: Column(children: [
            Item("对话框demo", 1),
            Item("文本demo", 2),
            Item("按钮demo", 3),
            Item("布局demo", 4),
            Item("tabLayout的demo", 5),
            Item("listView的demo", 6),
            Item("webview", 7),
            Item("checkBox的demo", 8),
            Item("Dio网络框架Demo", 9),
        ],),
      )),
    );
  }
}


