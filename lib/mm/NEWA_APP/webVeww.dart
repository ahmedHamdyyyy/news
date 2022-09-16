import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebVieww extends StatelessWidget {
final String uRL;

   WebVieww( this.uRL) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: uRL,
      )
    );
  }
}
