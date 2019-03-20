import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/pages/controllers/image_controller.dart';
import 'package:discover/pages/controllers/rekognizer_controller.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ImageController _imageController =
        BlocProviderList.of<ImageController>(context);
    final RekognizerController _rekognizerController =
        BlocProviderList.of<RekognizerController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: _imageController.outImage,
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? Image.file(snapshot.data)
                  : Center(child: Text('No image selected.'));
            },
          ),
          StreamBuilder(
            stream: _rekognizerController.outEntities,
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? Text('hasData')
                  : RaisedButton(
                      child: Text('Load entities'),
                      onPressed: () => _rekognizerController.entities,
                    );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _imageController.pickImage,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
