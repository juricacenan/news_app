import 'package:flutter/material.dart';
import 'package:news_app/views/article_view.dart';
import 'package:intl/intl.dart';
import 'package:news_app/helper/constants.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, url, publishedAt;
  BlogTile(
      {@required this.imageUrl,
      @required this.description,
      @required this.title,
      @required this.url,
      @required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(blogUrl: url),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(height: 8),
            Text(
              title,
              style: kTitleTextStyle,
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: kDescriptionTextStyle,
            ),
            SizedBox(height: 8),
            Text(
              DateFormat("dd/MM/yyyy hh:mm").format(DateTime.parse(publishedAt)),
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
