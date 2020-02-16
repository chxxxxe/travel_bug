import 'package:flutter/material.dart';
import 'package:travel_bug/logics/camera_bloc.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cameraBloc = CameraBloc();

    return ListView.builder(
      itemCount: cameraBloc.categories.length,
      itemBuilder: (context, index) {
        var category = cameraBloc.categories[index];
        var categorySettings = cameraBloc.getSettingsForCategory(category);
        return Container(
          child: Column(children: [
            Center(
              child: Text(
                category,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(children: buildBuilder(categorySettings)),
          ]),
        );
      },
    );
  }

  buildBuilder(List<CameraSetting> categorySettings) {
    List<Widget> widgets = [];
    categorySettings.forEach(
      (camSetting) => widgets.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                camSetting.path,
                textAlign: TextAlign.start,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('get'),
                  Checkbox(
                    value: camSetting.get,
                    onChanged: null,
                  ),
                  Text('put'),
                  Checkbox(value: camSetting.put, onChanged: null),
                  Text('post'),
                  Checkbox(value: camSetting.post, onChanged: null),
                  Text('del'),
                  Checkbox(value: camSetting.delete, onChanged: null),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    return widgets;
  }
}
