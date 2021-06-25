import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';


class TravelFab extends StatefulWidget {
  bool isFavorite = false;

  @override
  State<StatefulWidget> createState() {
    return _TravelFabState();
  }
}

class _TravelFabState extends State<TravelFab> with TickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 70.0,
          width: 50.0,
          alignment: FractionalOffset.topCenter,
          child: ScaleTransition(
              scale: CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(0.0, 1.0, curve: Curves.easeOut)),
              child: FloatingActionButton(
                heroTag: 'mail',
                mini: true,
                backgroundColor: Theme.of(context).cardColor,
                onPressed: () {},
                child: Icon(
                  Icons.mail,
                  color: Theme.of(context).primaryColor,
                ),
              )),
        ),
        Container(
          height: 70.0,
          width: 50.0,
          child: ScaleTransition(
              scale: CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(0.0, 1.0, curve: Curves.easeOut)),
              child: FloatingActionButton(
                heroTag: 'Favorite',
                mini: true,
                backgroundColor: Theme.of(context).cardColor,
                onPressed: () {},
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).primaryColor,
                ),
              )),
        ),
        FloatingActionButton(
          heroTag: 'Options',
          mini: true,
          backgroundColor: Theme.of(context).cardColor,
          onPressed: () {
            if (_animationController.isDismissed) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          },
          child: Icon(
            Icons.more_vert,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
