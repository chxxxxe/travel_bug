// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

import 'dart:convert';
import 'dart:io';

import 'package:travel_bug/logics/base_bloc.dart';

class HomeBloc extends BaseBloc {
  String url = 'https://test.api.amadeus.com';
  String authUrlPath = '/v1/security/oauth2/token';
  String key = 'S7OIei9kDYqSYbcX1ByW3ZXZLSPGeGbL';
  String secret = 'DEAh7NF90GcAenFv';
  String _token = '';
  // HttpClient client;

  // Future<String> get token async {
  //   if (_token == '') await getAuthToken();
  //   return token;
  // }

  Future<void> getAuthToken(Function onDoneCallback) async {
    var client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) {
      return true;
    });
    try {
      Map<String, dynamic> jsonMap = {
        'grant_type': 'client_credentials',
        'client_id': key,
        'client_secret': secret,
      };
      String jsonString = json.encode(jsonMap); // encode map to json
      String paramName = 'param'; // give the post param a name
      String formBody = Uri.encodeQueryComponent(jsonString);
      List<int> bodyBytes = utf8.encode(formBody); // utf8 encode
      var body =
          'grant_type=client_credentials&client_id=$key&client_secret=$secret';
      await client
          .postUrl(Uri.parse('$url$authUrlPath'))
          .then((HttpClientRequest request) {
        request.headers.set(
            HttpHeaders.contentTypeHeader, 'application/x-www-form-urlencoded');
        request.headers
            .set(HttpHeaders.contentLengthHeader, body.length.toString());
        request.write(body);
        // request.add(bodyBytes);
        // request.add(data)
        return request.close();
      }).then((response) {
        response.transform(utf8.decoder).listen((contents) {
          _token = jsonDecode(contents)['access_token'];
          onDoneCallback();
        });
      });
    } on Exception catch (e) {
      print(e);
    } finally {
      client.close();
    }
  }

  // void getFlightInspiration(
  //     String origin, Function(dynamic) onCompleted) async {
  //   var urlPath = '/v1/shopping/flight-destinations?origin=$origin';
  //   getData(Uri.parse('$url$urlPath'), getFlightInspirationComplete);
  // }

  // void getFlightInspirationComplete(dynamic data) {
  //   print(data);
  //   notifyListeners();
  // }

  void getData(Uri url, Function(dynamic) onCompleted) async {
    if (_token == '') getAuthToken(() => _getData(url, onCompleted));
  }

  Future<void> _getData(Uri url, Function(dynamic) onCompleted) async {
    var responseData = '';
    var client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) {
      return true;
    });
    try {
      await client.getUrl(Uri.parse('$url')).then((HttpClientRequest request) {
        request.headers.add(HttpHeaders.authorizationHeader, 'Bearer $_token');
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
