import 'package:flutter/material.dart';
import 'package:news_app/drawerscreens/kamensko.dart';
import 'package:news_app/drawerscreens/osmrtnice.dart';
import 'package:news_app/drawerscreens/prisika.dart';
import 'package:news_app/drawerscreens/trg.dart';


class PrisikaTile extends StatelessWidget {
  const PrisikaTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.camera_alt),
      title: Text('Kamera Prisika'),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Prisika()));
      },
    );
  }
}

class KamenskoTile extends StatelessWidget {
  const KamenskoTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.camera_alt),
      title: Text('Kamera Kamensko'),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Kamensko()));
      },
    );
  }
}

class TrgTile extends StatelessWidget {
  const TrgTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.camera_alt),
      title: Text('Kamera Livno(Trg)'),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Trg()));
      },
    );
  }
}

class DrawerNameTile extends StatelessWidget {
  const DrawerNameTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
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
    );
  }
}

class OsmrtniceTile extends StatelessWidget {
  const OsmrtniceTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.people_outline),
      title: Text('Osmrtnice'),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Osmrtnice()));
      },
    );
  }
}

class AppInfoTile extends StatelessWidget {
  const AppInfoTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.info),
      title: Text('App Info'),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}