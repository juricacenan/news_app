import 'package:flutter/material.dart';

const kTitleTextStyle =
    TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 18);
const kDescriptionTextStyle = TextStyle(
  color: Colors.black54,
);
const kCategoryNameTextStyle =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);

class Constants {
  static const String _APIKEY = "ebe13e8db20e49a295458f1fb45ca2b7";
  static const String HEADLINESURL = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$_APIKEY';

  static String headlinesFor(String category) {
    return 'http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$_APIKEY';
  }
}

