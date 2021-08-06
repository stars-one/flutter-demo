import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/model/tag_list_model.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CheckBoxState();
  }
}

class CheckBoxState extends State<CheckBoxPage> {
  //标签数据
  List<TagItem> tagList = [];

  //临时标签,后面评价提交需要
  List<TagItem> tempTagList = [];

  List typeList = ["非常不满意", "不满意", "基本满意", "满意", "非常满意"];

  //当前选择type的下标
  int selectType = 4;

  @override
  void initState() {
    //初始化数据(这里是暂时写死,实际中这里是调用接口)
    initTagData();
  }

  void initTagData() {
    var data = """{
    "code":200,
    "error":"",
    "ReturnValue":[{"generalstars":"1","tagid":"109759610348409856","tagname":"无理由超过法定办理时间","updatetime":"2020-06-12 17:38:00"},{"generalstars":"1","tagid":"6176177900787350","tagname":"在办事指南之外增加新的审批条件","updatetime":"2020-08-27 00:00:00"},{"generalstars":"1","tagid":"6176177900787351","tagname":"需提供办事指南之外的申报材料","updatetime":"2020-08-27 00:00:00"},{"generalstars":"1","tagid":"7176177890787535","tagname":"无理由超过法定办理时间","updatetime":"2020-08-27 00:00:00"},{"generalstars":"2","tagid":"6176177900787349","tagname":"未在承诺时间内办结","updatetime":"2020-08-27 00:00:00"},{"generalstars":"2","tagid":"6176177900787347","tagname":"没有提供材料样本","updatetime":"2020-08-27 00:00:00"},{"generalstars":"2","tagid":"6176177900787348","tagname":"没有提供材料清单","updatetime":"2020-08-27 00:00:00"},{"generalstars":"3","tagid":"119596473292723200","tagname":"22222","updatetime":"2020-06-12 17:38:00"},{"generalstars":"3","tagid":"6176177900787346","tagname":"在承诺的时间内办结","updatetime":"2020-08-27 00:00:00"},{"generalstars":"3","tagid":"6176177900787345","tagname":"提供申报材料样本","updatetime":"2020-08-27 00:00:00"},{"generalstars":"3","tagid":"6176177900787344","tagname":"一次性告知需要补正的材料","updatetime":"2020-08-27 00:00:00"},{"generalstars":"4","tagid":"6176177900787340","tagname":"填写一张表单就可以完成申报","updatetime":"2020-08-27 00:00:00"},{"generalstars":"4","tagid":"6176177900787341","tagname":"在线提交材料窗口核验","updatetime":"2020-08-27 00:00:00"},{"generalstars":"4","tagid":"6176177900787342","tagname":"一张清单告知全部申报材料","updatetime":"2020-08-27 00:00:00"},{"generalstars":"5","tagid":"7176177890787335","tagname":"一窗受理一次办结","updatetime":"2020-08-27 00:00:00"},{"generalstars":"5","tagid":"7176177890787235","tagname":"可以先受理后补材料","updatetime":"2020-08-27 00:00:00"},{"generalstars":"5","tagid":"7176177890787435","tagname":"不用提交证明","updatetime":"2020-08-27 00:00:00"}]
    }""";
    Map<String, dynamic> responseData = jsonDecode(data);
    var tagListModel = TagListModel.fromJson(responseData);
    if (tagListModel.code == 200) {
      //注意要使用setState,才会使UI发生变化(因为网络请求是耗时任务,可能界面渲染完毕后才能请求到数据)
      setState(() {
        tagList.addAll(tagListModel.tagItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("评价"),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Wrap(
              spacing: 10,
              children: [
                Center(
                  child: Column(
                    children: [
                      RatingBar(
                        rating: 5,
                        //默认选择5星
                        starCount: 5,
                        //总星星数目
                        //星星图标
                        icon: Icon(
                          Icons.star,
                          size: 40,
                          color: Colors.grey,
                        ),
                        spacing: 5.0,
                        size: 40,
                        isIndicator: false,
                        //是否可选半星
                        allowHalfRating: true,
                        onRatingCallback:
                            (double value, ValueNotifier<bool> isIndicator) {
                          //更改数据同时也要更改UI,所以使用setState方法
                          setState(() {
                            //注意 星级从1开始,selectType是下标,从0开始,需要减1
                            selectType = value.toInt() - 1;
                          });
                        },
                        color: Colors.amber,
                      ),
                      _tipText()
                    ],
                  ),
                )
              ],
            ),
          ),
          //标签选项
          Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.fromLTRB(10, 0, 15, 5),
              child: Column(
                children: _tagList(),
              )),
          Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.fromLTRB(10, 0, 15, 5),
              child: FlatButton(
                child: Text("提交"),
                onPressed: () {
                  //处理标签
                  var tagId = "";
                  for (var i = 0; i < tempTagList.length; i++) {
                    var item = tempTagList[i];
                    //查找选择的标签数据
                    if (item.flag) {
                      tagId += item.tagid + ",";
                    }
                  }
                  if (tagId.length>0) {
                    tagId = tagId.substring(0, tagId.length - 1);
                  }
                  print(tagId);
                },
              )),
        ],
      ),
    );
  }

  Widget _tipText() {
    //根据selectType变更UI
    return Text(typeList[selectType]);
  }

  List<Widget> _tagList() {
    List<Widget> widgetList = [];
    var list = this.tagList;
    tempTagList.clear();

    var star = selectType.toInt() + 1;
    for (var i = 0; i < list.length; i++) {
      var item = list[i];
      if (item.generalstars == star.toString()) {
        //存在临时表中,之后可以快速查找用户的选择
        tempTagList.add(item);
        var row = _tagView(item);
        widgetList.add(row);
      }
    }
    return widgetList;
  }

  Widget _tagView(item) {
    var str = item.tagname;
    return InkWell(
      child: Row(
        children: <Widget>[
          new Checkbox(
            value: item.flag,
            activeColor: Colors.blue,
            onChanged: (bool val) {
              // val 是布尔值
              this.setState(() {
                item.flag = val;
              });
            },
          ),
          Text(str),
        ],
      ),
      onTap: () {
        setState(() {
          item.flag = !item.flag;
        });
      },
    );
  }
}
