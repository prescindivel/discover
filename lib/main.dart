import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/pages/controllers/image_controller.dart';
import 'package:discover/pages/controllers/rekognizer_controller.dart';
import 'package:discover/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProviderList(
        child: Home(),
        listBloc: [
          Bloc(ImageController()),
          Bloc(RekognizerController())
        ],
      ),
    );
  }
}
