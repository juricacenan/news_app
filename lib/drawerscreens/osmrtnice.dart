import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Osmrtnice extends StatefulWidget {
  @override
  _OsmrtniceState createState() => _OsmrtniceState();
}

class _OsmrtniceState extends State<Osmrtnice> {
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
        initialUrl: 'https://osmrtnice.rip/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
