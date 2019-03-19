import 'dart:async';
import 'dart:io';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/providers/client_provider.dart';
import 'package:discover/providers/rekognizer_provider.dart';
import 'package:image_picker/image_picker.dart';

class HomeController implements BlocBase {
  HomeController();

  final ClientProvider _clientProvider = ClientProvider();
  final RekognizerProvider _rekognizerProvider = RekognizerProvider();

  StreamController<File> _homeController = StreamController<File>();

  Stream<File> get outImage => _homeController.stream;
  Sink<File> get inImage => _homeController.sink;

  void get image async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    inImage.add(image);
  }

  get bestGuessLabel async {
    var bestLabel = await _clientProvider.client.then((onClient) {
      return _rekognizerProvider.detectWeb(onClient);
    });

    return bestLabel;
  }

  @override
  void dispose() {
    _homeController.close();
  }
}
