import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';



class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {

    var response = await http.get(Constants.HEADLINESURL);
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
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {

    var response = await http.get(Constants.headlinesFor(category));
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
      });
    }
  }
}

class SearchNewsClass {
  List<SearchModel> searches = [];

  Future<void> getSearches(String query) async {
 

    var response = await http.get(Constants.headlinesFor(query));
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
