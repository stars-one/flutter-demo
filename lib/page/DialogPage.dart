import 'package:flutter/material.dart';
import 'package:flutter_demo/page/MyMaterialPage.dart';

class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyMaterialPage(
        "对话框演示",
        InkWell(
            child: Text("点击出现对话框"),
            onTap: () {
              showDialog<void>(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                      title: Text("提示"),
                      content: Text("确定删除当前的知识库?"),
                      actions: [
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () {
                            Navigator.of(context).pop(); //关闭对话框
                          },
                        ),
                        FlatButton(
                            child: Text("确定"),
                            onPressed: () {
                              Navigator.of(context).pop(); //关闭对话框
                              print('删除成功');
                            })
                      ]);
                },
              );
            }));
  }
}
