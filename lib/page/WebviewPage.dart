import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'MyMaterialPage.dart';

class WebViewPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MyMaterialPage(
        "WebView演示",
        WebView(initialUrl: "https://stars-one.site",javascriptMode: JavascriptMode.unrestricted)
        );
  }

}