import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/services.dart';
import 'package:googleapis/vision/v1.dart' hide ImageSource;
import 'package:googleapis_auth/auth_io.dart';
import 'package:image_picker/image_picker.dart';

class ImageBloc implements BlocBase {
  ImageBloc() {
    _imageBase64.stream.listen(_search);
  }

  final _imageController = StreamController<File>();
  Stream<File> get outImage => _imageController.stream;
  Sink<File> get inImage => _imageController.sink;

  void get pickImage async {
    File _image = await ImagePicker.pickImage(source: ImageSource.camera);
    inImage.add(_image);
    inSearch.add(base64Encode(_image.readAsBytesSync()));
  }

  final _imageBase64 = StreamController<String>();
  Sink<String> get inSearch => _imageBase64.sink;

  Future get _credentials async {
    String _file = await rootBundle.loadString('assets/data/credentials.json');
    return ServiceAccountCredentials.fromJson(_file);
  }

  Future get _client async {
    var _c = await clientViaServiceAccount(
        await _credentials, [VisionApi.CloudVisionScope]).then((c) => c);
    return _c;
  }

  final _resultController = StreamController<String>();
  Stream<String> get outResult => _resultController.stream;
  Sink<String> get inResult => _resultController.sink;

  void _search(String image) async {
    var _vision = VisionApi(await _client);
    var _api = _vision.images;

        inResult.add('');


    var _response = await _api.annotate(BatchAnnotateImagesRequest.fromJson({
      "requests": [
        {
          "image": {"content": image},
          "features": [
            {"type": "WEB_DETECTION"}
          ]
        }
      ]
    }));

    _response.responses.forEach((data) {
      var _label = data.webDetection.bestGuessLabels;
      inResult.add(_label.single.label);
    });
  }

  @override
  void dispose() {
    _imageController.close();
    _imageBase64.close();
    _resultController.close();
  }
}
