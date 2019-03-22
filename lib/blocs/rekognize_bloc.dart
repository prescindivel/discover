import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/blocs/image_bloc.dart';
import 'package:discover/providers/rekognize_provider.dart';

class RekognizeBloc implements BlocBase {
  final _rekognizeProvider = RekognizeProvider();
  final _imagebloc = ImageBloc();

  final _resultController = StreamController<String>();
  // Stream<String> get outResult => _resultController.stream;
  Sink<String> get inResult => _resultController.sink;

  final _isLoading = StreamController<bool>();
  Stream<bool> get outIsLoading => _isLoading.stream;
  Sink<bool> get inIsLoading => _isLoading.sink;

  void _search(String image) {
    print('searching');
    inIsLoading.add(true);
    _rekognizeProvider.search(image).then((onload) => inIsLoading.add(false));
  }

  RekognizeBloc() {
    _imagebloc.imageBase64.stream.listen((onValue) => print(onValue));
    _resultController.stream.listen(print);
  }

  @override
  void dispose() {
    _resultController.close();
    _isLoading.close();
  }
}
