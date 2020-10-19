import 'package:flutter/material.dart';
import 'package:flutter_demo/page/MyMaterialPage.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyMaterialPage(
        "按钮演示",
        Center(
          child: Column(
            children: [
              FlatButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('搜索'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text('圆角按钮'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {},
              ),

            ],
          ),
        ));
  }
}
