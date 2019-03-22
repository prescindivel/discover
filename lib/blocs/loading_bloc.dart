import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class LoadingBloc implements BlocBase {
  final _isLoading = StreamController<bool>();
  Stream<bool> get outIsLoading => _isLoading.stream;
  Sink<bool> get inIsLoading => _isLoading.sink;

  @override
  void dispose() {
    _isLoading.close();
  }
}
