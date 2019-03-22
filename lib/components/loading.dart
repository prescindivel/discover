import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/blocs/rekognize_bloc.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _isLoadingController = BlocProviderList.of<RekognizeBloc>(context);
    return StreamBuilder(
      stream: _isLoadingController.outIsLoading,
      initialData: true,
      builder: (context, snapshot) {
        // print(snapshot.data);
        return snapshot.data
            ? Container(
                color: Colors.white24,
                alignment: Alignment.center,
                child: CircularProgressIndicator())
            : Container();
      },
    );
  }
}
