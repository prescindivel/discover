import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
// import 'package:googleapis/vision/v1.dart' hide Image, ImageSource;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final HomeController _homeController =
        BlocProvider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _homeController.outImage,
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? Image.file(snapshot.data)
                : Text('No image selected.');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _homeController.bestGuessLabel;
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
