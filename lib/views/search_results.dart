import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/blog_tile.dart';

class SearchResults extends StatefulWidget {
  final String query;
  SearchResults({this.query});

  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<SearchModel> searches = new List<SearchModel>();

  @override
  void initState() {
    super.initState();
    getSearchResults();
  }

  getSearchResults() async {
    SearchNewsClass newsClass = SearchNewsClass();
    await newsClass.getSearches(widget.query);
    searches = newsClass.searches;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: searches.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return BlogTile(
            imageUrl: searches[index].urlToImage,
            title: searches[index].title,
            description: searches[index].description,
            url: searches[index].url,
            publishedAt: searches[index].publishedAt,
            content: searches[index].content,
          );
        },
      ),
    );
  }
}
