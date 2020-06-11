import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/category_tile.dart';
import 'package:news_app/widgets/drawer.dart';
import 'package:news_app/widgets/search_article.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
    categories = getCategories();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

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
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchArticle(),
              );
            },
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerNameTile(),
            OsmrtniceTile(),
            TrgTile(),
            KamenskoTile(),
            PrisikaTile(),
            AppInfoTile(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                /* Container(
                  height: 70,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName);
                    },
                  ),
                ), */
                SizedBox(height: 10),
                Text(
                  widget.category.toUpperCase() ?? "ERROR 404",
                  style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  height: 30,
                  color: Colors.blue[700],
                  thickness: 2,
                ),
                _loading
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Container(
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
                              content: articles[index].content,
                            );
                          },
                        ),
                      ),
              ],
            )),
      ),
    );
  }
}
