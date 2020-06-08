import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'blog_tile.dart';

class SearchArticle extends SearchDelegate<String> {
  SearchArticle({String hintText = "Search for news..."})
      : super(searchFieldLabel: hintText);

  List<SearchModel> articles = new List<SearchModel>();

  @override
  List<Widget> buildActions(BuildContext context) {
    //  actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //  leading icon on the left appbar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //  show some result based on the selection
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
