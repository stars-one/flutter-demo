import 'package:flutter/material.dart';

class MyMaterialPage extends StatelessWidget{
  String title;
  Widget content;

  MyMaterialPage(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: content
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}