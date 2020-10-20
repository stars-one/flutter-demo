
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/MyMaterialPage.dart';

class ListViewPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MyMaterialPage("listview的演示",_listView());
  }
  Widget _listView(){
    //构造数据
    var nameList = ["张三"];
    for(var i=0;i<50;i++){
      nameList.add("张三$i");
    }
    return new ListView.builder(
      //listview的子项item数量
      itemCount: nameList.length,
      //内边距
      padding: new EdgeInsets.all(5.0),
      itemBuilder: (BuildContext context, int index) {
        //返回每个子项item的widget
        //这里我只是简单拿到数据列表中的数据,并以此为参数构造成了显示姓名的Widget
        return _listItemView(nameList[index]);
      },
    );
  }
  Widget _listItemView(String name){
    return Row(
      children: [
        Center(child: Text(name),),
      ],
    );
  }
}