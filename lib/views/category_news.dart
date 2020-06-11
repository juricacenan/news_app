import 'package:flutter/material.dart';
import 'package:news_app/drawerscreens/kamensko.dart';
import 'package:news_app/drawerscreens/osmrtnice.dart';
import 'package:news_app/drawerscreens/prisika.dart';
import 'package:news_app/drawerscreens/trg.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/blog_tile.dart';
import 'package:news_app/widgets/category_tile.dart';
import 'package:news_app/widgets/search_article.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  CategoryNews({
    this.category,
  });

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
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/jure.jpg',
                    width: 80,
                    height: 80,
                    colorBlendMode: BlendMode.color,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Jurica Cenan",
                  ),
                  Text("App Developer"),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.people_outline),
              title: Text('Osmrtnice'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Osmrtnice()));
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Kamera Livno(Trg)'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Trg()));
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Kamera Kamensko'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Kamensko()));
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Kamera Prisika'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Prisika()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('App Info'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Container(
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
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.category.toUpperCase() ?? "ERROR 404",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(
                        height: 30,
                        color: Colors.blue[700],
                        thickness: 2,
                      ),
                      Container(
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
