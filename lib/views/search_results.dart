import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/blog_tile.dart';

class SearchResults extends StatefulWidget {
  final String searchQuery;
  SearchResults({this.searchQuery});

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<ArticleModel> articles = new List<ArticleModel>();


  @override
  void initState() {
    super.initState();
    getSearchResults();
  }

  getSearchResults() async {
    SearchNewsClass newsClass = SearchNewsClass();
    await newsClass.getNews(widget.searchQuery);
    articles = newsClass.news;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: articles.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return BlogTile(
            imageUrl: articles[index].urlToImage,
            title: articles[index].title,
            description: articles[index].description,
            url: articles[index].url,
            publishedAt: articles[index].publishedAt,
          );
        },
      ),
    );
  }
}
