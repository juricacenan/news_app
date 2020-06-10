import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleView extends StatelessWidget {
  final String blogImageUrl,
      blogTitle,
      blogDescription,
      blogUrl,
      blogPublishedAt,
      blogContent;
  ArticleView(
      {this.blogUrl,
      this.blogDescription,
      this.blogImageUrl,
      this.blogPublishedAt,
      this.blogTitle,
      this.blogContent});

/*   @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LivNovosti",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(blogUrl);
            },
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  blogTitle ?? "No Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    wordSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  DateFormat.yMMMMEEEEd('en-us')
                      .format(DateTime.parse(blogPublishedAt))
                      .toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(blogImageUrl) ??
                      AssetImage(
                        'assets/images/news.jpeg',
                      ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  blogDescription ?? "No Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 3,
                  ),
                ),
                Divider(
                  height: 30,
                  color: Colors.blue[700],
                  thickness: 2,
                ),
                Text(
                  blogContent ?? "No Contents",
                  style: TextStyle(
                    fontSize: 18,
                    wordSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
/*       body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ), */
    );
  }
}
