import 'package:flutter/material.dart';

import '../travelsmanager.dart';


class HomePage extends StatelessWidget {
  final List<Map<String , dynamic>> travelpictures;

HomePage(this.travelpictures);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Seciniz'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Gidilecek Yerleri Yönet'),
              onTap: () {
                Navigator.pushNamed(context, '/traveladmin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Gidilecek Yerler Listesi'),
actions: <Widget> [
IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.white,
                onPressed: () {},
              )
],

      ),
      body: TravelsManager(travelpictures),
    );
  }
}
