import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bug/logics/logics.dart';

class CameraPhotosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cameraPhotosBloc = Provider.of<CameraPhotosBloc>(context);
    return Container(
      child: StreamBuilder(
        stream: cameraPhotosBloc.cameraPhotos,
        builder: (context, snapshot) => snapshot.hasData
            ? ListView.builder(
                itemBuilder: (context, index) {
                  if (index >= snapshot.data.length) return null;
                  // var photoUrl = snapshot.data[index];
                  return Image(image: snapshot.data[index]);
                },
              )
            : Container(),
      ),
    );
  }
}
