import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/page/MyMaterialPage.dart';

class LayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyMaterialPage(
        "布局演示",
        Column(
          children: [
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [new Text("left"), new Text("right")]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(child: new Text("left"),padding: EdgeInsets.only(left: 20),margin: EdgeInsets.only(right: 10),),
                  Container(child: new Text("right"),padding: EdgeInsets.only(right: 20),margin: EdgeInsets.only(left: 10),),
                ]),
          ],
        ));
  }
}
