import 'package:flutter/material.dart';
import 'travelfab.dart';
import 'travel_create.dart';
import 'travel_list.dart';

class TravelAdminPage extends StatelessWidget {
  final Function addTravels;
  final Function deleteTravel;
  TravelAdminPage(this.addTravels, this.deleteTravel);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Seçiniz'),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text('Gidilecek Yerler Listesi'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              ),
              
              
            ],
          ),
        ),
        appBar: AppBar(
            title: Text('Tarafını Seç'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Gidilecek Yer Olustur', icon: Icon(Icons.create)),
                Tab(text: 'Gidilecek Yerleri Listele', icon: Icon(Icons.list)),
               
              ],
            )),
        body: TabBarView(
          children: <Widget>[TravelCreatePage(addTravels), TravelListPage()],
        ),
          floatingActionButton: TravelFab(),
      ),
    );
  }
}
