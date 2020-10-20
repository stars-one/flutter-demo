
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/DialogPage.dart';
import 'package:flutter_demo/page/TabContentPage.dart';

class TabPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:
          Text('tab演示', style: TextStyle(color: Colors.white, fontSize: 18)),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(

              text: "标签1",
            ),
            Tab(
              text: "标签2",
            ),
          ],indicatorColor: Colors.white,labelStyle: TextStyle(fontSize: 16),),
        ),
        body: TabBarView(children: [
          TabContentPage("标签1"),
          TabContentPage("标签2"),
        ]),
      ),
    );
  }

}