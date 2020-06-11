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
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      darkTheme: ThemeData(
        
        brightness: Brightness.dark,
        
      ),
      home: Home(),
    );
  }
}

//TODO: DRAWER FINISH !!!
//TODO: FINISH SEARCH BAR !!!
//TODO: IF CANT LOAD IMG LOAD REPLACEMENT !!!¸
//TODO: DRAWER MENU OPEN TABS IN WEBVIEW

