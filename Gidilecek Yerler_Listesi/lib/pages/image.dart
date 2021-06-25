import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
  }
}


class _ImageInputState extends State<ImageInput> {
  File _imageFile;
  void _getImage(BuildContext context,ImageSource source) {
    ImagePicker.pickImage(source: source,maxWidth: 400.0).then((File image) {
      setState(() {
              _imageFile =image;
            });
            Navigator.pop(context);
    });
  }
/*class _ImageInputState extends State<ImageInput> {
  File _imageFile;
  void _getImage(BuildContext context, ImageSource source){
    ImagePicker.pickImage(source: source, maxWidth:400.0).then((File image) {
setState(() {
  _imageFile= image;
});
Navigator.pop(context);
    });
  }*/
  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
      
        context: context,
        builder: (BuildContext context) {
          return Container(
            
            height: 140.0,
            
            padding: EdgeInsets.all(10.0),
            
            child: Column(
              
              children: <Widget>[
                Text(
                  'Resim Seç',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: Theme.of(context).primaryColor,),
                  
                  child: Text('Kameradan'),
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: Theme.of(context).primaryColor,),
                  
                  child: Text('Galeriden'),
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(primary: Theme.of(context).primaryColor,),
          
            onPressed: () {

              _openImagePicker(context);
            },
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.camera_alt,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  'Resim Ekle',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            )),
        SizedBox(
          height: 10.0,
        ),
        _imageFile == null
            ? Text('Lütfen Bir Resim Seçin')
            : Image.file(
                _imageFile,
                fit: BoxFit.cover,
                height: 300,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
              )
      ],
    );
  }
}
