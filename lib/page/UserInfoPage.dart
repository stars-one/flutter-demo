import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyMaterialPage.dart';

class UserInfoPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MyMaterialPage(
        "图片demo",
        Column(
          children: [
            Ink.image(image: AssetImage("images/head1.jpg"),width: 200,height: 200),
            Ink.image(image: AssetImage("images/tim.jpg"),width: 200,height: 200),
            Ink.image(image: NetworkImage("https://img1.baidu.com/it/u=211228414,420250473&fm=26&fmt=auto&gp=0.jpg"),width: 200,height: 200)
          ],
        ));
  }

}