import 'package:flutter/material.dart';
import 'dart:async';
class TravelPage extends StatelessWidget {
  final String title;
  final String imgUrl;
  TravelPage(this.title, this.imgUrl);
  void _showAlertDialogForDelete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Emin misiniz?'),
            content: Text('Bu islem geri alinamaz !'),
            actions: <Widget>[
              TextButton(
                child: Text('iptal'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('Devam'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Geri Tusuna Basildi');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imgUrl),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(title),
            ),
            GestureDetector(
              onDoubleTap: ()=>Navigator.pushNamed(context, '/admin'),
              child: Container(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  _showAlertDialogForDelete(context);
                },
child: Text('DELETE'),
            )
              ),
            )
          ],
        ),
      ),
    );
    
  }
}
