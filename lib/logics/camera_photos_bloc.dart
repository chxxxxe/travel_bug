import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'logics.dart';

class CameraPhotosBloc extends CameraBloc {
  Stream<List<NetworkImage>> cameraPhotos;
  StreamController<List<NetworkImage>> streamController;
  CameraPhotosBloc() {
    getPhotosFromCamera();
    streamController = StreamController<List<NetworkImage>>.broadcast();
    cameraPhotos = streamController.stream;
  }
  Future<void> getPhotosFromCamera() async {
    var cameraContentSettings = getSettingsForCategory('contents')[0];
    // await _getPhotos(Uri.parse(cameraContentSettings.url), onCompleted);
    await _getPhotos(
        Uri.parse('http://192.168.1.2:8080/ccapi/ver100/contents/sd/100CANON'),
        onCompleted);
  }

  void onCompleted(Map<String, dynamic> content) {
    var myContent =
        (content['url'] as List).map((x) => NetworkImage(x)).toList();
    streamController.sink.add(myContent);
    streamController.close();
    //_getPhotos(Uri.parse(myContent['url'][0]), onCompleted);
  }

  Future<void> _getPhotos(
      Uri url, void Function(Map<String, dynamic>) onCompleted) async {
    var responseData = '';
    var client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) {
      return true;
    });
    try {
      await client.getUrl(Uri.parse('$url')).then((HttpClientRequest request) {
        return request.close();
      }).then((response) {
        response.transform(utf8.decoder).listen((contents) {
          responseData += contents;
        }).onDone(() {
          onCompleted(jsonDecode(responseData));
        });
      });
    } on Exception catch (e) {
      print(e);
    } finally {
      client.close();
    }
  }
}
