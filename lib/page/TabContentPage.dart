import 'package:flutter/material.dart';

class TabContentPage extends StatelessWidget{
  String title;

  TabContentPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title),);
  }

}