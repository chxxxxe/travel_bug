

import 'package:travel_bug/logics/base_bloc.dart';

class CameraBloc extends BaseBloc {
  var info = "http://192.168.1.2:8080/ccapi/ver100/deviceinformation";
  var get = true;
  var post = false;
  var put = false;
  var delete = false;

  var storage = "http://192.168.1.2:8080/ccapi/ver100/devicestatus/storage";

  var battery = "http://192.`68.1.2:8080/ccapi/ver100/devicestatus/battery";

  var temp = "http://192.168.1.2:8080/ccapi/ver100/devicestatus/temperature";

  var copyright = "http://192.168.1.2:8080/ccapi/ver100/functions/registerednam/copyright";
  var get = true;
  var put = true;
  var delete = true;

  var author = "http://192.168.1.2:8080/ccapi/ver100/functions/registeredname/author";

  var owner = "http://192.168.1.2:8080/ccapi/ver100/functions/registeredname/ownername";

  var nickname = "http://192.168.1.2:8080/ccapi/ver100/functions/registeredname/nickname";

  var datetime = "http://192.168.1.2:8080/ccapi/ver100/functions/datetime";
  var delete = false;

  var cardFormat = "http://192.168.1.2:8080/ccapi/ver100/functions/cardformat";
  var get = false;
  var post = true;
  var put = false;
}