import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Trg extends StatefulWidget {
  @override
  _TrgState createState() => _TrgState();
}

class _TrgState extends State<Trg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LivNovosti",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: WebView(
        initialUrl: 'https://livideo.info/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}