import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/services.dart';
import 'package:googleapis/vision/v1.dart' hide ImageSource;
import 'package:googleapis_auth/auth_io.dart';
import 'package:image_picker/image_picker.dart';

class HomeController implements BlocBase {
  HomeController();

  List<int> _imageBytes;

  StreamController<File> _homeController = StreamController<File>();
  Stream<File> get outImage => _homeController.stream;
  Sink<File> get inImage => _homeController.sink;

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

  Future<ServiceAccountCredentials> get _credentials async {
    String _file = await rootBundle.loadString('assets/data/credentials.json');
    return ServiceAccountCredentials.fromJson(_file);
  }

  final List<String> _scopes = [VisionApi.CloudVisionScope];

  Future<AutoRefreshingAuthClient> get client async {
    AutoRefreshingAuthClient _client =
        await clientViaServiceAccount(await _credentials, _scopes)
            .then<AutoRefreshingAuthClient>((client) {
      return client;
    });

    return _client;
  }

  @override
  void dispose() {
    _homeController.close();
  }
}
