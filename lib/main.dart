import 'package:flutter/material.dart';
import 'package:news_app/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LivnoNews',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
    );
  }
}

//TODO GET RID OF WEBVIEW
//TODO SIDE MENU FOR CATEGORIES
//TODO LOGIN WITH FACEBOOK FOR COMMENTS
//TODO SHARE AND SEARCH 
//TODO PRIVATE API KEY
