import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/blocs/image_bloc.dart';
import 'package:discover/components/image.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _imageController = BlocProviderList.of<ImageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text('Discover', style: TextStyle(color: Colors.black54)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ImageCover(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _imageController.pickImage,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
