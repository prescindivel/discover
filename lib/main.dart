import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/blocs/image_bloc.dart';
import 'package:discover/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        child: Home(),
        bloc: ImageBloc(),
      ),
    );
  }
}
