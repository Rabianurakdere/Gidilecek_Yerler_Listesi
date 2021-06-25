import 'package:flutter/material.dart';

import './pages/auth.dart';
import './pages/home.dart';
import 'pages/travel_admin.dart';
import 'pages/travel.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  final List<Map<String , dynamic>> _travelpictures = [];
  void _addTravels(Map<String , dynamic> travel) {
    setState(() {
      _travelpictures.add(travel);
    });
  }

  void _deleteTravel(int index) {
    setState(() {
      _travelpictures.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.purple[100], brightness: Brightness.light),
      home: AuthPage(),
      routes: {
        '/traveladmin': (BuildContext context) => TravelAdminPage(_addTravels, _deleteTravel),
        '/admin': (BuildContext context) =>
            HomePage(_travelpictures),
           
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'travel') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => TravelPage(
                _travelpictures[index]['title'], _travelpictures[index]['image']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              HomePage(_travelpictures),
        );
      },
    );
  }
}
