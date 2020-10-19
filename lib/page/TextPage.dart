import 'package:flutter/material.dart';

import 'MyMaterialPage.dart';

class TextPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MyMaterialPage(
        "文本演示",
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                  //controller: detailAddressController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 3,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '详细地址',
                      hintStyle: TextStyle(fontSize: 14))),
            ),
          ],
        ));
  }

}
