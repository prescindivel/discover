import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/blocs/image_bloc.dart';
import 'package:discover/components/loading.dart';
import 'package:flutter/material.dart';

class ImageCover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _imageController = BlocProviderList.of<ImageBloc>(context);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  StreamBuilder(
                      stream: _imageController.outImage,
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? Image.file(
                                snapshot.data,
                                fit: BoxFit.cover,
                              )
                            : Center(child: Text('No image selected'));
                      }),
                  Loading()
                ],
              ),
            ),
          )),
    );
  }
}
