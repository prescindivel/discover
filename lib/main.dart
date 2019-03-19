import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/pages/home/home.dart';
import 'package:discover/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<HomeController>(
        child: Home(),
        bloc: HomeController(),
      ),
    );
  }
}
