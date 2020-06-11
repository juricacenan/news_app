import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Prisika extends StatefulWidget {
  @override
  _PrisikaState createState() => _PrisikaState();
}

class _PrisikaState extends State<Prisika> {
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
        initialUrl: 'https://bihamk.ba/assets/video-surveillance/PRISIKA.jpg?time=1524185016',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}