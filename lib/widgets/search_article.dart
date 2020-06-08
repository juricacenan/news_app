import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
class SearchArticle extends SearchDelegate<String> {
  SearchArticle({String hintText = "Search for news..."})
      : super(searchFieldLabel: hintText);

  List<SearchModel> searches = new List<SearchModel>();

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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
