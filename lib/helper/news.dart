import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

const _apiKey = "ebe13e8db20e49a295458f1fb45ca2b7";

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=gb&apiKey=$_apiKey";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"],
            publishedAt: element["publishedAt"],
          );
          news.add(articleModel);
        }
        /* else {
      throw Exception("Failed to get news");
    } */
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=gb&category=$category&apiKey=$_apiKey";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"],
            publishedAt: element["publishedAt"],
          );
          news.add(articleModel);
        }
        /* else {
          throw Exception("Failed to get news");
        } */
      });
    }
  }
}

class SearchNewsClass {
  List<SearchModel> searches = [];

  Future<void> getSearches(String query) async {
    String url =
        "https://newsapi.org/v2/everything?q=$query&sortBy=popularity&apiKey=$_apiKey";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          SearchModel searchModel = SearchModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["context"],
            publishedAt: element["publishedAt"],
          );
          searches.add(searchModel);
        }
      });
    }
  }
}
