import 'dart:async';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({this.blogUrl});
  

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "LivNovosti",
          style: TextStyle(color: Colors.blue[700]),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(widget.blogUrl);
            },
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
         /* Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("LivnoNews"),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(widget.blogUrl);
              },
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0.0, */
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
