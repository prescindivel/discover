import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: _homeController.outImage,
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? Image.file(snapshot.data)
                  : Center(child: Text('No image selected.'));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            _homeController.client.then((onValue) => print(onValue)),
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
