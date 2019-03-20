// import 'dart:async';
// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:discover/pages/home/home_controller.dart';
// // import 'package:discover/providers/client_provider.dart';
// // import 'package:discover/providers/rekognizer_provider.dart';
// import 'package:googleapis/vision/v1.dart';

// class RekognizerController implements BlocBase {
//   RekognizerController() {
//     // _clientProvider.client
//         // .then((onClient) => _rekognizerProvider = RekognizerProvider(onClient));

//     // _imageController.outImage.listen((void _) async {
//       // _image = await _imageController.imageEncoded;

//     });
//   }

//   // var _image;

//   // final HomeController _imageController = HomeController();
//   // final ClientProvider _clientProvider = ClientProvider();
// // 
//   // RekognizerProvider _rekognizerProvider;

//   StreamController<List<WebEntity>> _entitiesController =
//       StreamController<List<WebEntity>>();
//   Stream<List<WebEntity>> get outEntities => _entitiesController.stream;
//   Sink<List<WebEntity>> get inEntities => _entitiesController.sink;

//   // get entities async {
//   //   var _img = await _image;
//   //   var _entities = await _clientProvider.client.then((onClient) {
//   //     return _rekognizerProvider.detectWeb(_img);
//   //   });

//   //   print(_entities);

//   //   _entitiesController.add(_entities);
//   // }

//   @override
//   void dispose() {
//     _entitiesController.close();
//   }
// }
