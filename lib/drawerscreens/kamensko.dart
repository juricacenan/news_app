import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Kamensko extends StatefulWidget {
  @override
  _KamenskoState createState() => _KamenskoState();
}

class _KamenskoState extends State<Kamensko> {
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
        initialUrl: 'https://m.hak.hr/kamera.asp?g=2&k=192',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}