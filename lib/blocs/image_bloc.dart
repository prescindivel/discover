import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:image_picker/image_picker.dart';

class ImageBloc implements BlocBase {
  final _imageController = StreamController<File>();
  Stream<File> get outImage => _imageController.stream;
  Sink<File> get inImage => _imageController.sink;

  void get pickImage async {
    File _image = await ImagePicker.pickImage(source: ImageSource.camera);
    inImage.add(_image);
    _inSearch.add(base64Encode(_image.readAsBytesSync()));
  }

  final imageBase64 = StreamController<String>();
  Sink<String> get _inSearch => imageBase64.sink;

  @override
  void dispose() {
    _imageController.close();
    imageBase64.close();
  }
}
