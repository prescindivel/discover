import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:discover/blocs/image_bloc.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _imageController = BlocProvider.of<ImageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text('Discover', style: TextStyle(color: Colors.black54)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          StreamBuilder<Object>(
              stream: _imageController.outImage,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Padding(
                        padding: EdgeInsets.all(16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.file(snapshot.data),
                        ),
                      )
                    : Expanded(
                        child: Center(child: Text('No image selected')),
                      );
              }),
          StreamBuilder(
            stream: _imageController.outResult,
            // initialData: '',
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.toString().length > 0) {
                  return Text(snapshot.data);
                } else if (snapshot.data.toString().length == 0) {
                  return CircularProgressIndicator();
                }
              } else {
                return Container();
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _imageController.pickImage,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
