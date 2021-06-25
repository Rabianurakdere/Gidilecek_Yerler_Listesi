import 'package:flutter/material.dart';

import 'travels.dart';

class TravelsManager extends StatelessWidget {
  final List<Map<String , dynamic>> travelpictures;

TravelsManager(this.travelpictures);
  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        
        Expanded(child:Travels(travelpictures))
      ],
    );
  }
}
