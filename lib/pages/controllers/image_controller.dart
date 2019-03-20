import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:image_picker/image_picker.dart';

class ImageController implements BlocBase {
  ImageController();

  List<int> _imageBytes;

  StreamController<File> _imageController = StreamController<File>();
  Stream<File> get outImage => _imageController.stream;
  Sink<File> get inImage => _imageController.sink;

  void get pickImage async {
    File _image = await ImagePicker.pickImage(source: ImageSource.camera);
    _imageBytes = _image.readAsBytesSync();
    inImage.add(_image);
  }

  Future<String> get imageEncoded async {
    List<int> _imgBytes = _imageBytes;
    String _base64Image = base64Encode(_imgBytes);

    return _base64Image;
  }

  @override
  void dispose() {
    _imageController.close();
  }
}
