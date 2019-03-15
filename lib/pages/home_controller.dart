import 'dart:async';
import 'dart:io';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:image_picker/image_picker.dart';

class HomeController implements BlocBase {
  HomeController();

  StreamController<File> _imageController = StreamController<File>();

  Stream<File> get outImage => _imageController.stream;
  Sink<File> get inImage => _imageController.sink;


  void getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    inImage.add(image);
  }


  @override
  void dispose() {
    _imageController.close();
  }
}
