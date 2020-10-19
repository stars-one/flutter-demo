import 'package:flutter/material.dart';

import 'MyMaterialPage.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var detailAddressController = TextEditingController();

    return MyMaterialPage(
        "文本演示",
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                  controller: detailAddressController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 3,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '详细地址',
                      hintStyle: TextStyle(fontSize: 14))),
            ),
            FlatButton(
              onPressed: () {
                print(detailAddressController.text.toString());
              },
              child: Text("获取输入框内容"),
            ),
            FlatButton(
              onPressed: () {
                detailAddressController.clear();
              },
              child: Text("清空内容"),
            ),
            FlatButton(
              onPressed: () {
                detailAddressController.text = "hello";
              },
              child: Text("修改内容为hello"),
            ),
          ],
        ));
  }
}
