import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'image.dart';

import 'package:myfirst_app/pages/image.dart';

class TravelCreatePage extends StatefulWidget {
  final Function addTravels;
  TravelCreatePage(this.addTravels);
  @override
  State<StatefulWidget> createState() {
    return _TravelCreatePageState();
  }
}

class _TravelCreatePageState extends State<TravelCreatePage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image':
        'https://seyahatdergisi.com/wp-content/uploads/2018/01/Niagara-Selalesi.jpg'
  };
  
  bool  _accept = false;
  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();
  Future<bool> _submitform() async {
    if (!_keyform.currentState.validate()) return false;
    _keyform.currentState.save();

    //widget.addTravels(_formData);
    try{
 await http
        .post(
            Uri.parse(
                'https://gidilecekyerlerlistesi-4c17b-default-rtdb.firebaseio.com/travels.json'),
            body: json.encode(_formData))
        .then((http.Response response) {
      if (response.statusCode != 200 && response.statusCode != 201)
        return false;
      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);
      fetchTravels();
    });
    }
    catch(e){
      return false;
    }
    
    final String dkey = '-McxBZM3pbPyYJnTem1q';
    /* http
        .put(
            Uri.parse(
                'https://gidilecekyerlerlistesi-4c17b-default-rtdb.firebaseio.com/travels/${dkey}.json'),
            body: json.encode(_formData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);
      fetchTravels();
    }); */
    /* http
        .delete(
            Uri.parse(
                'https://gidilecekyerlerlistesi-4c17b-default-rtdb.firebaseio.com/travels/${dkey}.json'),)
            
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);
      fetchTravels();
}); */
return true;
    //Navigator.pushReplacementNamed(context, '/admin');
  }

  void fetchTravels() {
    http
        .get(
      Uri.parse(
          'https://gidilecekyerlerlistesi-4c17b-default-rtdb.firebaseio.com/travels.json'),
    )
        .then((http.Response response) {
      final Map<String, dynamic> travelList = json.decode(response.body);
      travelList.forEach((String key, dynamic travelList) {
        print(key.toString() + ' ' + travelList['title'].toString());
      });
      print(json.decode(response.body));
    });
  }

  Widget _buildTitleTextField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Gidilecek Yer Adı'),
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Yer Adı Girilmeli veya En Az 5 Karakter olmalı';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        });
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
        maxLines: 4,
        decoration: InputDecoration(labelText: 'Ülke-Şehir'),
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Ülke- Şehir Girilmeli veya En Az 5 Karakter Olmalı';
          }
        },
        onSaved: (String value) {
          _formData['description'] = value;
        });
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Yaklaşık Maliyet'),
      validator: (String value) {
        if (value.isEmpty || value.length < 3) {
          return 'Yaklaşık Maliyet Girilmeli veya En Az 3 Karakter Olmalı';
        }
      },
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _keyform,
        child: ListView(
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceTextField(),

            SizedBox(
              height: 10.0,
            ),

            // RaisedButton(
            //  color: Theme.of(context).primaryColor,
            //  textColor: Colors.black,
            //  child: Text('Kaydet'),
            // onPressed: _submitform,
            // )
            ImageInput(),
            SizedBox(
              height: 10.0,
            ),
            GestureDetector(
              onTap: (() {
                _submitform().then((bool success) {
                  if (!success) {
                    showDialog(
                        context: context, builder: (BuildContext context) {
                          return AlertDialog(title: Text('Yanlış Bir Şeyler Var!')
                          , content: Text('Lütfen Tekrar Deneyin'),actions: <Widget>[
                            TextButton(child: Text('Tamam'),onPressed: (){
                              Navigator.pop(context);
                            } )
                          ],);
                        });
                  }
                });
              }),
              child: Container(
                color: Colors.purple[100],
                padding: EdgeInsets.all(2.0),
                child: Text('Kaydet'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
