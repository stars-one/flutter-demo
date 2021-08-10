import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/city_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'MyMaterialPage.dart';

class DioTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DioTestState();
  }
}

class DioTestState extends State<DioTestPage> {
  List list = [];

  @override
  Widget build(BuildContext context) {
    return MyMaterialPage("Dio获取数据及展示", _listView());
  }

  @override
  void initState() {
    getCityData();
  }

  void getCityData() async {
    var dio = Dio();
    Response response = await dio.get('http://guolin.tech/api/china',
        options: Options(responseType: ResponseType.plain));
    var list = jsonDecode(response.data);

    var cityList =
    list.map((m) => new CityModel.fromJson(m)).toList();
    setState(() {
      this.list.addAll(cityList);
    });

  }

  Widget _listView() {
    return new ListView.builder(
      //listview的子项item数量
      itemCount: list.length,
      //内边距
      padding: new EdgeInsets.all(5.0),
      itemBuilder: (BuildContext context, int index) {
        //返回每个子项item的widget
        //城市名
        return _listItemView(list[index].name);
      },
    );
  }

  Widget _listItemView(String name) {
    return Row(
      children: [
        Center(
          child: Text(name),
        ),
      ],
    );
  }
}
